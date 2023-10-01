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
	; could have done "ld a, [wd479] \ and %11111100", saved four operations
	ld a, [wd479]
	res 0, a
	ld [wd479], a
	ld a, [wd479]
	res 1, a
	ld [wd479], a
	ret

INCLUDE "mobile/mobile_12.asm"

InitGender:
	call InitGenderScreen
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	call SetPalettes
	ld hl, TextJump_AreYouABoyOrAreYouAGirl
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	dec a
	ld [wPlayerGender], a
	ld hl, TextJump_ThisGameHasTwoGameModes
	call PrintText
	hlcoord 0, 0
	ld b, 4
	ld c, 18
	call TextBoxBorder
	hlcoord 0, 6
	ld b, 1
	ld c, 14
	call TextBoxBorder
	ld hl, MenuHeader_GameModes
	call LoadMenuHeader
	call WaitBGMap2
	call ScrollingMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	dec a
	ld [wChallengeMode], a
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

TextJump_AreYouABoyOrAreYouAGirl:
	; Are you a boy? Or are you a girl?
	text_jump Text_AreYouABoyOrAreYouAGirl
	db "@"

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

TextJump_ThisGameHasTwoGameModes:
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
	text_jump Text_NormalModeDesc
	db "@"

.ChallengeModeDescJump
	text_jump Text_ChallengeModeDesc
	db "@"

InitGenderScreen:
	ld a, $10
	ld [wMusicFade], a
	ld a, MUSIC_NONE
	ld [wMusicFadeID], a
	ld a, $0
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
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ret

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
