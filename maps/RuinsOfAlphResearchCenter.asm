	object_const_def
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphResearchCenterNoopScene,        SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	scene_script RuinsOfAlphResearchCenterGetUnownDexScene, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	def_callbacks
	callback MAPCALLBACK_OBJECTS, RuinsOfAlphResearchCenterScientistCallback

RuinsOfAlphResearchCenterNoopScene:
	end

RuinsOfAlphResearchCenterGetUnownDexScene:
	sdefer RuinsOfAlphResearchCenterGetUnownDexScript
	end

RuinsOfAlphResearchCenterScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	endcallback

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	endcallback

RuinsOfAlphResearchCenterGetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesComputerMovement
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesPlayerMovement
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterLeavesPlayerMovement
	pause 15
	showemote EMOTE_SHOCK, RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 15
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterApproachesPlayerMovement
	opentext
	writetext RuinsOfAlphResearchCenterIAlmostForgotText
	waitbutton
	giveitem OPAL_SHARD, 10
	iffalse RuinsOfAlphResearchCenterNoRoomInBag
	writetext RuinsOfAlphResearchCenterPlayerReceived10OpalShardsText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_OPAL_SHARDS_FROM_SCIENTIST
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterLeavesPlayerMovement
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterNoRoomInBag:
	writetext RuinsOfAlphResearchCenterNoRoomInBagText
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, RuinsOfAlphResearchCenterLeavesPlayerMovement
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOOP
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterFossilScientistScript:
	faceplayer
	opentext
	checkevent EVENT_FOSSIL_SCIENTIST_WORKING_HELIX
	iftrue .check_fossil_step_count_helix
	checkevent EVENT_FOSSIL_SCIENTIST_WORKING_DOME
	iftrue .check_fossil_step_count_dome
	checkevent EVENT_FOSSIL_SCIENTIST_WORKING_AMBER
	iftrue .check_fossil_step_count_amber
	writetext RuinsOfAlphResearchCenterFossilScientistDoYouHaveFossilText
	waitbutton
	checkitem HELIX_FOSSIL
	iftrue .own_helix
	checkitem DOME_FOSSIL
	iftrue .own_dome
	checkitem OLD_AMBER
	iftrue IsOldAmber
	writetext RuinsOfAlphResearchCenterFossilScientistNoFossilText
	waitbutton
	closetext
	end

.check_fossil_step_count_helix
	callasm FossilCheckStepCount
	iftrue .give_omanyte
	writetext RuinsOfAlphResearchCenterFossilScientistNotDoneYetText
	waitbutton
	closetext
	end

.check_fossil_step_count_dome
	callasm FossilCheckStepCount
	iftrue .give_kabuto
	writetext RuinsOfAlphResearchCenterFossilScientistNotDoneYetText
	waitbutton
	closetext
	end

.check_fossil_step_count_amber
	callasm FossilCheckStepCount
	iftrue .give_aerodactyl
	writetext RuinsOfAlphResearchCenterFossilScientistNotDoneYetText
	waitbutton
	closetext
	end


.give_omanyte
	writetext RuinsOfAlphResearchCenterFossilScientistDoneOmanyteText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .No_Room
	writetext RuinsOfAlphResearchCenterPlayerReceivedOmanyteText
	playsound SFX_CAUGHT_MON
	waitsfx
	checkflag ENGINE_CHALLENGE_MODE_ACTIVE
	iftrue .omanyte_challenge_mode
	givepoke OMANYTE, 20
	jump .omanyte_finish
.omanyte_challenge_mode
	givepoke OMANYTE, 25
.omanyte_finish
	writetext RuinsOfAlphResearchCenterFossilScientistTakeGoodCareOfItText
	waitbutton
	closetext
	clearevent EVENT_FOSSIL_SCIENTIST_WORKING_HELIX
	end

.give_kabuto
	writetext RuinsOfAlphResearchCenterFossilScientistDoneKabutoText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .No_Room
	writetext RuinsOfAlphResearchCenterPlayerReceivedKabutoText
	playsound SFX_CAUGHT_MON
	waitsfx
	checkflag ENGINE_CHALLENGE_MODE_ACTIVE
	iftrue .kabuto_challenge_mode
	givepoke KABUTO, 20
	jump .kabuto_finish
.kabuto_challenge_mode
	givepoke KABUTO, 25
.kabuto_finish
	writetext RuinsOfAlphResearchCenterFossilScientistTakeGoodCareOfItText
	waitbutton
	closetext
	clearevent EVENT_FOSSIL_SCIENTIST_WORKING_DOME
	end

.give_aerodactyl
	writetext RuinsOfAlphResearchCenterFossilScientistDoneAerodactylText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .No_Room
	writetext RuinsOfAlphResearchCenterPlayerReceivedAerodactylText
	playsound SFX_CAUGHT_MON
	waitsfx
	checkflag ENGINE_CHALLENGE_MODE_ACTIVE
	iftrue .aerodactyl_challenge_mode
	givepoke AERODACTYL, 20
	jump .aerodactyl_finish
.aerodactyl_challenge_mode
	givepoke AERODACTYL, 25
.aerodactyl_finish
	writetext RuinsOfAlphResearchCenterFossilScientistTakeGoodCareOfItText
	waitbutton
	closetext
	clearevent EVENT_FOSSIL_SCIENTIST_WORKING_AMBER
	end

.No_Room
	writetext RuinsOfAlphResearchCenterFossilScientistNoRoomForFossilPokemonText
	waitbutton
	closetext
	end


.own_helix
	checkitem DOME_FOSSIL
	iftrue .own_helix_and_dome
	checkitem OLD_AMBER
	iftrue .ask_helix_amber
	writetext RuinsOfAlphResearchCenterFossilScientistIsHelixFossilText
	yesorno
	iftrue GaveHelixFossil
	jump .no_fossil

.own_dome
	checkitem OLD_AMBER
	iftrue .ask_dome_amber
	writetext RuinsOfAlphResearchCenterFossilScientistIsDomeFossilText
	yesorno
	iftrue GaveDomeFossil
	jump .no_fossil

.own_helix_and_dome
	checkitem OLD_AMBER
	iftrue .ask_helix_dome_amber
	loadmenu HelixDomeMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, IsHelixFossil
	ifequal $2, IsDomeFossil
	jump .no_fossil

.ask_helix_amber
	loadmenu HelixAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, IsHelixFossil
	ifequal $2, IsOldAmber
	jump .no_fossil

.ask_dome_amber
	loadmenu DomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, IsDomeFossil
	ifequal $2, IsOldAmber
	jump .no_fossil

.ask_helix_dome_amber
	loadmenu HelixDomeAmberMenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, IsHelixFossil
	ifequal $2, IsDomeFossil
	ifequal $3, IsOldAmber
.no_fossil:
	writetext RuinsOfAlphResearchCenterFossilScientistNoFossilText
	waitbutton
	closetext
	end

HelixDomeMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "HELIX FOSSIL@"
	db "DOME FOSSIL@"
	db "CANCEL@"

HelixAmberMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "HELIX FOSSIL@"
	db "OLD AMBER@"
	db "CANCEL@"

DomeAmberMenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 14 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "DOME FOSSIL@"
	db "OLD AMBER@"
	db "CANCEL@"

HelixDomeAmberMenuDataHeader:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "HELIX FOSSIL@"
	db "DOME FOSSIL@"
	db "OLD AMBER@"
	db "CANCEL@"

IsHelixFossil:
	writetext RuinsOfAlphResearchCenterFossilScientistIsHelixFossilText
	yesorno
	iffalse DeniedRessurection
	jump GaveHelixFossil

IsDomeFossil:
	writetext RuinsOfAlphResearchCenterFossilScientistIsDomeFossilText
	yesorno
	iffalse DeniedRessurection
	jump GaveDomeFossil

IsOldAmber:
	writetext RuinsOfAlphResearchCenterFossilScientistIsOldAmberText
	yesorno
	iffalse DeniedRessurection
	jump GaveOldAmber

DeniedRessurection:
	writetext RuinsOfAlphResearchCenterFossilScientistNoFossilText
	waitbutton
	closetext
	end

GaveHelixFossil:
	writetext RuinsOfAlphResearchCenterFossilScientistGaveFossilText
	waitbutton
	closetext
	takeitem HELIX_FOSSIL
	setevent EVENT_FOSSIL_SCIENTIST_WORKING_HELIX
	callasm FossilSetStepCount
	end

GaveDomeFossil:
	writetext RuinsOfAlphResearchCenterFossilScientistGaveFossilText
	waitbutton
	closetext
	takeitem DOME_FOSSIL
	setevent EVENT_FOSSIL_SCIENTIST_WORKING_DOME
	callasm FossilSetStepCount
	end

GaveOldAmber:
	writetext RuinsOfAlphResearchCenterFossilScientistGaveFossilText
	waitbutton
	closetext
	takeitem OLD_AMBER
	setevent EVENT_FOSSIL_SCIENTIST_WORKING_AMBER
	callasm FossilSetStepCount
	end


RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_OPAL_SHARDS_FROM_SCIENTIST
	iftrue .GotShards
	writetext RuinsOfAlphResearchCenterIAlmostForgotText
	waitbutton
	giveitem OPAL_SHARD, 10
	iffalse RuinsOfAlphResearchCenterNoRoomInBag
	writetext RuinsOfAlphResearchCenterPlayerReceived10OpalShardsText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_OPAL_SHARDS_FROM_SCIENTIST
.GotShards
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist2Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist2Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext RuinsOfAlphResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterTutotScientistScript:
	faceplayer
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SPOKE_TO_TUTOR
	iftrue .AlreadySpokeToTutor
	setevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SPOKE_TO_TUTOR
	writetext RuinsOfAlphResearchCenterTutorExplainText
	waitbutton
.AlreadySpokeToTutor:
	readvar VAR_UNOWNCOUNT
	ifgreater 25, .CaughtAllUnown
	ifgreater 20, .Caught21Unown
	ifgreater 13, .Caught14Unown
	ifgreater 6, .Caught7Unown
.BeginTeach:
	writetext RuinsOfAlphResearchCenterTutorWantMeToTeachText
	yesorno
	iffalse .Refused
	writetext RuinsOfAlphResearchCenterTutorShallITeachText
	callasm .SetupMovesMenu
	callasm .LoadMovesMenu
	; closewindow ; doesn't work for some reason… it leaves the textbox border hanging
	writetext RuinsOfAlphResearchCenterTutorMoveText
	ifequal 2, .NotEnough
	iffalse .CloseTutor
	special MoveTutor2
	iffalse .TeachMove
.CloseTutor
	closetext
	opentext
	sjump .Refused

.CaughtAllUnown:
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_TUTOR_CAUGHT_ALL_UNOWN
	iftrue .BeginTeach
	setevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_TUTOR_CAUGHT_ALL_UNOWN
	writetext RuinsOfAlphResearchCenterTutorCaughtAllUnownText
	playsound SFX_LEVEL_UP
	waitsfx
	promptbutton
	sjump .BeginTeach
.Caught21Unown:
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_TUTOR_CAUGHT_21_UNOWN
	iftrue .BeginTeach
	setevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_TUTOR_CAUGHT_21_UNOWN
	writetext RuinsOfAlphResearchCenterTutorCaught21UnownText
	playsound SFX_LEVEL_UP
	waitsfx
	promptbutton
	sjump .BeginTeach
.Caught14Unown:
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_TUTOR_CAUGHT_14_UNOWN
	iftrue .BeginTeach
	setevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_TUTOR_CAUGHT_14_UNOWN
	writetext RuinsOfAlphResearchCenterTutorCaught14UnownText
	playsound SFX_LEVEL_UP
	waitsfx
	promptbutton
	sjump .BeginTeach
.Caught7Unown:
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_TUTOR_CAUGHT_7_UNOWN
	iftrue .BeginTeach
	setevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_TUTOR_CAUGHT_7_UNOWN
	writetext RuinsOfAlphResearchCenterTutorCaught7UnownText
	playsound SFX_LEVEL_UP
	waitsfx
	promptbutton
	sjump .BeginTeach

.LoadMovesMenu:
	call ClearSprites
	call LoadStandardMenuHeader
	ld hl, .MovesMenu
	call LoadMenuHeader
	xor a
	ld [wMenuCursorPosition], a
	ld [wMenuScrollPosition], a
	ldh [hBGMapMode], a
	call InitScrollingMenu
	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .cancel_selection
	ld a, [wMenuSelection]
	cp -1 ; CANCEL
	jr z, .cancel_selection
; selection confirmed
	assert wMenuSelectionQuantity == wMenuSelection + 1
	ld hl, wMenuSelection
	ld a, [hli]
	ld [wNamedObjectIndex], a
	ld a, [hl]
	ld [wRuinsMoveTutorScratch], a ; not used for menus anymore at this point
	ld b, a
	call .GetAmountOfOpalShards
	cp b
	jr c, .not_enough_shards
	ld a, TRUE
	ld [wScriptVar], a
	ret
.cancel_selection:
	ld a, FALSE
	ld [wScriptVar], a
	ret
.not_enough_shards:
	ld a, 2
	ld [wScriptVar], a
	ret

.MovesMenu:
	db MENU_BACKUP_TILES
	menu_coords 1, 1, 15, 7
	dw .MovesMenuData
	db 1

.MovesMenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_FUNCTION3
	db 3 ; height
	db 1 ; width ("1" triggers Function 2 to run)
	db SCROLLINGMENU_ITEMS_QUANTITY ; item format
	dba wRuinsMoveTutorScratch
	dba .DisplayMoveName
	dba .DisplayAmountOkNotReally
	dba .UpdateNeededShardsIndicator

.UpdateNeededShardsIndicator:
; update quantity
	hlcoord 4, 9
	lb bc, 1, 14
	call Textbox
	ld a, [wMenuSelection]
	cp -1 ; CANCEL
	hlcoord 5, 10 ; text starting position
	jr nz, .display_needed_amount
; display "-------" instead of the "currency"
	ld a, "-"
	ld c, 14 ; how many dashes to display
	         ; should cover item name and " x##"
.fill_bytes
	ld [hli], a
	dec c
	ret z
	jr .fill_bytes
.display_needed_amount
	ld de, .ShardText
	call PlaceString
	hlcoord 17, 10
	ld de, wMenuSelectionQuantity
	lb bc, 1, 2
	call PrintNum
	ret

.ShardText
	db "OPAL SHARD ×@"

.DisplayAmountOkNotReally:
; this is usually for displaying something on the right
; hand side of the menu, but we don't need that here
	ret

.DisplayMoveName:
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetMoveName
	pop hl
	jp PlaceString

.SetupMovesMenu:
; copy the whole move list
	ld hl, .FullMoveList
	ld de, wRuinsMoveTutorScratch
	ld bc, .FullMoveListEnd - .FullMoveList
	call CopyBytes
; get unown count
	ld c, VAR_UNOWNCOUNT
	farcall _GetVarAction
	ld a, [de]
; cut the menu
	; the way this works requires this condition to hold
	; i don't feel like doing a full 16-bit add
	assert HIGH(wRuinsMoveTutorScratch) \
		== HIGH(wRuinsMoveTutorScratch + 25)
;--
	ld hl, wRuinsMoveTutorScratch
	cp NUM_UNOWN
	jr nc, .got_menu
	cp 21
	jr c, .lessthan21
; cut menu to 20 items
	ld a, 20
	jr .cut_menu
.lessthan21
	cp 14
	jr c, .lessthan14
; cut menu to 15 items
	ld a, 15
	jr .cut_menu
.lessthan14
	cp 7
	jr c, .lessthan7
; cut menu to 10 items
	ld a, 10
	jr .cut_menu
.lessthan7
; cut menu to 5 items
	ld a, 5
	; fallthrough
.cut_menu
	ld [hli], a ; cut length
; move the CANCEL indicator
	sla a ; a *= 2, because quantity is factored in
	add l
	ld l, a
	ld a, -1
	ld [hl], a
.got_menu
	ret

.GetAmountOfOpalShards:
; returns: a = qty. of opal shards
	ld hl, wItems ; pocket of OPAL_SHARD, see attributes.asm
	ld c, MAX_ITEMS ; search bound
.keep_looking
	ld a, [hli]
	cp -1
	jr z, .no_opal_shard
	dec c
	jr z, .no_opal_shard
	cp OPAL_SHARD
	jr z, .found_opal_shard
	inc hl ; skip quantity
	jr .keep_looking
.found_opal_shard
	ld a, [hl] ; get quantity
	jr .write_result
.no_opal_shard
	xor a
.write_result
	ld [wMenuSelectionQuantity], a
	ret

.FullMoveList:
	db 25 ; list length
; list items
	db PSYWAVE, 2
	db TELEPORT, 2
	db RAGE, 4
	db PAY_DAY, 4
	db MEGA_PUNCH, 6

	db REFLECT, 6
	db BUBBLEBEAM, 6
	db MIMIC, 8
	db DRAGON_RAGE, 8
	db MEGA_KICK, 10

	db METRONOME, 8
	db MEGA_DRAIN, 10
	db SEISMIC_TOSS, 10
	db THUNDER_WAVE, 10
	db SELFDESTRUCT, 12

	db BODY_SLAM, 14
	db SUBMISSION, 16
	db TRI_ATTACK, 16
	db FISSURE, 16
	db SUBSTITUTE, 18

	db SWORDS_DANCE, 20
	db ROCK_SLIDE, 22
	db DOUBLE_EDGE, 22
	db SKY_ATTACK, 22
	db EXPLOSION, 24
	db -1 ; terminator
.FullMoveListEnd:

.NotEnough:
	writetext RuinsOfAlphResearchCenterTutorNotEnoughShardsText
	waitbutton
	closetext
	end

.Refused:
	writetext RuinsOfAlphResearchCenterTutorThatsUnfortunateText
	waitbutton
	closetext
	end

.TeachMove:
	closetext
	callasm .PayTutorInShards
	opentext
	writetext RuinsOfAlphResearchCenterTutorExcellentTheseShardsText
	waitbutton
	closetext
	end

.PayTutorInShards:
; this is a variable `takeitem`, and idk what the script equivalent of this
; is soooo...
	ld a, OPAL_SHARD
	ld [wCurItem], a
	ld a, [wRuinsMoveTutorScratch] ; should have been set back in .LoadMovesMenu
	ld [wItemQuantityChange], a
	ld a, -1
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem
	ret

RuinsOfAlphResearchCenterPhoto: ; unreferenced
	jumptext RuinsOfAlphResearchCenterProfSilktreePhotoText

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

RuinsOfAlphResearchCenterApproachesComputerMovement:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

RuinsOfAlphResearchCenterApproachesPlayerMovement:
	step DOWN
	step_end

RuinsOfAlphResearchCenterLeavesPlayerMovement:
	step UP
	step_end

FossilSetStepCount:
	ld a, 50
	ld [wFossilStepCount], a
	ret

FossilCheckStepCount:
	ld a, [wFossilStepCount]
	cp 0
	jr z, .yes
	ld a, FALSE
	ld [wScriptVar], a
	ret
.yes
	ld a, TRUE
	ld [wScriptVar], a
	ret

RuinsOfAlphResearchCenterModifiedDexText:
	text "Done!"

	para "I modified your"
	line "#DEX."

	para "I added an"
	line "optional #DEX"

	para "to store UNOWN"
	line "data."

	para "It records them in"
	line "the sequence that"
	cont "they were caught."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "<PLAYER>'s #DEX"
	line "was upgraded."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "The UNOWN you"
	line "catch will all be"
	cont "recorded."

	para "Check to see how"
	line "many kinds exist."
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "You caught all the"
	line "UNOWN variations?"

	para "That's a great"
	line "achievement!"

	para "I've set up the"
	line "printer here for"
	cont "handling UNOWN."

	para "Feel free to use"
	line "it anytime."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "The RUINS are"
	line "about 1500 years"
	cont "old."

	para "But it's not known"
	line "why they were"
	cont "built--or by whom."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "I wonder how many"
	line "kinds of #MON"
	cont "are in the RUINS?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "#MON appeared"
	line "in the RUINS?"

	para "That's incredible"
	line "news!"

	para "We'll need to"
	line "investigate this."
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Our investigation,"
	line "with your help, is"

	para "giving us insight"
	line "into the RUINS."

	para "The RUINS appear"
	line "to have been built"

	para "as a habitat for"
	line "#MON."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "There are odd pat-"
	line "terns drawn on the"

	para "walls of the"
	line "RUINS."

	para "They must be the"
	line "keys for unravel-"
	cont "ing the mystery"
	cont "of the RUINS."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "The strange #-"
	line "MON you saw in the"
	cont "RUINS?"

	para "They appear to be"
	line "very much like the"

	para "drawings on the"
	line "walls there."

	para "Hmm…"

	para "That must mean"
	line "there are many"
	cont "kinds of them…"
	done

RuinsOfAlphResearchCenterUnusedText1: ; unreferenced
	text "We think something"
	line "caused the cryptic"

	para "patterns to appear"
	line "in the RUINS."

	para "We've focused our"
	line "studies on that."
	done

RuinsOfAlphResearchCenterUnusedText2: ; unreferenced
	text "According to my"
	line "research…"

	para "Those mysterious"
	line "patterns appeared"

	para "when the #COM"
	line "CENTER was built."

	para "It must mean that"
	line "radio waves have"

	para "some sort of a"
	line "link…"
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "Why did those"
	line "ancient patterns"

	para "appear on the wall"
	line "now?"

	para "The mystery"
	line "deepens…"
	done

RuinsOfAlphResearchCenterComputerText:
	text "RUINS OF ALPH"

	para "Exploration"
	line "Year 10"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "Mystery #MON"
	line "Name: UNOWN"

	para "A total of {d:NUM_UNOWN}"
	line "kinds found."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "This doesn't seem"
	line "to work yet."
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "UNOWN may be"
	line "printed out."
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
	text "It's a photo of"
	line "the RESEARCH"

	para "CENTER'S founder,"
	line "PROF.SILKTREE."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "There are many"
	line "academic books."

	para "Ancient Ruins…"
	line "Mysteries of the"
	cont "Ancients…"
	done

RuinsOfAlphResearchCenterFossilScientistDoYouHaveFossilText:
	text "Hiya!"

	para "I am important"
	line "doctor!"

	para "I come here to"
	line "find fossils at"
	cont "RUINS!"

	para "But I am not hav-"
	line "ing the luck!"

	para "With fossil, I can"
	line "be bringing the"

	para "ancient #MON"
	line "back to life with"

	para "my Resurrection"
	line "Machine!"

	para "Do you have fossil"
	line "maybe?"
	done

RuinsOfAlphResearchCenterFossilScientistNoFossilText:
	text "No fossil!"
	line "Is too bad!"
	done

RuinsOfAlphResearchCenterFossilScientistIsHelixFossilText:
	text "Oh! That is"
	line "HELIX FOSSIL!"

	para "Is fossil of"
	line "OMANYTE, a"
	cont "#MON that is"
	cont "being extinct!"

	para "You are wanting"
	line "me to bring the"

	para "OMANYTE back"
	line "to life?"
	done

RuinsOfAlphResearchCenterFossilScientistIsDomeFossilText:
	text "Oh! That is"
	line "DOME FOSSIL!"

	para "Is fossil of"
	line "KABUTO, a"
	cont "#MON that is"
	cont "being extinct!"

	para "You are wanting"
	line "me to bring the"

	para "KABUTO back"
	line "to life?"
	done

RuinsOfAlphResearchCenterFossilScientistIsOldAmberText:
	text "Oh! That is"
	line "OLD AMBER!"

	para "Is fossil of"
	line "AERODACTYL, a"
	cont "#MON that is"
	cont "being extinct!"

	para "You are wanting"
	line "me to bring the"

	para "AERODACTYL back"
	line "to life?"
	done

RuinsOfAlphResearchCenterFossilScientistGaveFossilText:
	text "Is good!"

	para "But I take a"
	line "little time!"

	para "You go for walk"
	line "a little while…"
	done

RuinsOfAlphResearchCenterFossilScientistNotDoneYetText:
	text "I am not being"
	line "done yet."

	para "I take a little"
	line "time!"

	para "You go walk."
	line "I am the busy!"
	done

RuinsOfAlphResearchCenterFossilScientistDoneOmanyteText:
	text "Where were you?"

	para "Your fossil is"
	line "back to life!"

	para "It was OMANYTE"
	line "like I think!"
	done

RuinsOfAlphResearchCenterFossilScientistDoneKabutoText:
	text "Where were you?"

	para "Your fossil is"
	line "back to life!"

	para "It was KABUTO"
	line "like I think!"
	done

RuinsOfAlphResearchCenterFossilScientistDoneAerodactylText:
	text "Where were you?"

	para "Your fossil is"
	line "back to life!"

	para "It was AERODACTYL"
	line "like I think!"
	done

RuinsOfAlphResearchCenterFossilScientistTakeGoodCareOfItText:
	text "Is very good!"

	para "You take good"
	line "care of it!"
	done

RuinsOfAlphResearchCenterFossilScientistNoRoomForFossilPokemonText:
	text "You having no"
	line "room for it!"

	para "I hold onto it so"
	line "you go make room,"
	cont "OK?"
	done

RuinsOfAlphResearchCenterPlayerReceivedOmanyteText:
	text "<PLAYER> received"
	line "OMANYTE!"
	done

RuinsOfAlphResearchCenterPlayerReceivedKabutoText:
	text "<PLAYER> received"
	line "KABUTO!"
	done

RuinsOfAlphResearchCenterPlayerReceivedAerodactylText:
	text "<PLAYER> received"
	line "AERODACTYL!"
	done

RuinsOfAlphResearchCenterTutorExplainText:
	text "Me? I'm in charge"
	line "of archaeology."

	para "Say, do you have"
	line "any OPAL SHARDs?"

	para "They can be found"
	line "in breakable rocks"
	cont "almost everywhere."

	para "I have a theory"
	line "that these shards"

	para "are remnants of"
	line "the ancient civi-"
	cont "lization that"
	cont "built these RUINS!"

	para "I would gladly"
	line "teach your #MON"

	para "some moves in"
	line "exchange."

	para "And the more you"
	line "help with our re-"
	cont "search, the more"
	cont "moves I can teach!"
	done

RuinsOfAlphResearchCenterTutorWantMeToTeachText:
	text "Want me to teach"
	line "your #MON some"
	cont "moves?"
	done

RuinsOfAlphResearchCenterTutorShallITeachText:
	text "Which move shall"
	line "I teach?"
	done

RuinsOfAlphResearchCenterTutorNotEnoughShardsText:
	text "You don't have"
	line "enough shards…"
	done

RuinsOfAlphResearchCenterTutorThatsUnfortunateText:
	text "That's unfortunate…"
	done

RuinsOfAlphResearchCenterTutorExcellentTheseShardsText:
	text "Excellent!"

	para "These shards may"
	line "come in handy!"

	para "Thanks again!"
	done

RuinsOfAlphResearchCenterTutorCaught7UnownText:
	text "Hey!"

	para "Thanks so much for"
	line "your help so far."

	para "You've caught 7"
	line "different kinds of"
	cont "UNOWN!"

	para "Now I can teach"
	line "more moves to your"
	cont "#MON!"
	done

RuinsOfAlphResearchCenterTutorCaught14UnownText:
	text "Wow!"

	para "We are discovering"
	line "more about the"

	para "RUINS every day"
	line "now thanks to you."

	para "You've caught 14"
	line "different kinds of"
	cont "UNOWN!"

	para "Now I can teach"
	line "more moves to your"
	cont "#MON!"
	done

RuinsOfAlphResearchCenterTutorCaught21UnownText:
	text "Amazing!"

	para "We are getting"
	line "closer to finding"

	para "the secrets of the"
	line "RUINS!"

	para "You've caught 21"
	line "different kinds of"
	cont "UNOWN!"

	para "Now I can teach"
	line "more moves to your"
	cont "#MON!"
	done

RuinsOfAlphResearchCenterTutorCaughtAllUnownText:
	text "Incredible!"

	para "Thanks to your"
	line "efforts, our re-"
	cont "search is almost"
	cont "complete!"

	para "You've caught all"
	line "of the UNOWN!"

	para "Now I can teach"
	line "more moves to your"
	cont "#MON!"
	done

RuinsOfAlphResearchCenterTutorMoveText:
	text_start
	done

RuinsOfAlphResearchCenterIAlmostForgotText:
	text "Oh!"
	line "I almost forgot…"
	
	para "I found these in"
	line "the RUINS,"
	
	para "Maybe you can make"
	line "use of them?"
	done

RuinsOfAlphResearchCenterPlayerReceived10OpalShardsText:
	text "<PLAYER> received"
	line "10 OPAL SHARDs!"
	done

RuinsOfAlphResearchCenterNoRoomInBagText:
	text_far _CantCarryItemText
	text_end

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	def_coord_events

	def_bg_events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer
	bg_event  7,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter

	def_object_events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	object_event  0,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterFossilScientistScript, -1
	object_event  2,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterTutotScientistScript, -1
