; Pokégear cards
	const_def
	const POKEGEARCARD_CLOCK ; 0
	const POKEGEARCARD_MAP   ; 1
	const POKEGEARCARD_PHONE ; 2
	const POKEGEARCARD_RADIO ; 3
	const POKEGEARCARD_PAGER ; 4
NUM_POKEGEAR_CARDS EQU const_value

; PokegearJumptable.Jumptable indexes
	const_def
	const POKEGEARSTATE_CLOCKINIT       ; 0
	const POKEGEARSTATE_CLOCKJOYPAD     ; 1
	const POKEGEARSTATE_MAPCHECKREGION  ; 2
	const POKEGEARSTATE_JOHTOMAPINIT    ; 3
	const POKEGEARSTATE_JOHTOMAPJOYPAD  ; 4
	const POKEGEARSTATE_KANTOMAPINIT    ; 5
	const POKEGEARSTATE_KANTOMAPJOYPAD  ; 6
	const POKEGEARSTATE_PHONEINIT       ; 7
	const POKEGEARSTATE_PHONEJOYPAD     ; 8
	const POKEGEARSTATE_MAKEPHONECALL   ; 9
	const POKEGEARSTATE_FINISHPHONECALL ; a
	const POKEGEARSTATE_RADIOINIT       ; b
	const POKEGEARSTATE_RADIOJOYPAD     ; c
	const POKEGEARSTATE_PAGERINIT       ; d
	const POKEGEARSTATE_PAGERJOYPAD     ; e

PokeGear:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	call .InitTilemap
	call DelayFrame
.loop
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call PokegearJumptable
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .loop

.done
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	pop af
	ld [wVramState], a
	pop af
	ld [hInMenu], a
	pop af
	ld [wOptions], a
	call ClearBGPalettes
	xor a ; LOW(vBGMap0)
	ld [hBGMapAddress], a
	ld a, HIGH(vBGMap0)
	ld [hBGMapAddress + 1], a
	ld a, $90
	ld [hWY], a
	call ExitPokegearRadio_HandleMusic
	ret

.InitTilemap:
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	xor a
	ld [hSCY], a
	ld [hSCX], a
	ld a, $7
	ld [hWX], a
	call Pokegear_LoadGFX
	farcall ClearSpriteAnims
	call InitPokegearModeIndicatorArrow
	ld a, 8
	call SkipMusic
	ld a, LCDC_DEFAULT
	ld [rLCDC], a
	call TownMap_InitCursorAndPlayerIconPositions
	xor a
	ld [wJumptableIndex], a ; POKEGEARSTATE_CLOCKINIT
	ld [wPokegearCard], a ; POKEGEARCARD_CLOCK
	ld [wPokegearMapRegion], a ; JOHTO_REGION
	ld [wcf66], a
	ld [wPokegearPhoneScrollPosition], a
	ld [wPokegearPhoneCursorPosition], a
	ld [wPokegearPhoneSelectedPerson], a
	ld [wPokegearRadioChannelBank], a
	ld [wPokegearRadioChannelAddr], a
	ld [wPokegearRadioChannelAddr + 1], a
	ld [wPokegearPagerScrollPosition], a
	ld [wPokegearPagerCursorPosition], a
	call Pokegear_InitJumptableIndices
	call InitPokegearTilemap
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
	ld a, [hCGB]
	and a
	ret z
	ld a, %11100100
	call DmgToCgbObjPal0
	ret

Pokegear_LoadGFX:
	call ClearVBank1
	ld hl, TownMapGFX
	ld de, vTiles2
	ld a, BANK(TownMapGFX)
	call FarDecompress
	ld hl, PokegearGFX
	ld de, vTiles2 tile $30
	ld a, BANK(PokegearGFX)
	call FarDecompress
	ld hl, PokegearSpritesGFX
	ld de, vTiles0
	ld a, BANK(PokegearSpritesGFX)
	call Decompress
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP
	jr z, .ssaqua
	farcall GetPlayerIcon
	push de
	ld h, d
	ld l, e
	ld a, b
	; standing sprite
	push af
	ld de, vTiles0 tile $10
	ld bc, 4 tiles
	call FarCopyBytes
	pop af
	pop hl
	; walking sprite
	ld de, 12 tiles
	add hl, de
	ld de, vTiles0 tile $14
	ld bc, 4 tiles
	call FarCopyBytes
.pager
	ld hl, PagerCardIconSpecies
	ld de, vTiles0 tile $20
.loop
	ld a, [hli]
	and a
	ret z
	push hl
	push de
	ld e, a
	farcall LoadPagerMonIcon
	ld a, e
	pop de
	call FarCopyBytes
	pop hl
	jr .loop

.ssaqua
	ld hl, FastShipGFX
	ld de, vTiles0 tile $10
	ld bc, 8 tiles
	call CopyBytes
	jr .pager


Pokegear_CopySwarmIcon:
	ld a, [wSwarmSpecies]
	ld [wTempSpecies], a
	ld e, $60
	farcall FlyFunction_GetMonIcon
	ld hl, wSwarmFlags
	res SWARMFLAGS_LOAD_POKEGEAR_GFX_F, [hl]
	ret

FastShipGFX:
INCBIN "gfx/pokegear/fast_ship.2bpp"

InitPokegearModeIndicatorArrow:
	depixel 4, 2, 4, 0
	ld a, SPRITE_ANIM_INDEX_POKEGEAR_ARROW
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $0
	ret

AnimatePokegearModeIndicatorArrow:
	ld hl, wPokegearCard
	ld e, [hl]
	ld d, 0
	ld hl, .XCoords
	add hl, de
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret


.XCoords:
	db $9F ; POKEGEARCARD_CLOCK
	db $10 ; POKEGEARCARD_MAP
	db $00 ; POKEGEARCARD_PHONE
	db $30 ; POKEGEARCARD_PAGER
	db $20 ; POKEGEARCARD_RADIO

TownMap_GetCurrentLandmark:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp SPECIAL_MAP
	ret nz
	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation
	ret


TownMap_InitCursorAndPlayerIconPositions:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP
	jr z, .FastShip
	cp SPECIAL_MAP
	jr nz, .LoadLandmark
	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation
.LoadLandmark:
	ld [wPokegearMapPlayerIconLandmark], a
	ld [wPokegearMapCursorLandmark], a
	ret

.FastShip:
	ld [wPokegearMapPlayerIconLandmark], a
	ld a, NEW_BARK_TOWN
	ld [wPokegearMapCursorLandmark], a
	ret

Pokegear_InitJumptableIndices:
	ld a, POKEGEARSTATE_CLOCKINIT
	ld [wJumptableIndex], a
	xor a ; POKEGEARCARD_CLOCK
	ld [wPokegearCard], a
	ret

InitPokegearTilemap:
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $4f
	call ByteFill
	ld a, [wPokegearCard]
	maskbits NUM_POKEGEAR_CARDS
	add a
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return_from_jumptable
	push de
	jp hl

.return_from_jumptable
	call Pokegear_FinishTilemap
	farcall TownMapPals
	ld a, [wPokegearMapRegion]
	and a
	jr nz, .kanto_0
	xor a ; LOW(vBGMap0)
	ld [hBGMapAddress], a
	ld a, HIGH(vBGMap0)
	ld [hBGMapAddress + 1], a
	call .UpdateBGMap
	ld a, $90
	jr .finish

.kanto_0
	xor a ; LOW(vBGMap1)
	ld [hBGMapAddress], a
	ld a, HIGH(vBGMap1)
	ld [hBGMapAddress + 1], a
	call .UpdateBGMap
	xor a
.finish
	ld [hWY], a
	; swap region maps
	ld a, [wPokegearMapRegion]
	maskbits NUM_REGIONS
	xor 1
	ld [wPokegearMapRegion], a
	ret

.UpdateBGMap:
	ld a, [hCGB]
	and a
	jr z, .dmg
	ld a, $2
	ld [hBGMapMode], a
	ld c, 3
	call DelayFrames
.dmg
	call WaitBGMap
	ret


.Jumptable:
; entries correspond to POKEGEARCARD_* constants
	dw .Clock
	dw .Map
	dw .Phone
	dw .Radio
	dw .Pager

.Clock:
	ld de, ClockTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 14, 1
	ld de, .switch
	call PlaceString
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	call Pokegear_UpdateClock
	ret


.switch
	db "CLOCK@"

.Map:
	ld a, [wPokegearMapPlayerIconLandmark]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr nc, .kanto
.johto
	ld e, 0
	jr .ok

.kanto
	ld e, 1
.ok
	farcall PokegearMap
	ld a, $07
	ld bc, $12
	hlcoord 1, 2
	call ByteFill
	hlcoord 0, 2
	ld [hl], $06
	hlcoord 19, 2
	ld [hl], $17
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	ret


.Radio:
	ld de, RadioTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	ret


.Phone:
	ld de, PhoneTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	call .PlacePhoneBars
	call PokegearPhone_UpdateDisplayList
	ret


.PlacePhoneBars:
	hlcoord 17, 1
	ld a, $3c
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 17, 2
	inc a
	ld [hli], a
	call GetMapPhoneService
	and a
	ret nz
	hlcoord 18, 2
	ld [hl], $3f
	ret

.Pager:
	ld de, PagerTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	call PokegearPager_UpdateDisplayList
	ret

Pokegear_FinishTilemap:
	hlcoord 0, 0
	ld bc, $8
	ld a, $4f
	call ByteFill
	hlcoord 0, 1
	ld bc, $8
	ld a, $4f
	call ByteFill
	ld de, wPokegearFlags
	ld a, [de]
	bit POKEGEAR_MAP_CARD_F, a
	call nz, .PlaceMapIcon
	ld a, [de]
	bit POKEGEAR_RADIO_CARD_F, a
	call nz, .PlaceRadioIcon
	ld a, [de]
	bit POKEGEAR_PAGER_CARD_F, a
	call nz, .PlacePagerIcon
	hlcoord 0, 0
	ld a, $46
	call .PlacePokegearCardIcon
	ret

.PlaceMapIcon:
	hlcoord 2, 0
	ld a, $40
	jr .PlacePokegearCardIcon

.PlacePagerIcon:
	hlcoord 4, 0
	ld a, $44
	jr .PlacePokegearCardIcon

.PlaceRadioIcon:
	hlcoord 6, 0
	ld a, $42
.PlacePokegearCardIcon:
	ld [hli], a
	inc a
	ld [hld], a
	ld bc, $14
	add hl, bc
	add $f
	ld [hli], a
	inc a
	ld [hld], a
	ret

PokegearJumptable:
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to POKEGEARSTATE_* constants
	dw PokegearClock_Init
	dw PokegearClock_Joypad
	dw PokegearMap_CheckRegion
	dw PokegearMap_Init
	dw PokegearMap_JohtoMap
	dw PokegearMap_Init
	dw PokegearMap_KantoMap
	dw PokegearPhone_Init
	dw PokegearPhone_Joypad
	dw PokegearPhone_MakePhoneCall
	dw PokegearPhone_FinishPhoneCall
	dw PokegearRadio_Init
	dw PokegearRadio_Joypad
	dw PokegearPager_Init
	dw PokegearPager_Joypad

PokegearClock_Init:
	call InitPokegearTilemap
	ld hl, PokegearText_PressAnyButtonToExit
	call PrintText
	ld hl, wJumptableIndex
	inc [hl]
	call ExitPokegearRadio_HandleMusic
	ret

PokegearClock_Joypad:
	call .UpdateClock
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .quit
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and A_BUTTON | D_RIGHT
	ret z
	ld a, [wPokegearFlags]
	bit POKEGEAR_PHONE_CARD_F, a
	ld c, POKEGEARSTATE_PHONEINIT
	ld b, POKEGEARCARD_PHONE
	jr .done

.left
	ld a, [wPokegearFlags]
	bit POKEGEAR_RADIO_CARD_F, a
	jr z, .no_radio
	ld c, POKEGEARSTATE_RADIOINIT
	ld b, POKEGEARCARD_RADIO
	jr .done

.no_radio
	ld a, [wPokegearFlags]
	bit POKEGEAR_PAGER_CARD_F, a
	jr z, .no_pager
	ld c, POKEGEARSTATE_PAGERINIT
	ld b, POKEGEARCARD_PAGER
	jr .done

.no_pager
	ld a, [wPokegearFlags]
	bit POKEGEAR_MAP_CARD_F, a
	jr z, .no_map
	ld c, POKEGEARSTATE_MAPCHECKREGION
	ld b, POKEGEARCARD_MAP
	jr .done

.no_map
	ld a, [wPokegearFlags]
	bit POKEGEAR_PHONE_CARD_F, a
	ld c, POKEGEARSTATE_PHONEINIT
	ld b, POKEGEARCARD_PHONE
	jr .done

.done
	call Pokegear_SwitchPage
	ret

.quit
	ld a, $80
	ld [wJumptableIndex], a
	ret

.UpdateClock:
	xor a
	ld [hBGMapMode], a
	call Pokegear_UpdateClock
	ld a, $1
	ld [hBGMapMode], a
	ret

Pokegear_UpdateClock:
	hlcoord 3, 5
	lb bc, 5, 14
	call ClearBox
	ld a, [hHours]
	ld b, a
	ld a, [hMinutes]
	ld c, a
	decoord 6, 8
	farcall PrintHoursMins
	ld hl, .DayText
	bccoord 6, 6
	call PlaceHLTextAtBC
	ret

	db "ごぜん@"
	db "ごご@"

.DayText:
	text_jump UnknownText_0x1c5821
	db "@"


PokegearMap_CheckRegion:
	ld a, [wPokegearMapPlayerIconLandmark]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr nc, .kanto
.johto
	ld a, POKEGEARSTATE_JOHTOMAPINIT
	jr .done
	ret

.kanto
	ld a, POKEGEARSTATE_KANTOMAPINIT
.done
	ld [wJumptableIndex], a
	call ExitPokegearRadio_HandleMusic
	ret

PokegearMap_Init:
	call InitPokegearTilemap
	ld a, [wPokegearMapPlayerIconLandmark]
	call PokegearMap_InitPlayerIcon
	call PokegearMap_InitSwarmIcon
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_InitCursor
	ld a, c
	ld [wPokegearMapCursorObjectPointer], a
	ld a, b
	ld [wPokegearMapCursorObjectPointer + 1], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

PokegearMap_KantoMap:
	call TownMap_GetKantoLandmarkLimits
	jr PokegearMap_ContinueMap

PokegearMap_JohtoMap:
	ld d, SILVER_CAVE
	ld e, NEW_BARK_TOWN
PokegearMap_ContinueMap:
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .quit
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	call .DPad
	ret

.right
	ld a, [wPokegearFlags]
	bit POKEGEAR_PAGER_CARD_F, a
	jr z, .no_pager
	ld c, POKEGEARSTATE_PAGERINIT
	ld b, POKEGEARCARD_PAGER
	jr .done

.no_pager
	ld a, [wPokegearFlags]
	bit POKEGEAR_RADIO_CARD_F, a
	jr z, .quit
	ld c, POKEGEARSTATE_RADIOINIT
	ld b, POKEGEARCARD_RADIO
	jr .done

.quit
	ld c, POKEGEARSTATE_CLOCKINIT
	ld b, POKEGEARCARD_CLOCK
	jr .done

.left
	ld a, [wPokegearFlags]
	bit POKEGEAR_PHONE_CARD_F, a
	ld c, POKEGEARSTATE_PHONEINIT
	ld b, POKEGEARCARD_PHONE
	jr .done
.done
	call Pokegear_SwitchPage
	ret

.DPad:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret

.up
	ld hl, wPokegearMapCursorLandmark
	ld a, [hl]
	cp d
	jr c, .wrap_around_up
	ld a, e
	dec a
	ld [hl], a
.wrap_around_up
	inc [hl]
	jr .done_dpad

.down
	ld hl, wPokegearMapCursorLandmark
	ld a, [hl]
	cp e
	jr nz, .wrap_around_down
	ld a, d
	inc a
	ld [hl], a
.wrap_around_down
	dec [hl]
.done_dpad
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	ld a, [wPokegearMapCursorObjectPointer]
	ld c, a
	ld a, [wPokegearMapCursorObjectPointer + 1]
	ld b, a
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_UpdateCursorPosition
	ret

PokegearMap_InitPlayerIcon:
	push af
	depixel 0, 0
	ld b, SPRITE_ANIM_INDEX_RED_WALK
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_gender
	ld b, SPRITE_ANIM_INDEX_BLUE_WALK
.got_gender
	ld a, b
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $10
	pop af
	ld e, a
	push bc
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

PokegearMap_InitSwarmIcon:
	ld hl, wSwarmFlags
	bit SWARMFLAGS_SWARM_ACTIVE, [hl]
	ret z
	set SWARMFLAGS_LOAD_POKEGEAR_GFX_F, [hl]
	call Pokegear_CopySwarmIcon

	ld a, [wSwarmLandmark]
	push af
	depixel 0, 0
	ld a, SPRITE_ANIM_INDEX_PARTY_MON
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $60
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	pop af
	ld e, a
	push bc
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ld a, [wSwarmSpecies]
	dec a
	ld b, 0
	ld c, a
	ld hl, MonMenuIconPals
	add hl, bc
	ld a, BANK(MonMenuIconPals)
	call GetFarByte
	and $f0
	swap a
	ld d, a
	farcall InitPokegearSwarmOBPal
	ld a, 4
	ld hl, wVirtualOAMSprite08Attributes
	ld c, 4
	ld de, 4
.loop
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret

PokegearMap_InitCursor:
	push af
	depixel 0, 0
	ld a, SPRITE_ANIM_INDEX_POKEGEAR_ARROW
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $04
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	pop af
	push bc
	call PokegearMap_UpdateCursorPosition
	pop bc
	ret


PokegearMap_UpdateLandmarkName:
	push af
	hlcoord 8, 0
	lb bc, 2, 12
	call ClearBox
	pop af
	ld e, a
	push de
	farcall GetLandmarkName
	pop de
	farcall TownMap_ConvertLineBreakCharacters
	hlcoord 8, 0
	ld [hl], $34
	ret


PokegearMap_UpdateCursorPosition:
	push bc
	ld e, a
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret


TownMap_GetKantoLandmarkLimits:
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	jr z, .not_hof
	ld d, ROUTE_28
	ld e, PALLET_TOWN
	ret

.not_hof
	ld d, ROUTE_28
	ld e, VICTORY_ROAD
	ret


PokegearRadio_Init:
	call InitPokegearTilemap
	depixel 4, 10, 4, 4
	ld a, SPRITE_ANIM_INDEX_RADIO_TUNING_KNOB
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $08
	call _UpdateRadioStation
	ld hl, wJumptableIndex
	inc [hl]
	ret

PokegearRadio_Joypad:
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .quit
	ld a, [hl]
	and D_RIGHT
	jr nz, .quit
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [wPokegearRadioChannelAddr]
	ld l, a
	ld a, [wPokegearRadioChannelAddr + 1]
	ld h, a
	ld a, [wPokegearRadioChannelBank]
	and a
	ret z
	rst FarCall
	ret

.quit
	ld c, POKEGEARSTATE_CLOCKINIT
	ld b, POKEGEARCARD_CLOCK
	jr .switch_page

.left
	ld a, [wPokegearFlags]
	bit POKEGEAR_PAGER_CARD_F, a
	jr z, .no_pager
	ld c, POKEGEARSTATE_PAGERINIT
	ld b, POKEGEARCARD_PAGER
	jr .switch_page

.no_pager
	ld a, [wPokegearFlags]
	bit POKEGEAR_MAP_CARD_F, a
	jr z, .no_map
	ld c, POKEGEARSTATE_MAPCHECKREGION
	ld b, POKEGEARCARD_MAP
	jr .switch_page

.no_map
	ld a, [wPokegearFlags]
	bit POKEGEAR_PHONE_CARD_F, a
	ld c, POKEGEARSTATE_PHONEINIT
	ld b, POKEGEARCARD_PHONE
	jr .switch_page

.switch_page
	call Pokegear_SwitchPage
	ret


PokegearPhone_Init:
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [wPokegearPhoneScrollPosition], a
	ld [wPokegearPhoneCursorPosition], a
	ld [wPokegearPhoneSelectedPerson], a
	call InitPokegearTilemap
	call ExitPokegearRadio_HandleMusic
	ld hl, PokegearText_WhomToCall
	call PrintText
	ret

PokegearPhone_Joypad:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON | D_LEFT
	jr nz, .quit
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld hl, hJoyLast
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	call PokegearPhone_GetDPad
	ret

.quit
	ld c, POKEGEARSTATE_CLOCKINIT
	ld b, POKEGEARCARD_CLOCK
	jr .switch_page

.no_map
	ld a, [wPokegearFlags]
	bit POKEGEAR_PAGER_CARD_F, a
	jr z, .no_pager
	ld c, POKEGEARSTATE_PAGERINIT
	ld b, POKEGEARCARD_PAGER
	jr .switch_page

.no_pager
	ld a, [wPokegearFlags]
	bit POKEGEAR_RADIO_CARD_F, a
	jr z, .quit
	ld c, POKEGEARSTATE_RADIOINIT
	ld b, POKEGEARCARD_RADIO
	jr .switch_page


.right
	ld a, [wPokegearFlags]
	bit POKEGEAR_MAP_CARD_F, a
	jr z, .no_map
	ld c, POKEGEARSTATE_MAPCHECKREGION
	ld b, POKEGEARCARD_MAP
	jr .switch_page
.switch_page
	call Pokegear_SwitchPage
	ret

.a
	ld hl, wPhoneList
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wPokegearPhoneCursorPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	and a
	ret z
	ld [wPokegearPhoneSelectedPerson], a
	hlcoord 1, 4
	ld a, [wPokegearPhoneCursorPosition]
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	ld [hl], "▷"
	call PokegearPhoneContactSubmenu
	jr c, .quit_submenu
	ld hl, wJumptableIndex
	inc [hl]
	ret

.quit_submenu
	ld a, POKEGEARSTATE_PHONEJOYPAD
	ld [wJumptableIndex], a
	ret

PokegearPhone_MakePhoneCall:
	call GetMapPhoneService
	and a
	jr nz, .no_service
	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	xor a
	ld [hInMenu], a
	ld de, SFX_CALL
	call PlaySFX
	ld hl, .dotdotdot
	call PrintText
	call WaitSFX
	ld de, SFX_CALL
	call PlaySFX
	ld hl, .dotdotdot
	call PrintText
	call WaitSFX
	ld a, [wPokegearPhoneSelectedPerson]
	ld b, a
	call Function90199
	ld c, 10
	call DelayFrames
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	ld a, $1
	ld [hInMenu], a
	call PokegearPhone_UpdateCursor
	ld hl, wJumptableIndex
	inc [hl]
	ret

.no_service
	farcall Phone_NoSignal
	ld hl, .OutOfServiceArea
	call PrintText
	ld a, POKEGEARSTATE_PHONEJOYPAD
	ld [wJumptableIndex], a
	ld hl, PokegearText_WhomToCall
	call PrintText
	ret


.dotdotdot
	;
	text_jump UnknownText_0x1c5824
	db "@"


.OutOfServiceArea:
	; You're out of the service area.
	text_jump UnknownText_0x1c5827
	db "@"


PokegearPhone_FinishPhoneCall:
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret z
	farcall HangUp
	ld a, POKEGEARSTATE_PHONEJOYPAD
	ld [wJumptableIndex], a
	ld hl, PokegearText_WhomToCall
	call PrintText
	ret

PokegearPhone_GetDPad:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret

.up
	ld hl, wPokegearPhoneCursorPosition
	ld a, [hl]
	and a
	jr z, .scroll_page_up
	dec [hl]
	jr .done_joypad_same_page

.scroll_page_up
	ld hl, wPokegearPhoneScrollPosition
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jr .done_joypad_update_page

.down
	ld hl, wPokegearPhoneCursorPosition
	ld a, [hl]
	cp PHONE_OR_PAGER_HEIGHT - 1
	jr nc, .scroll_page_down
	inc [hl]
	jr .done_joypad_same_page

.scroll_page_down
	ld hl, wPokegearPhoneScrollPosition
	ld a, [hl]
	cp CONTACT_LIST_SIZE - PHONE_OR_PAGER_HEIGHT
	ret nc
	inc [hl]
	jr .done_joypad_update_page

.done_joypad_same_page
	xor a
	ld [hBGMapMode], a
	call PokegearPhone_UpdateCursor
	call WaitBGMap
	ret

.done_joypad_update_page
	xor a
	ld [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	call WaitBGMap
	ret

PokegearPhone_UpdateCursor:
	call ClearPhoneOrPagerCursors
	hlcoord 1, 4
	ld a, [wPokegearPhoneCursorPosition]
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld [hl], "▶"
	ret

PokegearPhone_UpdateDisplayList:
	call ClearPhoneOrPagerArea
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	ld hl, wPhoneList
	add hl, de
	xor a
	ld [wPokegearPhoneLoadNameBuffer], a
.loop
	ld a, [hli]
	push hl
	push af
	hlcoord 2, 4
	ld a, [wPokegearPhoneLoadNameBuffer]
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld d, h
	ld e, l
	pop af
	ld b, a
	call Function90380
	pop hl
	ld a, [wPokegearPhoneLoadNameBuffer]
	inc a
	ld [wPokegearPhoneLoadNameBuffer], a
	cp PHONE_OR_PAGER_HEIGHT
	jr c, .loop
	call PokegearPhone_UpdateCursor
	ret


PokegearPhone_DeletePhoneNumber:
	ld hl, wPhoneList
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wPokegearPhoneCursorPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], 0
	ld hl, wPhoneList
	ld c, CONTACT_LIST_SIZE
.loop
	ld a, [hli]
	and a
	jr nz, .skip
	ld a, [hld]
	ld [hli], a
	ld [hl], 0
.skip
	dec c
	jr nz, .loop
	ret


PokegearPhoneContactSubmenu:
	ld hl, wPhoneList
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wPokegearPhoneCursorPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld c, [hl]
	farcall CheckCanDeletePhoneNumber
	ld a, c
	and a
	jr z, .cant_delete
	ld hl, .CallDeleteCancelJumptable
	ld de, .CallDeleteCancelStrings
	jr .got_menu_data

.cant_delete
	ld hl, .CallCancelJumptable
	ld de, .CallCancelStrings
.got_menu_data
	xor a
	ld [hBGMapMode], a
	push hl
	push de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	inc de
	push hl
	ld bc, hBGMapAddress + 1
	add hl, bc
	ld a, [de]
	inc de
	sla a
	ld b, a
	ld c, 8
	push de
	call TextBox
	pop de
	pop hl
	inc hl
	call PlaceString
	pop de
	xor a
	ld [wPokegearPhoneSubmenuCursor], a
	call .UpdateCursor
	call WaitBGMap
.loop
	push de
	call JoyTextDelay
	pop de
	ld hl, hJoyPressed
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	call DelayFrame
	jr .loop

.d_up
	ld hl, wPokegearPhoneSubmenuCursor
	ld a, [hl]
	and a
	jr z, .loop
	dec [hl]
	call .UpdateCursor
	jr .loop

.d_down
	ld hl, 2
	add hl, de
	ld a, [wPokegearPhoneSubmenuCursor]
	inc a
	cp [hl]
	jr nc, .loop
	ld [wPokegearPhoneSubmenuCursor], a
	call .UpdateCursor
	jr .loop

.a_b
	xor a
	ld [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	ld a, $1
	ld [hBGMapMode], a
	pop hl
	ld a, [hJoyPressed]
	and B_BUTTON
	jr nz, .Cancel
	ld a, [wPokegearPhoneSubmenuCursor]
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Cancel:
	ld hl, PokegearText_WhomToCall
	call PrintText
	scf
	ret


.Delete:
	ld hl, PokegearText_DeleteStoredNumber
	call MenuTextBox
	call YesNoBox
	call ExitMenu
	jr c, .CancelDelete
	call PokegearPhone_DeletePhoneNumber
	xor a
	ld [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	ld hl, PokegearText_WhomToCall
	call PrintText
	call WaitBGMap
.CancelDelete:
	scf
	ret


.Call:
	and a
	ret


.UpdateCursor:
	push de
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	ld a, [de]
	ld c, a
	push hl
	ld a, " "
	ld de, SCREEN_WIDTH * 2
.clear_column
	ld [hl], a
	add hl, de
	dec c
	jr nz, .clear_column
	pop hl
	ld a, [wPokegearPhoneSubmenuCursor]
	ld bc, SCREEN_WIDTH  * 2
	call AddNTimes
	ld [hl], "▶"
	pop de
	ret


.CallDeleteCancelStrings:
	dwcoord 10, 6
	db 3
	db   "CALL"
	next "DELETE"
	next "CANCEL"
	db   "@"

.CallDeleteCancelJumptable:
	dw .Call
	dw .Delete
	dw .Cancel


.CallCancelStrings:
	dwcoord 10, 8
	db 2
	db   "CALL"
	next "CANCEL"
	db   "@"

.CallCancelJumptable:
	dw .Call
	dw .Cancel

PokegearPager_Init:
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [wPokegearPagerScrollPosition], a
	ld [wPokegearPagerCursorPosition], a
	call InitPokegearTilemap
	call ExitPokegearRadio_HandleMusic
	ld hl, PagerCardSprites
.loop
	; sprite anim index
	ld a, [hli]
	and a
	jr z, .done
	push hl
	depixel 0, 4
	call _InitSpriteAnimStruct
	pop hl
	; pager flag bit
	ld a, [hli]
	push hl
	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld [hl], a
	; tile id = pager flag bit * 8 + $20
	add a
	add a
	add a
	add $20
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], a
	pop hl
	jr .loop
.done
	ld hl, PokegearText_SelectaPager
	call PrintText
	ret

PokegearPager_Joypad:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .quit
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	call PokegearPager_GetDPad
	ret

.quit
	ld c, POKEGEARSTATE_CLOCKINIT
	ld b, POKEGEARCARD_CLOCK
	jr .switch_page

.right
	ld a, [wPokegearFlags]
	bit POKEGEAR_RADIO_CARD_F, a
	jr z, .quit
	ld c, POKEGEARSTATE_RADIOINIT
	ld b, POKEGEARCARD_RADIO
	jr .switch_page

.left
	ld a, [wPokegearFlags]
	bit POKEGEAR_MAP_CARD_F, a
	jr z, .no_map
	ld c, POKEGEARSTATE_MAPCHECKREGION
	ld b, POKEGEARCARD_MAP
	jr .switch_page

.no_map
	ld a, [wPokegearFlags]
	bit POKEGEAR_PHONE_CARD_F, a
	ld c, POKEGEARSTATE_PHONEINIT
	ld b, POKEGEARCARD_PHONE
	jr .switch_page


.switch_page
	call Pokegear_SwitchPage
	ret

.a
	; show the Call/Cancel menu
	hlcoord 1, 4
	ld a, [wPokegearPagerCursorPosition]
	ld bc, SCREEN_WIDTH * 2
	call AddNTimes
	ld [hl], "▷"
	call PokegearPagerContactSubmenu
	ret c

	; get the pager value
	ld a, [wPokegearPagerScrollPosition]
	ld c, a
	ld a, [wPokegearPagerCursorPosition]
	add c
	ld [wPokegearPagerSelectedMon], a
	ld c, a

	; make sure the pager value is valid (0-6)
	cp NUM_PAGER_FLAGS
	ret nc

	; make sure the pager bit is set
	ld hl, wPagerFlags
	call TestBitAInHL
	ret z

	; get the offset from PagerCardRoutines
	ld hl, PagerCardRoutines
	ld b, 0
	add hl, bc
	add hl, bc

	; jump to the specific pager routine
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

PagerCardRoutines:
	dw CutPagerRoutine
	dw FlyPagerRoutine
	dw SurfPagerRoutine
	dw StrengthPagerRoutine
	dw FlashPagerRoutine
	dw WhirlpoolPagerRoutine
	dw RockSmashPagerRoutine

FlyPagerRoutine:
	call GetMapEnvironment
	call CheckOutdoorMap
	jr nz, .FlyStartUp         ;checks if the player is outside
	call ClearBGPalettes
	ld a, $90
	ld [hWY], a

.FlyStartUp
	farcall MonMenu_Fly   ;Regardless this code must trigger if the player is outside or not.
	jr z, FinishPagerRoutine
	call GetMapEnvironment
	call CheckOutdoorMap
	ret nz

	call DisableLCD
	farcall DeinitializeAllSprites
	call ClearSprites
	call ClearTileMap
	call Pokegear_LoadGFX
	call InitPokegearModeIndicatorArrow
	ld a, LCDC_DEFAULT
	ld [rLCDC], a
	call PokegearPager_Init
	ld a, 1
	ld [wPokegearPagerCursorPosition], a
	call PokegearPager_UpdateCursor
	call WaitBGMap
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
	ld a, POKEGEARSTATE_PAGERJOYPAD
	ld [wJumptableIndex], a
	ret

; all other pager functions had to be mvoed below FlyPagerRoutine due to its code setup
CutPagerRoutine:
	farcall MonMenu_Cut
	ret nz
	jr FinishPagerRoutine

SurfPagerRoutine:
	farcall MonMenu_Surf
	ret nz
	jr FinishPagerRoutine

StrengthPagerRoutine:
	farcall MonMenu_Strength
	ret nz
	jr FinishPagerRoutine

FlashPagerRoutine:
	farcall MonMenu_Flash
	ret nz
	jr FinishPagerRoutine

WhirlpoolPagerRoutine:
	farcall MonMenu_Whirlpool
	ret nz
	jr FinishPagerRoutine

RockSmashPagerRoutine:
	farcall MonMenu_RockSmash
	ret nz
	jr FinishPagerRoutine

FinishPagerRoutine:
	ld a, $84
	ld [wJumptableIndex], a
	ret

PokegearPager_GetDPad:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret

.up
	ld hl, wPokegearPagerCursorPosition
	ld a, [hl]
	and a
	jr z, .scroll_page_up
	dec [hl]
	jr .done_joypad_same_page

.scroll_page_up
	ld hl, wPokegearPagerScrollPosition
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jr .done_joypad_update_page

.down
	ld hl, wPokegearPagerCursorPosition
	ld a, [hl]
	cp PHONE_OR_PAGER_HEIGHT - 1
	jr nc, .scroll_page_down
	inc [hl]
	jr .done_joypad_same_page

.scroll_page_down
	ld hl, wPokegearPagerScrollPosition
	ld a, [hl]
	cp NUM_PAGER_FLAGS - PHONE_OR_PAGER_HEIGHT
	ret nc
	inc [hl]
	jr .done_joypad_update_page

.done_joypad_same_page
	xor a
	ld [hBGMapMode], a
	call PokegearPager_UpdateCursor
	call WaitBGMap
	ret

.done_joypad_update_page
	xor a
	ld [hBGMapMode], a
	call PokegearPager_UpdateDisplayList
	call WaitBGMap
	ret

PokegearPager_UpdateCursor:
	call ClearPhoneOrPagerCursors
	hlcoord 1, 4
	ld a, [wPokegearPagerCursorPosition]
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld [hl], "▶"
	ret

PokegearPager_UpdateDisplayList:
	call ClearPhoneOrPagerArea
	ld a, [wPokegearPagerScrollPosition]
	ld c, a
	xor a
	ld [wPokegearPagerLoadNameBuffer], a
.loop
	push bc
	ld de, PagerMissingName
	ld a, c
	ld hl, wPagerFlags
	call TestBitAInHL
	jr z, .got_name
	push hl
	ld hl, PagerCardNames
	ld a, c
	call GetNthString
	ld d, h
	ld e, l
	pop hl
.got_name
	; de = the pager name
	hlcoord 5, 4
	ld a, [wPokegearPagerLoadNameBuffer]
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	; hl = the coords to print the name
	call PlaceString
	pop bc
	inc c ; advance to the next bit in wPagerFlags
	ld a, [wPokegearPagerLoadNameBuffer]
	inc a
	ld [wPokegearPagerLoadNameBuffer], a
	cp PHONE_OR_PAGER_HEIGHT
	jr c, .loop
	call PokegearPager_UpdateCursor
	ret

PokegearPagerContactSubmenu:
	xor a
	ld [hBGMapMode], a
	ld de, .CallCancelStrings
	push de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	inc de
	push hl
	ld bc, hBGMapAddress + 1
	add hl, bc
	ld a, [de]
	inc de
	sla a
	ld b, a
	ld c, 8
	push de
	call TextBox
	pop de
	pop hl
	inc hl
	call PlaceString
	pop de
	xor a
	ld [wPokegearPagerSubmenuCursor], a
	call .UpdateCursor
	call WaitBGMap
.loop
	push de
	call JoyTextDelay
	pop de
	ld hl, hJoyPressed
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	call DelayFrame
	jr .loop

.d_up
	ld hl, wPokegearPagerSubmenuCursor
	ld a, [hl]
	and a
	jr z, .loop
	dec [hl]
	call .UpdateCursor
	jr .loop

.d_down
	ld hl, 2
	add hl, de
	ld a, [wPokegearPagerSubmenuCursor]
	inc a
	cp [hl]
	jr nc, .loop
	ld [wPokegearPagerSubmenuCursor], a
	call .UpdateCursor
	jr .loop

.a_b
	xor a
	ld [hBGMapMode], a
	call PokegearPager_UpdateDisplayList
	ld a, $1
	ld [hBGMapMode], a
	ld a, [hJoyPressed]
	and B_BUTTON
	jr nz, .Cancel
	ld hl, .CallCancelJumptable
	ld a, [wPokegearPagerSubmenuCursor]
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.CallCancelJumptable:
	dw .Call
	dw .Cancel

.Cancel:
	ld hl, PokegearText_WhomToCall
	call PrintText
	scf
	ret

.Call:
	and a
	ret

.UpdateCursor:
	push de
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	ld a, [de]
	ld c, a
	push hl
	ld a, " "
	ld de, SCREEN_WIDTH * 2
.clear_column
	ld [hl], a
	add hl, de
	dec c
	jr nz, .clear_column
	pop hl
	ld a, [wPokegearPagerSubmenuCursor]
	ld bc, SCREEN_WIDTH  * 2
	call AddNTimes
	ld [hl], "▶"
	pop de
	ret

.CallCancelStrings:
	dwcoord 10, 8
	db 2
	db   "CALL"
	next "CANCEL"
	db   "@"

Pokegear_SwitchPage:
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, c
	ld [wJumptableIndex], a
	ld a, b
	ld [wPokegearCard], a
	call DeleteSpriteAnimStruct2ToEnd
	ret

ExitPokegearRadio_HandleMusic:
	ld a, [wPokegearRadioMusicPlaying]
	cp RESTART_MAP_MUSIC
	jr z, .restart_map_music
	cp ENTER_MAP_MUSIC
	call z, EnterMapMusic
	xor a
	ld [wPokegearRadioMusicPlaying], a
	ret

.restart_map_music
	call RestartMapMusic
	xor a
	ld [wPokegearRadioMusicPlaying], a
	ret


DeleteSpriteAnimStruct2ToEnd:
	ld hl, wSpriteAnim2
	ld bc, wSpriteAnimationStructsEnd - wSpriteAnim2
	xor a
	call ByteFill
	ld a, 2
	ld [wSpriteAnimCount], a
	ret

Pokegear_LoadTilemapRLE:
	; Format: repeat count, tile ID
	; Terminated with -1
	hlcoord 0, 0
.loop
	ld a, [de]
	cp -1
	ret z
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, b
.load
	ld [hli], a
	dec c
	jr nz, .load
	jr .loop


PokegearText_WhomToCall:
	; Whom do you want to call?
	text_jump UnknownText_0x1c5847
	db "@"


PokegearText_PressAnyButtonToExit:
	; Press any button to exit.
	text_jump UnknownText_0x1c5862
	db "@"


PokegearText_DeleteStoredNumber:
	; Delete this stored phone number?
	text_jump UnknownText_0x1c587d
	db "@"

PokegearText_SelectaPager:
	; Select a PAGER to summon.
	text_jump UnknownText_pokegearpagersummon
	db "@"


PokegearSpritesGFX:
INCBIN "gfx/pokegear/pokegear_sprites.2bpp.lz"

RadioTilemapRLE:
INCBIN "gfx/pokegear/radio.tilemap.rle"
PhoneTilemapRLE:
INCBIN "gfx/pokegear/phone.tilemap.rle"
ClockTilemapRLE:
INCBIN "gfx/pokegear/clock.tilemap.rle"
PagerTilemapRLE:
INCBIN "gfx/pokegear/pager.tilemap.rle"

_UpdateRadioStation:
	jr UpdateRadioStation

; called from engine/sprite_anims.asm

AnimateTuningKnob:
	push bc
	call .TuningKnob
	pop bc
	ld a, [wRadioTuningKnob]
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.TuningKnob:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ld a, [hl]
	and D_UP
	jr nz, .up
	ret

.down
	ld hl, wRadioTuningKnob
	ld a, [hl]
	and a
	ret z
	dec [hl]
	dec [hl]
	jr .update

.up
	ld hl, wRadioTuningKnob
	ld a, [hl]
	cp 80
	ret nc
	inc [hl]
	inc [hl]
.update
UpdateRadioStation:
	ld hl, wRadioTuningKnob
	ld d, [hl]
	ld hl, RadioChannels
.loop
	ld a, [hli]
	cp -1
	jr z, .nostation
	cp d
	jr z, .foundstation
	inc hl
	inc hl
	jr .loop

.nostation
	call NoRadioStation
	ret

.foundstation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .returnafterstation
	push de
	jp hl

.returnafterstation
	ld a, [wPokegearRadioChannelBank]
	and a
	ret z
	xor a
	ld [hBGMapMode], a
	hlcoord 2, 9
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret


; unused
	ld [wPokegearRadioChannelBank], a
	ld a, [hli]
	ld [wPokegearRadioChannelAddr], a
	ld a, [hli]
	ld [wPokegearRadioChannelAddr + 1], a
	ret


RadioChannels:
; entries correspond to constants/radio_constants.asm

; frequency value given here = 4 × ingame_frequency − 2
	dbw 16, .PKMNTalkAndPokedexShow
	dbw 28, .PokemonMusic
	dbw 32, .LuckyChannel
	dbw 40, .BuenasPassword
	dbw 52, .RuinsOfAlphRadio
	dbw 64, .PlacesAndPeople
	dbw 72, .LetsAllSing
	dbw 78, .PokeFluteRadio
	dbw 80, .EvolutionRadio
	db -1

.PKMNTalkAndPokedexShow:
	call .InJohto
	jr nc, .check_radio_card_expansion
	jp LoadStation_OaksPokemonTalk
.check_radio_card_expansion
	ld a, [wPokegearFlags]
	bit POKEGEAR_EXPN_CARD_F, a
	jr z, .NoSignal
	jp LoadStation_OaksPokemonTalk

.PokemonMusic:
	call .InJohto
	jr nc, .NoSignal
	jp LoadStation_PokemonMusic

.LuckyChannel:
	call .InJohto
	jr nc, .NoSignal
	jp LoadStation_LuckyChannel

.BuenasPassword:
	call .InJohto
	jr nc, .NoSignal
	jp LoadStation_BuenasPassword

.RuinsOfAlphRadio:
	ld a, [wPokegearMapPlayerIconLandmark]
	cp RUINS_OF_ALPH
	jr nz, .NoSignal
	jp LoadStation_UnownRadio

.PlacesAndPeople:
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit POKEGEAR_EXPN_CARD_F, a
	jr z, .NoSignal
	jp LoadStation_PlacesAndPeople

.LetsAllSing:
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit POKEGEAR_EXPN_CARD_F, a
	jr z, .NoSignal
	jp LoadStation_LetsAllSing

.PokeFluteRadio:
	call .InJohto
	jr c, .NoSignal
	ld a, [wPokegearFlags]
	bit POKEGEAR_EXPN_CARD_F, a
	jr z, .NoSignal
	jp LoadStation_PokeFluteRadio

.EvolutionRadio:
; This station airs in the Lake of Rage area when Team Rocket is still in Mahogany.
	ld a, [wStatusFlags]
	bit STATUSFLAGS_ROCKET_SIGNAL_F, a
	jr z, .NoSignal
	ld a, [wPokegearMapPlayerIconLandmark]
	cp MAHOGANY_TOWN
	jr z, .ok
	cp ROUTE_43
	jr z, .ok
	cp LAKE_OF_RAGE
	jr nz, .NoSignal
.ok
	jp LoadStation_EvolutionRadio

.NoSignal:
	call NoRadioStation
	ret

.InJohto:
; if in Johto or on the S.S. Aqua, set carry

; otherwise clear carry
	ld a, [wPokegearMapPlayerIconLandmark]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr c, .johto
.kanto
	and a
	ret

.johto
	scf
	ret

LoadStation_OaksPokemonTalk:
	xor a ; OAKS_POKEMON_TALK
	ld [wCurrentRadioLine], a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, OaksPKMNTalkName
	ret

LoadStation_PokemonMusic:
	ld a, POKEMON_MUSIC
	ld [wCurrentRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokemonMusicName
	ret

LoadStation_LuckyChannel:
	ld a, LUCKY_CHANNEL
	ld [wCurrentRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LuckyChannelName
	ret

LoadStation_BuenasPassword:
	ld a, BUENAS_PASSWORD
	ld [wCurrentRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, NotBuenasPasswordName
	ld a, [wStatusFlags2]
	bit STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F, a
	ret z
	ld de, BuenasPasswordName
	ret


BuenasPasswordName:    db "BUENA'S PASSWORD@"
NotBuenasPasswordName: db "@"

LoadStation_UnownRadio:
	ld a, UNOWN_RADIO
	ld [wCurrentRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, UnownStationName
	ret

LoadStation_PlacesAndPeople:
	ld a, PLACES_AND_PEOPLE
	ld [wCurrentRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PlacesAndPeopleName
	ret

LoadStation_LetsAllSing:
	ld a, LETS_ALL_SING
	ld [wCurrentRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LetsAllSingName
	ret


LoadStation_RocketRadio:
	ld a, ROCKET_RADIO
	ld [wCurrentRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, LetsAllSingName
	ret


LoadStation_PokeFluteRadio:
	ld a, POKE_FLUTE_RADIO
	ld [wCurrentRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, PokeFluteStationName
	ret

LoadStation_EvolutionRadio:
	ld a, EVOLUTION_RADIO
	ld [wCurrentRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ld de, UnownStationName
	ret


Unreferenced_LoadStation:
	ret

RadioMusicRestartDE:
	push de
	ld a, e
	ld [wPokegearRadioMusicPlaying], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	ret

RadioMusicRestartPokemonChannel:
	push de
	ld a, RESTART_MAP_MUSIC
	ld [wPokegearRadioMusicPlaying], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld de, MUSIC_POKEMON_CHANNEL
	call PlayMusic
	ret

Radio_BackUpFarCallParams:
	ld [wPokegearRadioChannelBank], a
	ld a, l
	ld [wPokegearRadioChannelAddr], a
	ld a, h
	ld [wPokegearRadioChannelAddr + 1], a
	ret

NoRadioStation:
	call NoRadioMusic
	call NoRadioName
	xor a
	ld [wPokegearRadioChannelBank], a
	ld [wPokegearRadioChannelAddr], a
	ld [wPokegearRadioChannelAddr + 1], a
	ld a, $1
	ld [hBGMapMode], a
	ret

NoRadioMusic:
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, ENTER_MAP_MUSIC
	ld [wPokegearRadioMusicPlaying], a
	ret

NoRadioName:
	xor a
	ld [hBGMapMode], a
	hlcoord 1, 8
	lb bc, 3, 18
	call ClearBox
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	ret


OaksPKMNTalkName:     db "OAK's <PK><MN> Talk@"
PokemonMusicName:     db "#MON Music@"
LuckyChannelName:     db "Lucky Channel@"
UnownStationName:     db "?????@"

PlacesAndPeopleName:  db "Places & People@"
LetsAllSingName:      db "Let's All Sing!@"
PokeFluteStationName: db "# FLUTE@"

_TownMap:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]

	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a

	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a

	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call Pokegear_LoadGFX
	farcall ClearSpriteAnims
	ld a, 8
	call SkipMusic
	ld a, LCDC_DEFAULT
	ld [rLCDC], a
	call TownMap_GetCurrentLandmark
	ld [wTownMapPlayerIconLandmark], a
	ld [wTownMapCursorLandmark], a
	xor a
	ld [hBGMapMode], a
	call .InitTilemap
	call WaitBGMap2
	ld a, [wTownMapPlayerIconLandmark]
	call PokegearMap_InitPlayerIcon
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_InitCursor
	ld a, c
	ld [wTownMapCursorObjectPointer], a
	ld a, b
	ld [wTownMapCursorObjectPointer + 1], a
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
	ld a, [hCGB]
	and a
	jr z, .dmg
	ld a, %11100100
	call DmgToCgbObjPal0
	call DelayFrame

.dmg
	ld a, [wTownMapPlayerIconLandmark]
	cp KANTO_LANDMARK
	jr nc, .kanto
	ld d, KANTO_LANDMARK - 1
	ld e, 1
	call .loop
	jr .resume

.kanto
	call TownMap_GetKantoLandmarkLimits
	call .loop

.resume
	pop af
	ld [wVramState], a
	pop af
	ld [hInMenu], a
	pop af
	ld [wOptions], a
	call ClearBGPalettes
	ret

.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	ret nz

	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .pressed_up

	ld a, [hl]
	and D_DOWN
	jr nz, .pressed_down
.loop2
	push de
	farcall PlaySpriteAnimations
	pop de
	call DelayFrame
	jr .loop

.pressed_up
	ld hl, wTownMapCursorLandmark
	ld a, [hl]
	cp d
	jr c, .okay
	ld a, e
	dec a
	ld [hl], a

.okay
	inc [hl]
	jr .next

.pressed_down
	ld hl, wTownMapCursorLandmark
	ld a, [hl]
	cp e
	jr nz, .okay2
	ld a, d
	inc a
	ld [hl], a

.okay2
	dec [hl]

.next
	push de
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	ld a, [wTownMapCursorObjectPointer]
	ld c, a
	ld a, [wTownMapCursorObjectPointer + 1]
	ld b, a
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_UpdateCursorPosition
	pop de
	jr .loop2

.InitTilemap:
	ld a, [wTownMapPlayerIconLandmark]
	cp KANTO_LANDMARK
	jr nc, .kanto2
	ld e, JOHTO_REGION
	jr .okay_tilemap

.kanto2
	ld e, KANTO_REGION
.okay_tilemap
	farcall PokegearMap
	ld a, $07
	ld bc, 6
	hlcoord 1, 0
	call ByteFill
	hlcoord 0, 0
	ld [hl], $06
	hlcoord 7, 0
	ld [hl], $17
	hlcoord 7, 1
	ld [hl], $16
	hlcoord 7, 2
	ld [hl], $26
	ld a, $07
	ld bc, NAME_LENGTH
	hlcoord 8, 2
	call ByteFill
	hlcoord 19, 2
	ld [hl], $17
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	farcall TownMapPals
	ret

PlayRadio:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .PlayStation
	ld c, 100
	call DelayFrames
.loop
	call JoyTextDelay
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	jr nz, .stop
	ld a, [wPokegearRadioChannelAddr]
	ld l, a
	ld a, [wPokegearRadioChannelAddr + 1]
	ld h, a
	ld a, [wPokegearRadioChannelBank]
	and a
	jr z, .zero
	rst FarCall
.zero
	call DelayFrame
	jr .loop

.stop
	pop af
	ld [wOptions], a
	call ExitPokegearRadio_HandleMusic
	ret


.PlayStation:
	ld a, ENTER_MAP_MUSIC
	ld [wPokegearRadioMusicPlaying], a
	ld hl, .StationPointers
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .jump_return
	push de
	jp hl

.jump_return
	push de
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	hlcoord 1, 14
	ld [hl], "“"
	pop de
	hlcoord 2, 14
	call PlaceString
	ld h, b
	ld l, c
	ld [hl], "”"
	call WaitBGMap
	ret


.StationPointers:
; entries correspond to MAPRADIO_* constants
	dw .OakOrPnP
	dw LoadStation_OaksPokemonTalk
	dw LoadStation_PokemonMusic
	dw LoadStation_LuckyChannel
	dw LoadStation_UnownRadio
	dw LoadStation_PlacesAndPeople
	dw LoadStation_LetsAllSing
	dw LoadStation_RocketRadio


.OakOrPnP:
	call IsInJohto
	and a
	jr nz, .kanto
	call UpdateTime
	ld a, [wTimeOfDay]
	and a
	jp LoadStation_OaksPokemonTalk

.kanto
	jp LoadStation_PlacesAndPeople


PokegearMap:
	ld a, e
	and a
	jr nz, .kanto
	call LoadTownMapGFX
	call FillJohtoMap
	ret

.kanto
	call LoadTownMapGFX
	call FillKantoMap
	ret


_FlyMap:
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	xor a
	ld [hBGMapMode], a
	farcall ClearSpriteAnims
	call LoadTownMapGFX
	ld de, FlyMapLabelBorderGFX
	ld hl, vTiles2 tile $30
	lb bc, BANK(FlyMapLabelBorderGFX), 6
	call Request1bpp
	call FlyMap
	call ret_91c8f
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]                     ;temporarily disabled until a better method can be found
	and B_BUTTON
	jr nz, .pressedB
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressedA
	call FlyMapScroll
	call GetMapCursorCoordinates
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .loop

.pressedB
	ld a, -1
	jr .exit

.pressedA
	ld a, [wTownMapPlayerIconLandmark]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld a, [hl]
.exit
	ld [wTownMapPlayerIconLandmark], a
	pop af
	ld [hInMenu], a
	call ClearBGPalettes
	ld a, $90
	ld [hWY], a
	xor a ; LOW(vBGMap0)
	ld [hBGMapAddress], a
	ld a, HIGH(vBGMap0)
	ld [hBGMapAddress + 1], a
	ld a, [wTownMapPlayerIconLandmark]
	ld e, a
	ret


FlyMapScroll:
	ld a, [wStartFlypoint]
	ld e, a
	ld a, [wEndFlypoint]
	ld d, a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .ScrollNext
	ld a, [hl]
	and D_DOWN
	jr nz, .ScrollPrev
	ret

.ScrollNext:
	ld hl, wTownMapPlayerIconLandmark
	ld a, [hl]
	cp d
	jr nz, .NotAtEndYet
	ld a, e
	dec a
	ld [hl], a
.NotAtEndYet:
	inc [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollNext
	jr .Finally

.ScrollPrev:
	ld hl, wTownMapPlayerIconLandmark
	ld a, [hl]
	cp e
	jr nz, .NotAtStartYet
	ld a, d
	inc a
	ld [hl], a
.NotAtStartYet:
	dec [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollPrev
.Finally:
	call TownMapBubble
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ret


TownMapBubble:
; Draw the bubble containing the location text in the town map HUD

; Top-left corner
	hlcoord 1, 0
	ld a, $30
	ld [hli], a
; Top row
	ld bc, 16
	ld a, " "
	call ByteFill
; Top-right corner
	ld a, $31
	ld [hl], a
	hlcoord 1, 1

; Middle row
	ld bc, 18
	ld a, " "
	call ByteFill

; Bottom-left corner
	hlcoord 1, 2
	ld a, $32
	ld [hli], a
; Bottom row
	ld bc, 16
	ld a, " "
	call ByteFill
; Bottom-right corner
	ld a, $33
	ld [hl], a

; Print "Where?"
	hlcoord 2, 0
	ld de, .Where
	call PlaceString
; Print the name of the default flypoint
	call .Name
; Up/down arrows
	hlcoord 18, 1
	ld [hl], $34
	ret

.Where:
	db "Where?@"

.Name:
; We need the map location of the default flypoint
	ld a, [wTownMapPlayerIconLandmark]
	ld l, a
	ld h, 0
	add hl, hl ; two bytes per flypoint
	ld de, Flypoints
	add hl, de
	ld e, [hl]
	farcall GetLandmarkName
	hlcoord 2, 1
	ld de, wStringBuffer1
	call PlaceString
	ret


GetMapCursorCoordinates:
	ld a, [wTownMapPlayerIconLandmark]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Flypoints
	add hl, de
	ld e, [hl]
	farcall GetLandmarkCoords
	ld a, [wTownMapCursorCoordinates]
	ld c, a
	ld a, [wTownMapCursorCoordinates + 1]
	ld b, a
	ld hl, 4
	add hl, bc
	ld [hl], e
	ld hl, 5
	add hl, bc
	ld [hl], d
	ret


CheckIfVisitedFlypoint:
; Check if the flypoint loaded in [hl] has been visited yet.
	push bc
	push de
	push hl
	ld l, [hl]
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld c, [hl]
	call HasVisitedSpawn
	pop hl
	pop de
	pop bc
	and a
	ret


HasVisitedSpawn:
; Check if spawn point c has been visited.
	ld hl, wVisitedSpawns
	ld b, CHECK_FLAG
	ld d, 0
	predef SmallFarFlagAction
	ld a, c
	ret


INCLUDE "data/maps/flypoints.asm"

ret_91c8f:
	ret


FlyMap:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
; If we're not in a valid location, i.e. Pokecenter floor 2F,
; the backup map information is used.
	cp SPECIAL_MAP
	jr nz, .CheckRegion
	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation
.CheckRegion:
; The first 46 locations are part of Johto. The rest are in Kanto.
	cp KANTO_LANDMARK
	jr nc, .KantoFlyMap
.JohtoFlyMap:
; Note that .NoKanto should be modified in tandem with this branch
	push af
; Start from New Bark Town
	ld a, FLY_NEW_BARK
	ld [wTownMapPlayerIconLandmark], a
; Flypoints begin at New Bark Town...
	ld [wStartFlypoint], a
; ..and end at Silver Cave.
	ld a, FLY_MT_SILVER
	ld [wEndFlypoint], a
; Fill out the map
	call FillJohtoMap
	call .MapHud
	pop af
	call TownMapPlayerIcon
	ret

.KantoFlyMap:
; The event that there are no flypoints enabled in a map is not
; accounted for. As a result, if you attempt to select a flypoint
; when there are none enabled, the game will crash. Additionally,
; the flypoint selection has a default starting point that
; can be flown to even if none are enabled.
; To prevent both of these things from happening when the player
; enters Kanto, fly access is restricted until Indigo Plateau is
; visited and its flypoint enabled.
	push af
	ld c, SPAWN_INDIGO
	call HasVisitedSpawn
	and a
	jr z, .NoKanto
; Kanto's map is only loaded if we've visited Indigo Plateau

; Flypoints begin at Pallet Town...
	ld a, FLY_PALLET
	ld [wStartFlypoint], a
; ...and end at Indigo Plateau
	ld a, FLY_INDIGO
	ld [wEndFlypoint], a
; Because Indigo Plateau is the first flypoint the player
; visits, it's made the default flypoint.
	ld [wTownMapPlayerIconLandmark], a
; Fill out the map
	call FillKantoMap
	call .MapHud
	pop af
	call TownMapPlayerIcon
	ret

.NoKanto:
; If Indigo Plateau hasn't been visited, we use Johto's map instead

; Start from New Bark Town
	ld a, FLY_NEW_BARK
	ld [wTownMapPlayerIconLandmark], a
; Flypoints begin at New Bark Town...
	ld [wStartFlypoint], a
; ..and end at Silver Cave
	ld a, FLY_MT_SILVER
	ld [wEndFlypoint], a
	call FillJohtoMap
	pop af
.MapHud:
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0 ; BG Map 0
	call TownMapBGUpdate
	call TownMapMon
	ld a, c
	ld [wTownMapCursorCoordinates], a
	ld a, b
	ld [wTownMapCursorCoordinates + 1], a
	ret


Pokedex_GetArea:
; e: Current landmark
	ld a, [wTownMapPlayerIconLandmark]
	push af
	ld a, [wTownMapCursorLandmark]
	push af
	ld a, e
	ld [wTownMapPlayerIconLandmark], a
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [hInMenu], a
	ld de, PokedexNestIconGFX
	ld hl, vTiles0 tile $7f
	lb bc, BANK(PokedexNestIconGFX), 1
	call Request2bpp
	call .GetPlayerOrFastShipIcon
	ld hl, vTiles0 tile $78
	ld c, 4
	call Request2bpp
	call LoadTownMapGFX
	call FillKantoMap
	call .PlaceString_MonsNest
	call TownMapPals
	hlbgcoord 0, 0, vBGMap1
	call TownMapBGUpdate
	call FillJohtoMap
	call .PlaceString_MonsNest
	call TownMapPals
	hlbgcoord 0, 0
	call TownMapBGUpdate
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
	xor a
	ld [hBGMapMode], a
	xor a ; JOHTO_REGION
	call .GetAndPlaceNest
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	ld a, [hJoypadDown]
	and SELECT
	jr nz, .select
	call .LeftRightInput
	call .BlinkNestIcons
	jr .next

.select
	call .HideNestsShowPlayer
.next
	call DelayFrame
	jr .loop

.a_b
	call ClearSprites
	pop af
	ld [wTownMapCursorLandmark], a
	pop af
	ld [wTownMapPlayerIconLandmark], a
	ret


.LeftRightInput:
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ret

.left
	ld a, [hWY]
	cp $90
	ret z
	call ClearSprites
	ld a, $90
	ld [hWY], a
	xor a ; JOHTO_REGION
	call .GetAndPlaceNest
	ret

.right
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	ret z
	ld a, [hWY]
	and a
	ret z
	call ClearSprites
	xor a
	ld [hWY], a
	ld a, KANTO_REGION
	call .GetAndPlaceNest
	ret


.BlinkNestIcons:
	ld a, [hVBlankCounter]
	ld e, a
	and $f
	ret nz
	ld a, e
	and $10
	jr nz, .copy_sprites
	call ClearSprites
	ret

.copy_sprites
	hlcoord 0, 0
	ld de, wVirtualOAM
	ld bc, wVirtualOAMEnd - wVirtualOAM
	call CopyBytes
	ret


.PlaceString_MonsNest:
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	ld a, " "
	call ByteFill
	hlcoord 0, 1
	ld a, $6
	ld [hli], a
	ld bc, SCREEN_WIDTH - 2
	ld a, $7
	call ByteFill
	ld [hl], $17
	call GetPokemonName
	hlcoord 2, 0
	call PlaceString
	ld h, b
	ld l, c
	ld de, .String_SNest
	call PlaceString
	ret


.String_SNest:
	db "'S NEST@"

.GetAndPlaceNest:
	ld [wTownMapCursorLandmark], a
	ld e, a
	farcall FindNest ; load nest landmarks into wTileMap[0,0]
	decoord 0, 0
	ld hl, wVirtualOAMSprite00
.nestloop
	ld a, [de]
	and a
	jr z, .done_nest
	push de
	ld e, a
	push hl
	farcall GetLandmarkCoords
	pop hl
	; load into OAM
	ld a, d
	sub 4
	ld [hli], a ; y
	ld a, e
	sub 4
	ld [hli], a ; x
	ld a, $7f ; nest icon
	ld [hli], a ; tile id
	xor a
	ld [hli], a ; attributes
	; next
	pop de
	inc de
	jr .nestloop

.done_nest
	ld hl, wVirtualOAM
	decoord 0, 0
	ld bc, wVirtualOAMEnd - wVirtualOAM
	call CopyBytes
	ret


.HideNestsShowPlayer:
	call .CheckPlayerLocation
	ret c
	ld a, [wTownMapPlayerIconLandmark]
	ld e, a
	farcall GetLandmarkCoords
	ld c, e
	ld b, d
	ld de, .PlayerOAM
	ld hl, wVirtualOAMSprite00
.ShowPlayerLoop:
	ld a, [de]
	cp $80
	jr z, .clear_oam
	add b
	ld [hli], a ; y
	inc de
	ld a, [de]
	add c
	ld [hli], a ; x
	inc de
	ld a, [de]
	add $78 ; where the player's sprite is loaded
	ld [hli], a ; tile id
	inc de
	push bc
	ld c, PAL_OW_RED
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .male
	inc c ; PAL_OW_BLUE
.male
	ld a, c
	ld [hli], a ; attributes
	pop bc
	jr .ShowPlayerLoop

.clear_oam
	ld hl, wVirtualOAMSprite04
	ld bc, wVirtualOAMEnd - wVirtualOAMSprite04
	xor a
	call ByteFill
	ret


.PlayerOAM:
	; y pxl, x pxl, tile offset
	db -1 * 8, -1 * 8, 0 ; top left
	db -1 * 8,  0 * 8, 1 ; top right
	db  0 * 8, -1 * 8, 2 ; bottom left
	db  0 * 8,  0 * 8, 3 ; bottom right
	db $80 ; terminator

.CheckPlayerLocation:
; Don't show the player's sprite if you're
; not in the same region as what's currently
; on the screen.
	ld a, [wTownMapPlayerIconLandmark]
	cp FAST_SHIP
	jr z, .johto
	cp KANTO_LANDMARK
	jr c, .johto
.kanto
	ld a, [wTownMapCursorLandmark]
	and a
	jr z, .clear
	jr .ok

.johto
	ld a, [wTownMapCursorLandmark]
	and a
	jr nz, .clear
.ok
	and a
	ret

.clear
	ld hl, wVirtualOAM
	ld bc, wVirtualOAMEnd - wVirtualOAM
	xor a
	call ByteFill
	scf
	ret


.GetPlayerOrFastShipIcon:
	ld a, [wTownMapPlayerIconLandmark]
	cp FAST_SHIP
	jr z, .FastShip
	farcall GetPlayerIcon
	ret

.FastShip:
	ld de, FastShipGFX
	ld b, BANK(FastShipGFX)
	ret


TownMapBGUpdate:
; Update BG Map tiles and attributes

; BG Map address
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [hBGMapAddress + 1], a
; Only update palettes on CGB
	ld a, [hCGB]
	and a
	jr z, .tiles
; BG Map mode 2 (palettes)
	ld a, 2
	ld [hBGMapMode], a
; The BG Map is updated in thirds, so we wait

; 3 frames to update the whole screen's palettes.
	ld c, 3
	call DelayFrames
.tiles
; Update BG Map tiles
	call WaitBGMap
; Turn off BG Map update
	xor a
	ld [hBGMapMode], a
	ret


FillJohtoMap:
	ld de, JohtoMap
	jr FillTownMap

FillKantoMap:
	ld de, KantoMap
FillTownMap:
	hlcoord 0, 0
.loop
	ld a, [de]
	cp -1
	ret z
	ld a, [de]
	ld [hli], a
	inc de
	jr .loop


TownMapPals:
; Assign palettes based on tile ids
	hlcoord 0, 0
	decoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.loop
; Current tile
	ld a, [hli]
	push hl
; The palette map covers tiles $00 to $6f; $70 and above use palette 0
	cp $70
	jr nc, .pal0

; The palette data is condensed to nybbles, least-significant first.
	ld hl, .PalMap
	srl a
	jr c, .odd
; Even-numbered tile ids take the bottom nybble...
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	and PALETTE_MASK
	jr .update

.odd
; ...and odd ids take the top.
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	swap a
	and PALETTE_MASK
	jr .update

.pal0
	xor a
.update
	pop hl
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

.PalMap:
INCLUDE "gfx/pokegear/town_map_palette_map.asm"

TownMapMon:
; Draw the FlyMon icon at town map location

; Get FlyMon species
	ld a, [wCurPartyMon]
	ld hl, wPartySpecies
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ld [wTempSpecies], a
; Get FlyMon icon
	ld e, $08 ; starting tile in VRAM
	farcall GetFlyIcon
; Animation/palette
	depixel 0, 0
	ld a, SPRITE_ANIM_INDEX_PARTY_MON
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $08
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	ret


TownMapPlayerIcon:
; Draw the player icon at town map location in a
	push af
	farcall GetPlayerIcon
; Standing icon
	ld hl, vTiles0 tile $10
	ld c, 4 ; # tiles
	call Request2bpp
; Walking icon
	ld hl, $c0
	add hl, de
	ld d, h
	ld e, l
	ld hl, vTiles0 tile $14
	ld c, 4 ; # tiles
	ld a, BANK(ChrisSpriteGFX) ; does nothing
	call Request2bpp
; Animation/palette
	depixel 0, 0
	ld b, SPRITE_ANIM_INDEX_RED_WALK ; Male
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_gender
	ld b, SPRITE_ANIM_INDEX_BLUE_WALK ; Female
.got_gender
	ld a, b
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $10
	pop af
	ld e, a
	push bc
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret


LoadTownMapGFX:
	ld hl, TownMapGFX
	ld de, vTiles2
	lb bc, BANK(TownMapGFX), 48
	call DecompressRequest2bpp
	ret


JohtoMap:
INCBIN "gfx/pokegear/johto.bin"

KantoMap:
INCBIN "gfx/pokegear/kanto.bin"

PokedexNestIconGFX:
INCBIN "gfx/pokegear/dexmap_nest_icon.2bpp"
FlyMapLabelBorderGFX:
INCBIN "gfx/pokegear/flymap_label_border.1bpp"

Unreferenced_Function92311:
	xor a
	ld [wTownMapPlayerIconLandmark], a
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	xor a
	ld [hBGMapMode], a
	farcall ClearSpriteAnims
	call LoadTownMapGFX
	ld de, FlyMapLabelBorderGFX
	ld hl, vTiles2 tile $30
	lb bc, BANK(FlyMapLabelBorderGFX), 6
	call Request1bpp
	call FillKantoMap
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0, vBGMap1
	call TownMapBGUpdate
	call FillJohtoMap
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0
	call TownMapBGUpdate
	call TownMapMon
	ld a, c
	ld [wTownMapCursorCoordinates], a
	ld a, b
	ld [wTownMapCursorCoordinates + 1], a
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .pressedB
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressedA
	call .HandleDPad
	call GetMapCursorCoordinates
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .loop

.pressedB
	ld a, -1
	jr .finished_a_b

.pressedA
	ld a, [wTownMapPlayerIconLandmark]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld a, [hl]
.finished_a_b
	ld [wTownMapPlayerIconLandmark], a
	pop af
	ld [hInMenu], a
	call ClearBGPalettes
	ld a, $90
	ld [hWY], a
	xor a ; LOW(vBGMap0)
	ld [hBGMapAddress], a
	ld a, HIGH(vBGMap0)
	ld [hBGMapAddress + 1], a
	ld a, [wTownMapPlayerIconLandmark]
	ld e, a
	ret


.HandleDPad:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN | D_RIGHT
	jr nz, .down_right
	ld a, [hl]
	and D_UP | D_LEFT
	jr nz, .up_left
	ret

.down_right
	ld hl, wTownMapPlayerIconLandmark
	ld a, [hl]
	cp FLY_INDIGO
	jr c, .okay_dr
	ld [hl], -1
.okay_dr
	inc [hl]
	jr .continue

.up_left
	ld hl, wTownMapPlayerIconLandmark
	ld a, [hl]
	and a
	jr nz, .okay_ul
	ld [hl], FLY_INDIGO + 1
.okay_ul
	dec [hl]
.continue
	ld a, [wTownMapPlayerIconLandmark]
	cp KANTO_FLYPOINT
	jr c, .johto
	call FillKantoMap
	xor a
	ld b, $9c
	jr .finish

.johto
	call FillJohtoMap
	ld a, $90
	ld b, $98
.finish
	ld [hWY], a
	ld a, b
	ld [hBGMapAddress + 1], a
	call TownMapBubble
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ret

ClearPhoneOrPagerArea:
	hlcoord 1, 3
	ld b, PHONE_OR_PAGER_HEIGHT * 2 + 1
	ld a, " "
.row
	ld c, SCREEN_WIDTH - 2
.col
	ld [hli], a
	dec c
	jr nz, .col
	inc hl
	inc hl
	dec b
	jr nz, .row
	ret

ClearPhoneOrPagerCursors:
	ld a, " "
x = 4
rept PHONE_OR_PAGER_HEIGHT
	hlcoord 1, x
	ld [hl], a
x = x + 2
endr
	ret

INCLUDE "data/pager_system.asm"
