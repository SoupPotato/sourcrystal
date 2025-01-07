	object_const_def
	const SAFARIZONEENTRANCE_OFFICER
	const SAFARIZONEENTRANCE_OFFICER2
	const SAFARIZONEENTRANCE_OFFICER3
	const SAFARIZONEENTRANCE_GENTLEMAN

SafariZoneEntrance_MapScripts:
	def_scene_scripts
	scene_script SafariZoneEntranceNoop1Scene, SCENE_SAFARIZONEENTRANCE_NOTHING
	scene_script LeaveSafariEarly, SCENE_SAFARIZONEENTRANCE_LEAVE_SAFARI_EARLY

	def_callbacks

SafariZoneEntranceNoop1Scene:
	end

LeaveSafariEarly:
	sdefer .LeavingSafariEarly

.SafariIsRunning: ; unreferenced
	setscene SCENE_SAFARIZONEENTRANCE_LEAVE_SAFARI_EARLY
	endcallback

.LeavingSafariEarly
	turnobject SAFARIZONEENTRANCE_OFFICER3, RIGHT
	applymovement PLAYER, MovementData_PlayerTriestoLeaveSafari
	opentext
	writetext SafariZoneEntranceMainOfficer_Text5
	yesorno
	iffalse .SafariZoneEntranceMainOfficer_Notleaving
	clearflag ENGINE_SAFARI_ZONE
	writetext SafariZoneEntranceMainOfficer_Text7
	waitbutton
	closetext
	applymovement PLAYER, MovementData_PlayerLeaveSafari
	applymovement SAFARIZONEENTRANCE_OFFICER3, MovementData_Officer2_Leave
	opentext
	writetext SafariZoneEntranceMainOfficer_Text8
	waitbutton
	closetext
	setevent EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_ACTIVE
	clearevent EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_NOT_ACTIVE
	setscene SCENE_SAFARIZONEENTRANCE_NOTHING
	appear SAFARIZONEENTRANCE_OFFICER2
	pause 1
	disappear SAFARIZONEENTRANCE_OFFICER3
	end

.SafariZoneEntranceMainOfficer_Notleaving:
	writetext SafariZoneEntranceMainOfficer_Text6
	waitbutton
	closetext
	applymovement PLAYER, MovementData_PlayerReEntersSafari
	playsound SFX_ENTER_DOOR
	special FadeOutToWhite
	waitsfx
	warpfacing UP, SAFARI_ZONE_AREA_1, 18, 25
	end

SafariZoneEntranceMainOfficerScript:
	faceplayer
	opentext
	writetext SafariZoneEntranceMainOfficer_Text
	yesorno
	iffalse .SafariZoneEntranceMainOfficer_Declined
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, .NotEnoughMoney
	setflag ENGINE_SAFARI_ZONE
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 500
	writetext SafariZoneEntranceMainOfficer_Text3
	promptbutton
	writetext SafariZoneEntranceReceivedBalls_Text
	playsound SFX_ITEM
	waitsfx
	writetext SafariZoneEntranceMainOfficer_Text4
	waitbutton
	closetext
	setscene SCENE_SAFARIZONEENTRANCE_LEAVE_SAFARI_EARLY
	special GiveSafariBalls
	scall .SafariZoneEntrance_EnterSafari
	playsound SFX_ENTER_DOOR
	special FadeOutToWhite
	waitsfx
	warpfacing UP, SAFARI_ZONE_AREA_1, 18, 25
	setevent EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_NOT_ACTIVE
	clearevent EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_ACTIVE
	end

.BoxFull:
	writetext SafariZoneBoxFullText
	waitbutton
	closetext
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
	turnobject SAFARIZONEENTRANCE_OFFICER, RIGHT
	end

SafariZoneEntranceOfficer_NotFirstTime:
	writetext SafariZoneEntranceOfficer_Text2
	waitbutton
	closetext
	end

SafariZoneEntranceBaoboScript:
	faceplayer
	opentext
	writetext SafariZoneEntranceBaoboHello_Text
	promptbutton
	checkevent EVENT_ROUTE_39_BAOBA_GAVE_EXP_SHARE
	iffalse .didnt_get_exp_share
	writetext SafariZoneEntranceBaoboDidYouKnow_Text
	waitbutton
	closetext
	end

.didnt_get_exp_share
	writetext SafariZoneEntranceBaoboGiveExpShareText
	waitbutton
	giveitem EXP_SHARE
	iffalse .bag_full
	waitsfx
	writetext SafariZoneGotExpShareText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_ROUTE_39_BAOBA_GAVE_EXP_SHARE
	writetext SafariZoneEntranceBaoboDidYouKnow_Text
	waitbutton
	closetext
	end

.bag_full
	writetext SafariZoneEntranceBaoboBagfullText
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

MovementData_PlayerTriestoLeaveSafari:
	step DOWN
	turn_head LEFT
	step_end

MovementData_PlayerLeaveSafari:
	step DOWN
	step DOWN
	turn_head UP
	step_end

MovementData_Officer2_Leave:
	step RIGHT
	step DOWN
	step_end

MovementData_PlayerReEntersSafari:
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
	cont "BALLS, it's game"
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
	cont "BALLS here."
	done

SafariZoneEntranceMainOfficer_Text4:
	text "We'll call you on"
	line "the PA when you"
	cont "run out of time"
	cont "or SAFARI BALLS!"
	
	para "Good luck!"
	done

SafariZoneEntranceMainOfficer_Text5:
	text "Oh, are you"
	line "leaving early?"
	done

SafariZoneEntranceMainOfficer_Text6:
	text "Good luck!"
	done

SafariZoneEntranceMainOfficer_Text7:
	text "Please return any"
	line "SAFARI BALLS you"
	cont "have left."
	done

SafariZoneEntranceMainOfficer_Text8:
	text "We look forward to"
	line "your next visit!"
	done

SafariZoneEntranceReceivedBalls_Text:
	text "<PLAYER> received"
	line "30 SAFARI BALLS."
	done

SafariZoneEntranceMainOfficer_NotEnoughMoneyText:
	text "Oh dear, you don't"
	line "have enough money."
	done

SafariZoneEntranceBaoboHello_Text:
	text "BAOBA: Hello!"
	line "So glad you made"
	cont "it here."
	done

SafariZoneEntranceBaoboDidYouKnow_Text:
	text "Did you know?"

	para "I used to run a"
	line "SAFARI ZONE in"
	cont "FUCHSIA CITY, but"
	cont "I decided to ex-"
	cont "pand the business"
	cont "to JOHTO."
	
	para "I hope you enjoy"
	line "your time here!"
	done

SafariZoneEntranceBaoboGiveExpShareText:
	text "Here is the gift "
	line "I promised you."
	done

SafariZoneBoxFullText:
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

SafariZoneGotExpShareText:
	text "<PLAYER> received"
	line "EXP.SHARE."
	done

SafariZoneEntranceBaoboBagfullText:
	text "Oh dear, you have"
	line "no room for this."
	done

SafariZoneEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  0, SAFARI_ZONE_AREA_1, 1
	warp_event  2,  9, SAFARI_ZONE_GATE, 1
	warp_event  3,  9, SAFARI_ZONE_GATE, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  6, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, SafariZoneEntranceOfficerScript, -1
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, SafariZoneEntranceMainOfficerScript, EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_NOT_ACTIVE
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, SafariZoneEntranceMainOfficerScript, EVENT_SAFARI_ZONE_ENTRANCE_OFFICER_SAFARI_GAME_ACTIVE
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, SafariZoneEntranceBaoboScript, 0
