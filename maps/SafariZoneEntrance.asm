	const_def 2 ; object constants
	const SAFARIZONEENTRANCE_OFFICER
	const SAFARIZONEENTRANCE_OFFICER2

SafariZoneEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneEntranceMainOfficerScript:
	faceplayer
	opentext
	writetext SafariZoneEntranceMainOfficer_Text
	yesorno
	iffalse .SafariZoneEntranceMainOfficer_Declined
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, .NotEnoughMoney
	setflag ENGINE_SAFARI_ZONE
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 500
	writetext SafariZoneEntranceMainOfficer_Text3
	buttonsound
	writetext SafariZoneEntranceReceivedBalls_Text
	playsound SFX_ITEM
	waitsfx
	writetext SafariZoneEntranceMainOfficer_Text4
	waitbutton
	closetext
	special GiveSafariBalls
	scall .SafariZoneEntrance_EnterSafari
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing UP, SAFARI_ZONE_AREA_1, 18, 25
	end

.SafariZoneEntrance_EnterSafari:
	applymovement SAFARIZONEENTRANCE_OFFICER2, MovementData_Officer2
	applymovement PLAYER, MovementData_PlayerEnterSafari
	end

.SafariZoneEntranceMainOfficer_Declined:
	writetext SafariZoneEntranceMainOfficer_Text2
	waitbutton
	closetext
	end

.NotEnoughMoney
	writetext SafariZoneEntranceMainOfficer_NotEnoughMoneyText
	waitbutton
	closetext
	end

SafariZoneEntranceOfficerScript:
	faceplayer
	opentext
	writetext SafariZoneEntranceOfficer_Text
	yesorno
	iffalse SafariZoneEntranceOfficer_NotFirstTime
	writetext SafariZoneEntranceOfficer_Text3
	waitbutton
	closetext
	end

SafariZoneEntranceOfficer_NotFirstTime:
	writetext SafariZoneEntranceOfficer_Text2
	waitbutton
	closetext
	end

MovementData_Officer2:
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_PlayerEnterSafari:
	step UP
	step UP
	step UP
	step_end

SafariZoneEntranceOfficer_Text:
	text "Hi! Is it your"
	line "first time here at"
	cont "the SAFARI ZONE?"
	done

SafariZoneEntranceOfficer_Text2:
	text "Have fun at the"
	line "SAFARI ZONE!"
	done

SafariZoneEntranceOfficer_Text3:
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
	cont "BALLs, it's game"
	cont "over for you!"
	
	para "Before you enter,"
	line "make sure you have"
	cont "room in your PC"
	cont "storage for new"
	cont "#MON!"
	done

SafariZoneEntranceMainOfficer_Text:
	text "Welcome to the"
	line "SAFARI ZONE!"
	
	para "For just ¥500,"
	line "you can catch all"
	cont "the #MON you"
	cont "want in the park!"
	
	para "Would you like to"
	line "play?"
	done

SafariZoneEntranceMainOfficer_Text2:
	text "OK! Please come"
	line "again!"
	done

SafariZoneEntranceMainOfficer_Text3:
	text "That'll be ¥500"
	line "please!"
	
	para "We only allow the"
	line "use of our SAFARI"
	cont "BALLs here."
	done

SafariZoneEntranceMainOfficer_Text4:
	text "We'll call you on"
	line "the PA when you"
	cont "run out of time"
	cont "or SAFARI BALLs!"
	
	para "Good luck!"
	done

SafariZoneEntranceReceivedBalls_Text:
	text "<PLAYER> received"
	line "30 SAFARI BALLS."
	done

SafariZoneEntranceMainOfficer_NotEnoughMoneyText:
	text "Oh dear, you don't"
	line "have enough money."
	done


SafariZoneEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  0, SAFARI_ZONE_AREA_1, 1
	warp_event  2,  9, SAFARI_ZONE_GATE, 1
	warp_event  3,  9, SAFARI_ZONE_GATE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, SafariZoneEntranceOfficerScript, -1
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, SafariZoneEntranceMainOfficerScript, -1
