Pokedex_FormMode:
	xor a
	ld [wPokedexFormShiny], a

	; curtain down to hide the fact we're rendering TWICE
	newfarcall Pokedex_BlackOutBG

	; draw right hand straggler portion of the screen first
	; since that isn't reached by the normal wTilemap transfer routine
	call .DrawRHS

	hlcoord 19, 17
	ld [hl], "T" ; last character of action menu (should be FORM but is PRNT for now)

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
		ld hl, vTiles2 tile $30
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

	ld e, MONICON_DEXFORM
	newfarcall LoadMenuMonIcon
	
	; curtain up
	; runs `__CGB_PokedexFormPage` which is in this file
	ld b, SCGB_POKEDEX_FORM_PAGE
	call GetSGBLayout

	call .reinit_anim

.wait_input
	newfarcall PlaySpriteAnimationsAndDelayFrame
	newfarcall SetUpPokeAnim
	call c, .reinit_anim
	ld hl, hJoypadPressed
	ld a, [hl]
	bit B_BUTTON_F, a
	jr nz, .b
	bit SELECT_F, a
	jr nz, .select
	newfarcall HDMATransferTilemapToWRAMBank3
	jr .wait_input
.b
	; TODO: fix the screen going back somehow
	newfarcall ClearSpriteAnims
	call ClearSprites
	ret
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
	jr .wait_input

; TODO: uhhhhhh
.reinit_anim
	ld a, [wCurPartySpecies]
	hlcoord 2, 4
	call _PrepMonFrontpic
	ld a, [wCurPartySpecies]
	ld de, vTiles2 tile $00
	predef GetAnimatedFrontpic
	hlcoord 2, 4
	ld d, $0
	ld e, ANIM_MON_MENU
	predef LoadMonAnimation
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

.DrawRHS:
	ldh a, [hBGMapAddress]
	ld l, a
	ldh a, [hBGMapAddress + 1]
	ld h, a
	push hl
	; shift target bgmap address by one row
		inc hl
		ld a, l
		ldh [hBGMapAddress], a
		ld a, h
		ldh [hBGMapAddress + 1], a

		; blank tile column
		hlcoord 19, 0
		ld a, $32
		ld b, 17
		call .fill_column
		hlcoord 19, 0, wAttrmap
		xor a
		ld b, 17
		call .fill_column

		; top right
		hlcoord 19, 3
		ld [hl], $66
		hlcoord 19, 3, wAttrmap
		ld [hl], 0
	
		; right
		hlcoord 19, 4
		ld a, $67 ; right
		ld b, 7
		call .fill_column
		ld [hl], $68 ; bottom right
		hlcoord 19, 4, wAttrmap
		xor a
		ld b, 7
		call .fill_column
		ld [hl], 0 ; bottom right

		; right edge of action menu
		hlcoord 19, 17
		ld [hl], $3c
		hlcoord 19, 17, wAttrmap
		ld [hl], 0
		call WaitBGMap2
	pop hl
	ld a, l
	ldh [hBGMapAddress], a
	ld a, h
	ldh [hBGMapAddress + 1], a
	ret
.fill_column
; Another local duplicate of Pokedex_FillColumn
	push de
	ld de, SCREEN_WIDTH
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	pop de
	ret

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
