	object_const_def
	const ROUTE2S_BUG_CATCHER1
	const ROUTE2S_BUG_CATCHER2
	const ROUTE2S_POKE_BALL1
	const ROUTE2S_POKE_BALL2
	const ROUTE2S_POKE_BALL3
	const ROUTE2S_POKE_BALL4
	const ROUTE2S_FRUIT_TREE

Route2South_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerBugCatcherRob:
	trainer BUG_CATCHER, ROB1, EVENT_BEAT_BUG_CATCHER_ROB, BugCatcherRobSeenText, BugCatcherRobBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_ROB
	opentext
	checkflag ENGINE_ROB_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_ROB_HAS_BERRY
	iftrue .RobItem
	checkcellnum PHONE_BUG_CATCHER_ROB
	iftrue .RobDefeated
	checkevent EVENT_ROB_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	writetext BugCatcherRobAfterBattleText
	promptbutton
	setevent EVENT_ROB_ASKED_FOR_PHONE_NUMBER
	scall Route2SouthAskNumber1
	jump .AskForNumber

.AskedBefore:
	scall Route2SouthAskNumber2
.AskForNumber:
	askforphonenumber PHONE_BUG_CATCHER_ROB
	ifequal PHONE_CONTACTS_FULL, Route2SouthPhoneFull
	ifequal PHONE_CONTACT_REFUSED, Route2SouthNumberDeclined
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ROB1
	scall Route2SouthRegisteredNumber
	jump Route2SouthNumberAccepted

.WantsBattle:
	scall Route2SouthRematch
	winlosstext BugCatcherRobBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftrue .LoadFight2
	checkevent EVENT_BEAT_BLAINE
	iftrue .LoadFight1
	loadtrainer BUG_CATCHER, ROB1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ROB_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, ROB2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ROB_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, ROB3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ROB_READY_FOR_REMATCH
	end

.RobItem:
	scall Route2SouthGiftItem
	random 4
	ifequal 0, .chestoberry
	ifequal 1, .leppaberry
	ifequal 2, .lumberry
	ifequal 3, .sitrusberry

.chestoberry:
	verbosegiveitem CHESTO_BERRY
	iffalse Route2SouthPackFull
	jump .Done

.leppaberry:
	verbosegiveitem LEPPA_BERRY
	iffalse Route2SouthPackFull
	jump .Done

.lumberry:
	verbosegiveitem LUM_BERRY
	iffalse Route2SouthPackFull
	jump .Done

.sitrusberry:
	verbosegiveitem SITRUS_BERRY
	iffalse Route2SouthPackFull

.Done:
	clearflag ENGINE_ROB_HAS_BERRY
	setflag ENGINE_ROB_GAVE_BERRY
	jump Route2SouthNumberAccepted

.RobDefeated:
	writetext BugCatcherRobAfterBattleText
	promptbutton
	closetext
	end

TrainerBugCatcherDoug:
	trainer BUG_CATCHER, DOUG1, EVENT_BEAT_BUG_CATCHER_DOUG, BugCatcherDougSeenText, BugCatcherDougBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_DOUG
	opentext
	checkflag ENGINE_DOUG_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkflag ENGINE_DOUG_HAS_BERRY
	iftrue .DougItem
	checkcellnum PHONE_BUG_CATCHER_DOUG
	iftrue .DougDefeated
	checkevent EVENT_DOUG_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	writetext BugCatcherDougAfterBattleText
	promptbutton
	setevent EVENT_DOUG_ASKED_FOR_PHONE_NUMBER
	scall Route2SouthAskNumber1
	jump .AskForNumber

.AskedBefore:
	scall Route2SouthAskNumber2
.AskForNumber:
	askforphonenumber PHONE_BUG_CATCHER_DOUG
	ifequal PHONE_CONTACTS_FULL, Route2SouthPhoneFull
	ifequal PHONE_CONTACT_REFUSED, Route2SouthNumberDeclined
	gettrainername STRING_BUFFER_3, BUG_CATCHER, DOUG1
	scall Route2SouthRegisteredNumber
	jump Route2SouthNumberAccepted

.WantsBattle:
	scall Route2SouthRematch
	winlosstext BugCatcherDougBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftrue .LoadFight2
	checkevent EVENT_BEAT_BLAINE
	iftrue .LoadFight1
	loadtrainer BUG_CATCHER, DOUG1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DOUG_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, DOUG2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DOUG_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, DOUG3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DOUG_READY_FOR_REMATCH
	end

.DougItem:
	scall Route2SouthGiftItem
	random 4
	ifequal 0, .chestoberry
	ifequal 1, .leppaberry
	ifequal 2, .lumberry
	ifequal 3, .sitrusberry

.chestoberry:
	verbosegiveitem CHESTO_BERRY
	iffalse Route2SouthPackFull
	jump .Done

.leppaberry:
	verbosegiveitem LEPPA_BERRY
	iffalse Route2SouthPackFull
	jump .Done

.lumberry:
	verbosegiveitem LUM_BERRY
	iffalse Route2SouthPackFull
	jump .Done

.sitrusberry:
	verbosegiveitem SITRUS_BERRY
	iffalse Route2SouthPackFull

.Done:
	clearflag ENGINE_DOUG_HAS_BERRY
	setflag ENGINE_DOUG_GAVE_BERRY
	jump Route2SouthNumberAccepted

.DougDefeated:
	writetext BugCatcherDougAfterBattleText
	promptbutton
	closetext
	end

Route2SouthAskNumber1:
	jumpstd AskNumber1MScript
	end

Route2SouthAskNumber2:
	jumpstd AskNumber2MScript
	end

Route2SouthRegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

Route2SouthNumberAccepted:
	jumpstd NumberAcceptedMScript
	end

Route2SouthNumberDeclined:
	jumpstd NumberDeclinedMScript
	end

Route2SouthPhoneFull:
	jumpstd PhoneFullMScript
	end

Route2SouthRematch:
	jumpstd RematchMScript
	end

Route2SouthGiftItem:
	jumpstd GiftMScript
	end

Route2SouthPackFull:
	jumpstd PackFullMScript
	end

Route2Sign:
	jumptext Route2SignText

Route2DireHit:
	itemball DIRE_HIT

Route2Elixer:
	itemball ELIXER

BugCatcherRobSeenText:
	text "My bug #MON are"
	line "tough. Prepare to"
	cont "lose!"
	done

BugCatcherRobBeatenText:
	text "I was whipped…"
	done

BugCatcherRobAfterBattleText:
	text "I'm going to look"
	line "for stronger bug"
	cont "#MON."
	done

BugCatcherDougSeenText:
	text "Why don't girls"
	line "like bug #MON?"
	done

BugCatcherDougBeatenText:
	text "No good!"
	done

BugCatcherDougAfterBattleText:
	text "Bug #MON squish"
	line "like plush toys"

	para "when you squeeze"
	line "their bellies."

	para "I love how they"
	line "feel!"
	done

Route2SignText:
	text "ROUTE 2"

	para "VIRIDIAN CITY -"
	line "PEWTER CITY"
	done

Route2South_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17,  1, ROUTE_2_GATE, 3
	warp_event  5,  5, VIRIDIAN_FOREST_GATE_S, 3

	def_coord_events

	def_bg_events
	bg_event  7, 27, BGEVENT_READ, Route2Sign

	def_object_events
	object_event 12, 20, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 5, TrainerBugCatcherRob, -1
	object_event  2, 14, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherDoug, -1
	object_event 15,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2DireHit, EVENT_ROUTE_2_DIRE_HIT
	object_event 15, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Elixer, EVENT_ROUTE_2_ELIXER
