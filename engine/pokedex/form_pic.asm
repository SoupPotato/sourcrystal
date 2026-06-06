Pokedex_FormMode:
	xor a
	ld [wPokedexFormShiny], a

	newfarcall ClearSpriteAnims

	; curtain down
	newfarcall Pokedex_BlackOutBG

	hlcoord 19, 17
	ld [hl], "M" ; last character of action menu

	; now do the main screen
	decoord 0, 0
	ld hl, FormBackgroundTilemap
	call Decompress

	hlcoord 3, 2
	ld de, .FrontText
	call PlaceString

	hlcoord 14, 2
	ld de, .BackText
	call PlaceString

	hlcoord 3, 15
	ld de, .SelectText
	call PlaceString

	; NORMAL / SHINY
	hlcoord 11, 15
	ld de, .NormalText
	call PlaceString

	hlcoord 2, 4
	newfarcall PlaceFrontpicAtHL

	hlcoord 13, 5
	call PlaceBackpicAtHL

	ldh a, [rVBK]
	push af
		; backpic to VRAM bank 1
		ld a, 1
		ldh [rVBK], a
		ld de, vTiles1
		predef GetMonBackpic

		; also ensure blank tile is cleared
		ld hl, vTiles2 tile 0
		ld de, .BlankTile
		lb bc, BANK(.BlankTile), 1
		call Request1bpp
	pop af
	ldh [rVBK], a

	; print mon species
	call GetPokemonName
	hlcoord 5, 12
	call PlaceString

	call CopyTilemapAtOnce

	; right hand side is drawn here
	call .refresh

	ld e, MONICON_DEXFORM
	newfarcall LoadMenuMonIcon
	
	; curtain up
	; runs `__CGB_PokedexFormPage` which is in this file
	ld b, SCGB_POKEDEX_FORM_PAGE
	call GetSGBLayout

	ld a, [wCurPartySpecies]
	hlcoord 2, 4
	call _PrepMonFrontpic
	ld a, [wCurPartySpecies]
	ld de, vTiles2 tile $00
	predef GetAnimatedFrontpic
	call .reinit_anim

; The form page here takes control of the Pokedex loop,
; since it has to update its own sprites.
; Which also means it has to handle the menu thing itself
; as well.
.wait_input
	call .refresh
	newfarcall PlaySpriteAnimations
	newfarcall SetUpPokeAnim
	call c, .reinit_anim

	assert BANK(DexEntryScreen_ArrowCursorData) == BANK(Pokedex_MoveArrowCursor)
	ld de, DexEntryScreen_ArrowCursorData
	newfarcall Pokedex_MoveArrowCursor

	ld hl, hJoypadPressed
	ld a, [hl]
	bit B_BUTTON_F, a
	jr nz, .b
	bit A_BUTTON_F, a
	jr nz, .a
	bit SELECT_F, a
	jr nz, .select
	jr .wait_input

.a
	ld a, [wDexArrowCursorPosIndex]
	and a
	jr z, .b
	cp 3 ; FORM
	jr z, .wait_input
	newfarjp Pokedex_DoFormScreenAction

.b
	xor a
	ld [wDexArrowCursorPosIndex], a
	newfarcall Pokedex_BlackOutBG
	newfarcall ClearSpriteAnims
	call ClearSprites
	newfarcall DrawDexEntryScreenRightEdge
	ld a, DEXSTATE_REINIT_DEX_ENTRY_SCR
	ld [wJumptableIndex], a
	newfarjp Pokedex_ReinitDexEntryScreen

.select
	ld a, [wCurPartySpecies]
	cp -1
	jr z, .wait_input

	; show NORMAL text at first
	hlcoord 11, 15
	ld de, .NormalText
	call PlaceString

	ld hl, wPokedexFormShiny
	ld a, 1
	xor [hl]
	ld [hl], a
	and a
	
	push af
		ld a, [wCurPartySpecies]
		newfarcall _GetMonPalettePointer
	pop af
	jr z, .normal

	; get shiny color
	inc hl
	inc hl
	inc hl
	inc hl

	; render SHINY indicator
	push hl
		hlcoord 11, 15
		ld de, .ShinyText
		call PlaceString
	pop hl
.normal
	ld de, wBGPals2 palette 1
	newfarcall LoadPalette_White_Col1_Col2_Black
	call ApplyPals
	ld a, 1
	ldh [hCGBPalUpdate], a

	; TODO: what to do for the icon? shinies don't have unique icon colors
	;       do they?
	jp .wait_input


.reinit_anim
	hlcoord 2, 4
	lb de, 0, ANIM_MON_DEX_FORM
	predef LoadMonAnimation
	ret

.refresh
	ldh a, [rSVBK]
	push af
		ld a, BANK(wScratchAttrmap)
		ldh [rSVBK], a

		ld hl, wScratchAttrmap
		ld de, .RightHandSideColumn
		ld c, SCREEN_HEIGHT
		.simple_loop
			ld a, [de]
			ld [hli], a
			inc de
			dec c
			jr nz, .simple_loop
	pop af
	ldh [rSVBK], a
	newfarcall HDMATransferDexTilemapToWRAMBank3
	ret

.BlankTile:
rept 8
	db 0
endr

.FrontText:
	db "FRONT@"

.BackText:
	db "BACK@"

.SelectText:
	db "SELECT: @"

.NormalText:
	db "NORMAL@"

.ShinyText:
	db "SHINY @"

.RightHandSideColumn:
	db $32, $32, $32
	db $66, $67, $67, $67, $67, $67, $67, $67, $68
	db $32, $32, $32, $32, $32
	db $3c
	assert @-.RightHandSideColumn == SCREEN_HEIGHT

__CGB_PokedexFormPage:
; dupe of _CGB_Pokedex
; linked to from cgb_layouts.asm
	ld de, wBGPals1
	ld a, PREDEFPAL_POKEDEX
	newfarcall GetPredefPal
	newfarcall LoadHLPaletteIntoDE ; dex interface palette
	ld a, [wCurPartySpecies]
	cp $ff
	jr nz, .is_pokemon
	ld hl, .QuestionMarkPaletteDupe ; green question mark palette
	newfarcall LoadHLPaletteIntoDE
	jr .got_palette
.is_pokemon
	newfarcall _GetMonPalettePointer
	newfarcall LoadPalette_White_Col1_Col2_Black
.got_palette
	newfarcall WipeAttrmap
	; front pic
	hlcoord 2, 4, wAttrmap
	lb bc, 7, 7
	ld a, 1
	newfarcall FillBoxCGB
	; backpic
	hlcoord 13, 4, wAttrmap
	lb bc, 7, 7
	ld a, VRAM_BANK_1 | 1
	newfarcall FillBoxCGB
	; color squares
	ld a, 1
	hlcoord 10, 4, wAttrmap
	ld [hli], a
	ld [hl], a
	hlcoord 10, 9, wAttrmap
	ld [hli], a
	ld [hl], a
	newfarcall InitPartyMenuOBPals
	newfarcall ApplyAttrmap
	newfarcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret
.QuestionMarkPaletteDupe:
INCLUDE "gfx/pokedex/question_mark.pal"

PlaceBackpicAtHL:
; copy of PlaceFrontpicAtHL
	ld a, $80 ; vTiles1
	ld b, $6
.row
	ld c, $6
	push af
	push hl
.col
	ld [hli], a
	add $6
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop af
	inc a
	dec b
	jr nz, .row
	ret

FormBackgroundTilemap:
INCBIN "gfx/pokedex/form_bg.tilemap.lz"
