LoadBattleMenu:
	ld hl, BattleMenuHeader
	call LoadMenuHeader
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call InterpretBattleMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call ExitMenu
	ret

SafariBattleMenu:
	ld hl, SafariBattleMenuHeader
	call LoadMenuHeader
	jr GotBattleMenuHeader

ContestBattleMenu:
	ld hl, ContestBattleMenuHeader
	call LoadMenuHeader

GotBattleMenuHeader:
	ld a, [wBattleMenuCursorBuffer]
	ld [wMenuCursorBuffer], a
	call _2DMenu
	ld a, [wMenuCursorBuffer]
	ld [wBattleMenuCursorBuffer], a
	call ExitMenu
	ret

BattleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 6 ; spacing
	dba .Strings
	dbw BANK(.MenuData), 0

.Strings:
	db "FIGHT@"
	db "<PKMN>@"
	db "PACK@"
	db "RUN@"

SafariBattleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 11 ; spacing
	dba .Strings
	dba PrintSafariBallsRemaining

.Strings
	db "BALL×  @"
	db "BAIT@"
	db "ROCK@"
	db "RUN@"

PrintSafariBallsRemaining:
	hlcoord 7, 14
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

ContestBattleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw .MenuData
	db 1 ; default option

.MenuData
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 2 ; rows, columns
	db 12 ; spacing
	dba .Strings
	dba PrintParkBallsRemaining

.Strings
	db "FIGHT@"
	db "<PKMN>", "@"
	db "PARKBALL×  @"
	db "RUN@"

PrintParkBallsRemaining:
	hlcoord 11, 16
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
