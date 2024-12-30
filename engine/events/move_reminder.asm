MoveReminder:
	ld hl, MoveReminderWhichMonText
	call PrintText

	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .is_an_egg

	call IsAPokemon
	jr c, .not_a_pokemon

	call GetRemindableMoves
	jr z, .no_moves_to_learn

	ld hl, MoveReminderWhichMoveText
	call PrintText

	call ChooseMoveToLearn
	jr c, .exit_menu

	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyName1

	predef LearnMove

	ld a, b
	and a
	jr nz, .take_mushroom

.exit_menu
	call ReturnToMapWithSpeechTextbox

.cancel
	ld hl, MoveReminderCancelText
	jp PrintText

.is_an_egg
	ld hl, MoveReminderEggText
	jp PrintText

.not_a_pokemon
	ld hl, MoveReminderNoMonText
	jp PrintText

.no_moves_to_learn
	ld hl, MoveReminderNoMovesText
	jp PrintText

.take_mushroom
	ld a, [wMoveReminderItem]
	cp BIG_MUSHROOM
	jr z, .have_big_mushroom

	ld [wCurItem], a
	ld hl, wNumItems
	ld a, 2
	ld [wItemQuantityChange], a
	call TossItem
	jr .finish

.have_big_mushroom
	ld [wCurItem], a
	ld hl, wNumItems
	ld a, 1
	ld [wItemQuantityChange], a
	call TossItem
;fallthrough
.finish
	call ReturnToMapWithSpeechTextbox
	ld hl, MoveReminderMoveLearnedText
	jp PrintText

GetRemindableMoves:
	ld hl, wd002
	xor a
	ld [hli], a
	ld [hl], $ff

	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartySpecies], a

	push af
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a

	ld b, 0
	ld de, wd002 + 1

	ld a, [wCurPartySpecies]
	dec a
	push bc
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarWord

.skip_evos
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr nz, .skip_evos

.loop_moves
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr z, .done
	ld c, a
	ld a, [wCurPartyLevel]
	cp c
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	jr c, .loop_moves

	ld c, a
	call CheckAlreadyInList
	jr c, .loop_moves
	call CheckPokemonAlreadyKnowsMove
	jr c, .loop_moves
	ld a, c
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	pop bc
	inc b
	push bc
	jr .loop_moves

.done
	pop bc
	pop af
	ld [wCurPartySpecies], a
	ld a, b
	ld [wd002], a
	and a
	ret

CheckAlreadyInList:
	push hl
	ld hl, wd002 + 1

.loop
	ld a, [hli]
	inc a
	jr z, .nope
	dec a
	cp c
	jr nz, .loop
	pop hl
	scf
	ret

.nope
	pop hl
	and a
	ret

CheckPokemonAlreadyKnowsMove:
	push hl
	push bc
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld b, 4

.loop
	ld a, [hli]
	cp c
	jr z, .yes
	dec b
	jr nz, .loop
	pop bc
	pop hl
	and a
	ret

.yes
	pop bc
	pop hl
	scf
	ret

ChooseMoveToLearn:
	farcall FadeOutToWhite
	farcall BlankScreen
	ld hl, .MenuHeader
	call CopyMenuHeader
	xor a
	ld [wMenuCursorPosition], a
	ld [wMenuScrollPosition], a

	hlcoord 0,  1
	lb bc,  9, 18
	call TextboxBorder

	ld de, FontBattleExtra + 14 tiles
	ld hl, vTiles2 tile $6e
	lb bc, BANK(FontBattleExtra), 1
	call Get2bppViaHDMA

	farcall LoadStatsScreenPageTilesGFX
	xor a
	ld [wMonType], a
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	hlcoord  5, 1
	call PlaceString

	push bc
	farcall CopyMonToTempMon
	pop hl
	call PrintLevel

	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .carry
	ld a, [wMenuSelection]
	ld [wPutativeTMHMMove], a
	and a
	ret

.carry
	scf
	ret

.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 1, 2, SCREEN_WIDTH - 2, 10
	dw .MenuData
	db 1

.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_FUNCTION3
	db 4, SCREEN_WIDTH + 2
	db SCROLLINGMENU_ITEMS_NORMAL
	dba  wd002
	dba .print_move_name
	dba .print_pp
	dba .print_move_details

.print_move_name
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetMoveName
	pop hl
	jp PlaceString

.print_pp
	ld hl, wStringBuffer1
	ld bc, wStringBuffer2 - wStringBuffer1
	ld a, " "
	call ByteFill
	ld a, [wMenuSelection]
	inc a
	ret z
	dec a
	push de

	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_PP) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [wBuffer1], a
	ld hl, wStringBuffer1 + 9
	ld de, wBuffer1
	lb bc, 1, 2
	call PrintNum
	ld hl, wStringBuffer1 + 11
	ld [hl], "/"
	ld hl, wStringBuffer1 + 12
	call PrintNum
	
	ld hl, wStringBuffer1 + 14
	ld [hl], "@"

	pop hl
	ld de, wStringBuffer1
	call PlaceString

	ld bc, 6
	add hl, bc
	ld a, $3e
	ld [hli], a
	ld [hl], a
	ret

.cancel_border_fix
	hlcoord 0,  10
	ld [hl], "│"
	inc hl
	ret

.print_move_details
	hlcoord 0, 11
	lb bc, 5, 18
	call TextboxBorder

	ld a, [wMenuSelection]
	cp -1
	jr z, .cancel_border_fix

.print_move_desc
	push de
	ld a, [wMenuSelection]
	inc a
	pop de
	ret z
	dec a
	ld [wCurSpecies], a
	hlcoord 1, 14
	predef PrintMoveDescription

.print_move_type
	ld a, [wCurSpecies]
	ld b, a
	hlcoord 2, 12
	predef PrintMoveType

.print_move_stat_strings
	hlcoord 0, 10
	ld de, MoveTypeTop
	call PlaceString
	hlcoord 0, 11
	ld de, MoveType
	call PlaceString
	hlcoord 12, 12
	ld de, MoveAttack
	call PlaceString

.print_move_attack
	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_POWER) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	cp 2
	jr c, .print_move_no_attack
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	hlcoord 16, 12
	jp PrintNum

.print_move_no_attack
	hlcoord 16, 12
	ld de, MoveNoAttack
	ld bc, 3
	jp PlaceString

MoveTypeTop:
	db "┌─────┐@"

MoveType:
	db "│TYPE/└@"

MoveAttack:
	db "ATK/@"

MoveNoAttack:
	db "---@"

MoveReminderWhichMonText:
	text "Which #MON"
	line "needs reminding?"
	prompt

MoveReminderWhichMoveText:
	text "Which move should"
	line "it remember, then?"
	prompt

MoveReminderCancelText:
	text "Come visit me"
	line "again."
	done

MoveReminderEggText:
	text "An EGG can't learn"
	line "any moves!"
	done

MoveReminderNoMonText:
	text "What is that!?"
	
	para "I'm sorry, but I"
	line "can only teach"
	cont "moves to #MON!"
	done

MoveReminderNoMovesText:
	text "There are no moves"
	line "for this #MON"
	cont "to learn."
	done

MoveReminderMoveLearnedText:
	text "Done! Your #MON"
	line "remembered the"
	cont "move."
	done