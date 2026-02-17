	object_const_def
	const SAFARI_ZONE_KANTO_ENTRANCE_OFFICER
	const SAFARI_ZONE_KANTO_ENTRANCE_OFFICER2
	const SAFARI_ZONE_KANTO_ENTRANCE_OFFICER3
	const SAFARI_ZONE_KANTO_ENTRANCE_GENTLEMAN

SafariZoneKantoEntrance_MapScripts:
	def_scene_scripts
	scene_script SafariZoneKantoEntranceNoop1Scene, SCENE_SAFARI_ZONE_KANTO_ENTRANCE_NOTHING
	scene_script LeaveSafariKantoEarly, SCENE_SAFARI_ZONE_KANTO_ENTRANCE_LEAVE_SAFARI_EARLY

	def_callbacks

SafariZoneKantoEntranceNoop1Scene:
	end

LeaveSafariKantoEarly:
	sdefer .LeavingSafariEarly

.SafariIsRunning: ; unreferenced
	setscene SCENE_SAFARI_ZONE_KANTO_ENTRANCE_LEAVE_SAFARI_EARLY
	endcallback

.LeavingSafariEarly
	turnobject SAFARI_ZONE_KANTO_ENTRANCE_OFFICER3, RIGHT
	applymovement PLAYER, SafariZoneKantoMovementData_PlayerTriestoLeaveSafari
	opentext
	writetext SafariZoneKantoEntranceMainOfficer_Text5
	yesorno
	iffalse .SafariZoneKantoEntranceMainOfficer_Notleaving
	clearflag ENGINE_SAFARI_ZONE
	writetext SafariZoneKantoEntranceMainOfficer_Text7
	waitbutton
	closetext
	applymovement PLAYER, SafariZoneKantoMovementData_PlayerLeaveSafari
	applymovement SAFARI_ZONE_KANTO_ENTRANCE_OFFICER3, SafariZoneKantoMovementData_Officer2_Leave
	opentext
	writetext SafariZoneKantoEntranceMainOfficer_Text8
	waitbutton
	closetext
	setevent EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_ACTIVE
	clearevent EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_NOT_ACTIVE
	setscene SCENE_SAFARI_ZONE_KANTO_ENTRANCE_NOTHING
	appear SAFARI_ZONE_KANTO_ENTRANCE_OFFICER2
	pause 1
	disappear SAFARI_ZONE_KANTO_ENTRANCE_OFFICER3
	end

.SafariZoneKantoEntranceMainOfficer_Notleaving:
	writetext SafariZoneKantoEntranceMainOfficer_Text6
	waitbutton
	closetext
	applymovement PLAYER, SafariZoneKantoMovementData_PlayerReEntersSafari
	playsound SFX_ENTER_DOOR
	special FadeOutToWhite
	waitsfx
	warpfacing UP, SAFARI_ZONE_KANTO_AREA_1, 14, 25
	end

SafariZoneKantoEntranceMainOfficerScript:
	faceplayer
	opentext
	writetext SafariZoneKantoEntranceMainOfficer_Text
	yesorno
	iffalse .SafariZoneKantoEntranceMainOfficer_Declined
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, .NotEnoughMoney
	setflag ENGINE_SAFARI_ZONE
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 500
	writetext SafariZoneKantoEntranceMainOfficer_Text3
	promptbutton
	writetext SafariZoneKantoEntranceReceivedBalls_Text
	playsound SFX_ITEM
	waitsfx
	writetext SafariZoneKantoEntranceMainOfficer_Text4
	waitbutton
	closetext
	setscene SCENE_SAFARI_ZONE_KANTO_ENTRANCE_LEAVE_SAFARI_EARLY
	special GiveSafariBalls
	scall .SafariZoneKantoEntrance_EnterSafari
	playsound SFX_ENTER_DOOR
	special FadeOutToWhite
	waitsfx
	warpfacing UP, SAFARI_ZONE_KANTO_AREA_1, 14, 25
	setevent EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_NOT_ACTIVE
	clearevent EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_ACTIVE
	end

.BoxFull:
	writetext SafariZoneKantoBoxFullText
	waitbutton
	closetext
	end

.SafariZoneKantoEntrance_EnterSafari:
	applymovement SAFARI_ZONE_KANTO_ENTRANCE_OFFICER2, SafariZoneKantoMovementData_Officer2
	applymovement PLAYER, SafariZoneKantoMovementData_PlayerEnterSafari
	end

.SafariZoneKantoEntranceMainOfficer_Declined:
	writetext SafariZoneKantoEntranceMainOfficer_Text2
	waitbutton
	closetext
	end

.NotEnoughMoney
	writetext SafariZoneKantoEntranceMainOfficer_NotEnoughMoneyText
	waitbutton
	closetext
	end

SafariZoneKantoEntranceOfficerScript:
	faceplayer
	opentext
	writetext SafariZoneKantoEntranceOfficer_Text
	yesorno
	iffalse SafariZoneKantoEntranceOfficer_NotFirstTime
	writetext SafariZoneKantoEntranceOfficer_Text3
	waitbutton
	closetext
	turnobject SAFARI_ZONE_KANTO_ENTRANCE_OFFICER, RIGHT
	end

SafariZoneKantoEntranceOfficer_NotFirstTime:
	writetext SafariZoneKantoEntranceOfficer_Text2
	waitbutton
	closetext
	end

SafariZoneKantoMovementData_Officer2:
	step UP
	step LEFT
	turn_head RIGHT
	step_end

SafariZoneKantoMovementData_PlayerEnterSafari:
	step UP
	step UP
	step UP
	step_end

SafariZoneKantoMovementData_PlayerTriestoLeaveSafari:
	step DOWN
	turn_head LEFT
	step_end

SafariZoneKantoMovementData_PlayerLeaveSafari:
	step DOWN
	step DOWN
	turn_head UP
	step_end

SafariZoneKantoMovementData_Officer2_Leave:
	step RIGHT
	step DOWN
	step_end

SafariZoneKantoMovementData_PlayerReEntersSafari:
	step UP
	step_end

SafariZoneKantoEntranceOfficer_Text:
	text "Hi! Is it your"
	line "first time here at"
	cont "the SAFARI ZONE?"
	done

SafariZoneKantoEntranceOfficer_Text2:
	text "Have fun at the"
	line "SAFARI ZONE!"
	done

SafariZoneKantoEntranceOfficer_Text3:
	text "SAFARI ZONE has 4"
	line "areas for you to"
	cont "explore."
	
	para "Each area has"
	line "different kinds"
	cont "of #MON."
	
	para "Use the SAFARI"
	line "BALLS we provide"
	cont "to catch whatever"
	cont "#MON you want!"
	
	para "When you run out"
	line "of time or SAFARI"
	cont "BALLS, it's game"
	cont "over for you!"
	
	para "Before you enter,"
	line "make sure you have"
	cont "room in your PC"
	cont "storage for new"
	cont "#MON!"
	done

SafariZoneKantoEntranceMainOfficer_Text:
	text "Welcome to the"
	line "SAFARI ZONE!"
	
	para "For just ¥500,"
	line "you can catch all"
	cont "the #MON you"
	cont "want in the park!"
	
	para "Would you like to"
	line "play?"
	done

SafariZoneKantoEntranceMainOfficer_Text2:
	text "OK! Please come"
	line "again!"
	done

SafariZoneKantoEntranceMainOfficer_Text3:
	text "That'll be ¥500"
	line "please!"
	
	para "We only allow the"
	line "use of our SAFARI"
	cont "BALLS here."
	done

SafariZoneKantoEntranceMainOfficer_Text4:
	text "We'll call you on"
	line "the PA when you"
	cont "run out of time"
	cont "or SAFARI BALLS!"
	
	para "Good luck!"
	done

SafariZoneKantoEntranceMainOfficer_Text5:
	text "Oh, are you"
	line "leaving early?"
	done

SafariZoneKantoEntranceMainOfficer_Text6:
	text "Good luck!"
	done

SafariZoneKantoEntranceMainOfficer_Text7:
	text "Please return any"
	line "SAFARI BALLS you"
	cont "have left."
	done

SafariZoneKantoEntranceMainOfficer_Text8:
	text "We look forward to"
	line "your next visit!"
	done

SafariZoneKantoEntranceReceivedBalls_Text:
	text "<PLAYER> received"
	line "30 SAFARI BALLS."
	done

SafariZoneKantoEntranceMainOfficer_NotEnoughMoneyText:
	text "Oh dear, you don't"
	line "have enough money."
	done

SafariZoneKantoBoxFullText:
	text "Uh-oh…"
	line "Both your party"

	para "and your PC BOX"
	line "are full."

	para "You have no room"
	line "for any #MON"
	cont "you catch."

	para "Please make room"
	line "in your party or"

	para "your PC BOX, then"
	line "come see me."
	done

SafariZoneKantoEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, SAFARI_ZONE_KANTO_AREA_1, 1
	warp_event  2,  9, FUCHSIA_CITY, 7
	warp_event  3,  9, FUCHSIA_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, SafariZoneKantoEntranceOfficerScript, -1
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, SafariZoneKantoEntranceMainOfficerScript, EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_NOT_ACTIVE
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, SafariZoneKantoEntranceMainOfficerScript, EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_ACTIVE
