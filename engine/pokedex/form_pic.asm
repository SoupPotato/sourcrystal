Pokedex_FormMode:
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
		ld de, vTiles2
		predef GetMonBackpic
	pop af
	ldh [rVBK], a

    ; print mon species
	call GetPokemonName
	hlcoord 5, 12
	call PlaceString

    call CopyTilemapAtOnce

	; TODO: load proper mon palettes as well
	ld e, MONICON_DEXFORM
	newfarcall LoadMenuMonIcon
    
    ; curtain up
	ld b, SCGB_POKEDEX_FORM_PAGE
    ;newfarcall Pokedex_GetSGBLayout
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $e0
	call DmgToCgbObjPal0

.wait_input
	newfarcall PlaySpriteAnimationsAndDelayFrame
	ld hl, hJoypadDown
	ld a, [hl]
	bit B_BUTTON_F, a
	jr nz, .b
	bit SELECT_F, a
	jr nz, .select
	jr .wait_input
.b
	; TODO: fix the screen going back somehow
	newfarcall ClearSpriteAnims
	call ClearSprites
    ret
.select
	; TODO: switch normal/shiny colors
	jr .wait_input

.FrontText:
    db "FRONT@"

.BackText:
    db "BACK@"

.SelectText:
    db "SELECT: @"

.NormalText:
    db "NORMAL@"

.ShinyText:
    db "SHINY@"

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
        hlcoord 19, 0
        ld a, $32 ; blank tile
        ld b, 17
        call .fill_column
        hlcoord 19, 3
        ld [hl], $66 ; top right
        hlcoord 19, 4
        ld a, $67 ; right
        ld b, 7
        call .fill_column
        ld [hl], $68 ; bottom right
	    hlcoord 19, 17
	    ld [hl], $3c ; right edge of action menu
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
	ld hl, PokedexQuestionMarkPalette
	newfarcall LoadHLPaletteIntoDE ; green question mark palette
	jr .got_palette
.is_pokemon
	newfarcall GetMonPalettePointer
	newfarcall LoadPalette_White_Col1_Col2_Black ; mon palette
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
	ld hl, PokedexCursorPalette
	ld de, wOBPals1 palette 7 ; green cursor palette
	ld bc, 1 palettes
	ld a, BANK(wOBPals1)
	call FarCopyWRAM
	newfarcall ApplyAttrmap
	newfarcall ApplyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a
    ret

PlaceBackpicAtHL:
; copy of PlaceFrontpicAtHL
	xor a
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
