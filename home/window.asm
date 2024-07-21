RefreshScreen::
	call ClearWindowData
	ldh a, [hROMBank]
	push af
	ld a, BANK(ReanchorBGMap_NoOAMUpdate) ; aka BANK(LoadFonts_NoOAMUpdate)
	rst Bankswitch

	call ReanchorBGMap_NoOAMUpdate
	call _OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
	call LoadFonts_NoOAMUpdate

	pop af
	rst Bankswitch
	ret

CloseText::
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a

	call .CloseText

	pop af
	ldh [hOAMUpdate], a
	ld hl, wVramState
	res 6, [hl]
	ld hl, wWeatherFlags
	res OW_WEATHER_DISABLED_F, [hl]
	ret

.CloseText:
	call ClearWindowData
	xor a
	ldh [hBGMapMode], a
	call OverworldTextModeSwitch
	call _OpenAndCloseMenu_HDMATransferTilemapAndAttrmap
	xor a
	ldh [hBGMapMode], a
	call SafeUpdateSprites
	ld a, $90
	ldh [hWY], a
	call UpdatePlayerSprite
	farcall InitMapNameSign
	farcall LoadOverworldFont
	ret

OpenText::
	ld hl, wWeatherFlags
	set OW_WEATHER_DISABLED_F, [hl]
	call ClearWindowData
	ldh a, [hROMBank]
	push af
	ld a, BANK(ReanchorBGMap_NoOAMUpdate) ; aka BANK(LoadFonts_NoOAMUpdate)
	rst Bankswitch

	call ClearSpritesUnderTextbox
	call ReanchorBGMap_NoOAMUpdate ; clear bgmap
	call SpeechTextbox
	call _OpenAndCloseMenu_HDMATransferTilemapAndAttrmap ; anchor bgmap
	call LoadFonts_NoOAMUpdate ; load font
	pop af
	rst Bankswitch

	ret

ClearSpritesUnderTextbox::
	ld de, wShadowOAM
	ld h, d
	ld l, e
	ld c, NUM_SPRITE_OAM_STRUCTS
.loop
	; check if YCoord ≥ (TEXTBOX_Y + 1) * TILE_WIDTH
	ld a, [hl]
	cp (TEXTBOX_Y + 1) * TILE_WIDTH
	jr nc, .clear_sprite
.next
	ld hl, SPRITEOAMSTRUCT_LENGTH
	add hl, de
	ld e, l
	dec c
	jr nz, .loop
	ldh a, [hOAMUpdate]
	push af
	ld a, TRUE
	ldh [hOAMUpdate], a
	call DelayFrame
	pop af
	ldh [hOAMUpdate], a
	ret

.clear_sprite
	ld [hl], OAM_YCOORD_HIDDEN
	jr .next

_OpenAndCloseMenu_HDMATransferTilemapAndAttrmap::
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a

	farcall OpenAndCloseMenu_HDMATransferTilemapAndAttrmap

	pop af
	ldh [hOAMUpdate], a
	ret

SafeUpdateSprites::
	ldh a, [hOAMUpdate]
	push af
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [hOAMUpdate], a

	call UpdateSprites

	xor a
	ldh [hOAMUpdate], a
	call DelayFrame
	pop af
	ldh [hBGMapMode], a
	pop af
	ldh [hOAMUpdate], a
	ret
