InitCrystalData:
	ld a, $1
	ld [wd474], a
	xor a
	ld [wd473], a
	ld [wPlayerGender], a
	ld [wd475], a
	ld [wd476], a
	ld [wd477], a
	ld [wd478], a
	ld [wd002], a
	ld [wd003], a
	ld a, [wd479]
	res 0, a ; ???
	ld [wd479], a
	ld a, [wd479]
	res 1, a ; ???
	ld [wd479], a
	ret

INCLUDE "mobile/mobile_12.asm"

InitGender:
	call InitGenderScreen
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	call SetDefaultBGPAndOBP
	ld hl, AreYouABoyOrAreYouAGirlText
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	dec a
	ld [wPlayerGender], a
.loop
	ld hl, ThisGameHasTwoGameModesText
	call PrintText
	hlcoord 0, 0
	ld b, 4
	ld c, 18
	call TextboxBorder
	hlcoord 0, 6
	ld b, 1
	ld c, 14
	call TextboxBorder
	ld hl, MenuHeader_GameModes
	call LoadMenuHeader
	call WaitBGMap2
	call ScrollingMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	ld hl, wChallengeMode
	dec a
	res GAME_CHALLENGE_MODE_F, [hl]
	jr z, .no_challenge
	set GAME_CHALLENGE_MODE_F, [hl]
.no_challenge
	call ClearGenderScreen
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	call SetDefaultBGPAndOBP
	ld hl, TextJump_ThisCannotBeChanged
	call PrintText
	ld hl, MenuHeader_GameModeAreYouSure
	call LoadMenuHeader
	call WaitBGMap2
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	dec a
	jr nz, .loop
	ld c, 10
	call DelayFrames
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 4, 12, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	db 2 ; items
	db "Boy@"
	db "Girl@"

MenuHeader_GameModeAreYouSure:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 4, 12, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	db 2 ; items
	db "YES@"
	db "NO@"

TextJump_ThisCannotBeChanged:
	text_far Text_ThisCannotBeChanged
	text_end

AreYouABoyOrAreYouAGirlText:
	text_far _AreYouABoyOrAreYouAGirlText
	text_end

MenuHeader_GameModes:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 1, SCREEN_WIDTH - 2, TEXTBOX_Y - 8
	dw .MenuData
	db 1 ; default option

.MenuData
	db SCROLLINGMENU_ENABLE_FUNCTION3 ; flags
	db 2, 0 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dba .MenuItems
	dba PlaceMenuGameMode
	dba .DoNothing
	dba UpdateEndgameLvlText

.MenuItems
	db 1

.DoNothing
	ret

PlaceMenuGameMode:
	push de
	ld a, [wScrollingMenuCursorPosition]
	and a
	ld de, .NormalMode
	jr z, .done
	ld de, .ChallengeMode
.done
	pop hl
	jp PlaceString

.NormalMode
	db "NORMAL MODE@"
.ChallengeMode
	db "CHALLENGE MODE@"

ThisGameHasTwoGameModesText:
	text_jump Text_ThisGameHasTwoGameModes
	db "@"

UpdateEndgameLvlText:
	ld a, [wMenuCursorY]
	dec a
	ld de, .NormalMode
	jr z, .done
	ld de, .ChallengeMode
.done
	hlcoord 1, 7
	call PlaceString

	ld a, [wMenuCursorY]
	dec a
	ld hl, .NormalModeDescJump
	jr z, .done_two
	ld hl, .ChallengeModeDescJump
.done_two
	jp PrintText

.NormalMode:
	db "Endgame: Lv40@"
.ChallengeMode:
	db "Endgame: Lv50@"

.NormalModeDescJump
	text_far Text_NormalModeDesc
	text_end

.ChallengeModeDescJump
	text_far Text_ChallengeModeDesc
	text_end

InitGenderScreen:
	ld a, $10
	ld [wMusicFade], a
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld c, 8
	call DelayFrames
	call ClearBGPalettes
	call InitCrystalData
	call LoadFontsExtra
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, $0
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ret

ClearGenderScreen:
	hlcoord 0, 0
	ld bc, (TEXTBOX_Y - 1)  * SCREEN_WIDTH
	xor a
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, (TEXTBOX_Y - 1) * SCREEN_WIDTH
	xor a
	jp ByteFill

LoadGenderScreenPal:
	ld hl, .Palette
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	ret

.Palette:
INCLUDE "gfx/new_game/gender_screen.pal"

LoadGenderScreenLightBlueTile:
	ld de, .LightBlueTile
	ld hl, vTiles2 tile $00
	lb bc, BANK(.LightBlueTile), 1
	call Get2bpp
	ret

.LightBlueTile:
INCBIN "gfx/new_game/gender_screen.2bpp"
