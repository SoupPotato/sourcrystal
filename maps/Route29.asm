	object_const_def
	const ROUTE_29_COOLTRAINER_M1
	const ROUTE_29_YOUNGSTER
	const ROUTE_29_TEACHER1
	const ROUTE_29_BERRY
	const ROUTE_29_APRICORN
	const ROUTE_29_FISHER
	const ROUTE_29_COOLTRAINER_M2
	const ROUTE_29_TUSCANY
	const ROUTE_29_POKE_BALL

Route29_MapScripts:
	def_scene_scripts
	scene_script Route29Noop1Scene, SCENE_ROUTE_29_NOOP
	scene_script Route29Noop2Scene, SCENE_ROUTE_29_CATCH_TUTORIAL

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route29FruittreesandTuscany

Route29Noop1Scene:
	end

Route29Noop2Scene:
	end

Route29FruittreesandTuscany:
.Berry:
	checkflag ENGINE_DAILY_ROUTE_29_BERRY
	iftrue .NoBerry
	appear ROUTE_29_BERRY
.NoBerry:
	;fallthrough

.Apricorn:
	checkflag ENGINE_DAILY_ROUTE_29_APRICORN
	iftrue .NoApricorn
	appear ROUTE_29_APRICORN
.NoApricorn:
	;fallthrough

.Tuscany:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE_29_TUSCANY
	endcallback

.DoesTuscanyAppear:
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE_29_TUSCANY
	endcallback

Route29Tutorial1:
	turnobject ROUTE_29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE_29_COOLTRAINER_M1, 15
	applymovement ROUTE_29_COOLTRAINER_M1, DudeMovementData1a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial1
	closetext
	follow ROUTE_29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE_29_COOLTRAINER_M1, DudeMovementData1b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE_29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE_29_NOOP
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Route29Tutorial2:
	turnobject ROUTE_29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE_29_COOLTRAINER_M1, 15
	applymovement ROUTE_29_COOLTRAINER_M1, DudeMovementData2a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial2
	closetext
	follow ROUTE_29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE_29_COOLTRAINER_M1, DudeMovementData2b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE_29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE_29_NOOP
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Script_RefusedTutorial1:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE_29_COOLTRAINER_M1, DudeMovementData1b
	setscene SCENE_ROUTE_29_NOOP
	end

Script_RefusedTutorial2:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE_29_COOLTRAINER_M1, DudeMovementData2b
	setscene SCENE_ROUTE_29_NOOP
	end

CatchingTutorialDudeScript:
	faceplayer
	opentext
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .BoxFull
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse .BoxFull
	writetext CatchingTutorialRepeatText
	yesorno
	iffalse .Declined
	closetext
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

.BoxFull:
	writetext CatchingTutorialBoxFullText
	waitbutton
	closetext
	end

.Declined:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	end

Route29YoungsterScript:
	jumptextfaceplayer Route29YoungsterText

Route29TeacherScript:
	jumptextfaceplayer Route29TeacherText

Route29FisherScript:
	jumptextfaceplayer Route29FisherText

Route29CooltrainerMScript:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime NITE
	iftrue .nite
.day_morn
	writetext Route29CooltrainerMText_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Route29CooltrainerMText_WaitingForMorning
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TWISTEDSPOON_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	promptbutton
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	promptbutton
	verbosegiveitem TWISTEDSPOON
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_TWISTEDSPOON_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

Route29Sign1:
	jumptext Route29Sign1Text

Route29Sign2:
	jumptext Route29Sign2Text

Route29BerryTree:
	opentext
	getitemname STRING_BUFFER_3, ORAN_BERRY
	writetext Route29BerryTreeText
	promptbutton
	writetext Route29HeyItsBerryApricornText
	promptbutton
	giveitem ORAN_BERRY
	iffalse Route29NoRoomInBag
	disappear ROUTE_29_BERRY
	setflag ENGINE_DAILY_ROUTE_29_BERRY
	writetext Route29FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route29ApricornTree:
	opentext
	getitemname STRING_BUFFER_3, GRN_APRICORN
	writetext Route29ApricornTreeText
	promptbutton
	writetext Route29HeyItsBerryApricornText
	promptbutton
	giveitem GRN_APRICORN
	iffalse Route29NoRoomInBag
	disappear ROUTE_29_APRICORN
	setflag ENGINE_DAILY_ROUTE_29_APRICORN
	writetext Route29FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route29NoBerry:
	opentext
	writetext Route29BerryTreeText
	promptbutton
	writetext Route29NothingHereText
	waitbutton
	closetext
	end

Route29NoApricorn:
	opentext
	writetext Route29ApricornTreeText
	promptbutton
	writetext Route29NothingHereText
	waitbutton
	closetext
	end

Route29NoRoomInBag:
	writetext Route29NoRoomInBagText
	waitbutton
	closetext
	end

Route29Potion:
	itemball POTION

DudeMovementData1a:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData2a:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData1b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DudeMovementData2b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

CatchingTutorialBoxFullText:
	text "#MON hide in"
	line "the grass. Who"

	para "knows when they'll"
	line "pop out…"
	done

CatchingTutorialIntroText:
	text "I've seen you a"
	line "couple times. How"

	para "many #MON have"
	line "you caught?"

	para "Would you like me"
	line "to show you how to"
	cont "catch #MON?"
	done

CatchingTutorialDebriefText:
	text "That's how you do"
	line "it."

	para "If you weaken them"
	line "first, #MON are"
	cont "easier to catch."
	done

CatchingTutorialDeclinedText:
	text "Oh. Fine, then."

	para "Anyway, if you"
	line "want to catch"

	para "#MON, you have"
	line "to walk a lot."
	done

CatchingTutorialRepeatText:
	text "Huh? You want me"
	line "to show you how to"
	cont "catch #MON?"
	done

Route29YoungsterText:
	text "Yo. How are your"
	line "#MON?"

	para "If they're weak"
	line "and not ready for"

	para "battle, keep out"
	line "of the grass."
	done

Route29TeacherText:
	text "See those ledges?"
	line "It's scary to jump"
	cont "off them."

	para "But you can go to"
	line "NEW BARK without"

	para "walking through"
	line "the grass."
	done

Route29FisherText:
	text "I wanted to take a"
	line "break, so I saved"

	para "to record my"
	line "progress."
	done

Route29CooltrainerMText_WaitingForDay: ; unreferenced
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "daytime."
	done

Route29CooltrainerMText_WaitingForNight:
	text "I'm waiting for"
	line "#MON that"

	para "appear only at"
	line "night."
	done

Route29CooltrainerMText_WaitingForMorning:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "morning."
	done

MeetTuscanyText:
	text "TUSCANY: I do be-"
	line "lieve that this is"

	para "the first time"
	line "we've met?"

	para "Please allow me to"
	line "introduce myself."

	para "I am TUSCANY of"
	line "Tuesday."
	done

TuscanyGivesGiftText:
	text "By way of intro-"
	line "duction, please"

	para "accept this gift,"
	line "a TWISTEDSPOON."
	done

TuscanyGaveGiftText:
	text "TUSCANY: Wouldn't"
	line "you agree that it"
	cont "is most adorable?"

	para "It strengthens"
	line "psychic-type"
	cont "moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText:
	text "TUSCANY: Have you"
	line "met MONICA, my"
	cont "older sister?"

	para "Or my younger"
	line "brother, WESLEY?"

	para "I am the second of"
	line "seven children."
	done

TuscanyNotTuesdayText:
	text "TUSCANY: Today is"
	line "not Tuesday. That"
	cont "is unfortunate…"
	done

Route29Sign1Text:
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done

Route29Sign2Text:
	text "ROUTE 29"

	para "CHERRYGROVE CITY -"
	line "NEW BARK TOWN"
	done

Route29BerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

Route29ApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

Route29NothingHereText:
	text "There's nothing"
	line "here…"
	done

Route29HeyItsBerryApricornText:
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Route29FoundItemText:
	text_far _FoundItemText
	text_end

Route29NoRoomInBagText:
	text_far _CantCarryItemText
	text_end


Route29_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  1, ROUTE_29_ROUTE_46_GATE, 3

	def_coord_events
	coord_event 53,  8, SCENE_ROUTE_29_CATCH_TUTORIAL, Route29Tutorial1
	coord_event 53,  9, SCENE_ROUTE_29_CATCH_TUTORIAL, Route29Tutorial2

	def_bg_events
	bg_event 51,  7, BGEVENT_READ, Route29Sign1
	bg_event  3,  5, BGEVENT_READ, Route29Sign2
	bg_event 24, 13, BGEVENT_READ, Route29NoBerry
	bg_event 12,  2, BGEVENT_READ, Route29NoApricorn

	def_object_events
	object_event 50, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CatchingTutorialDudeScript, -1
	object_event 27, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29YoungsterScript, -1
	object_event 15, 11, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29TeacherScript, -1
	object_event 24, 13, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route29BerryTree, EVENT_ROUTE_29_BERRY
	object_event 12,  2, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29ApricornTree, EVENT_ROUTE_29_APRICORN
	object_event 25,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route29FisherScript, -1
	object_event 13,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29CooltrainerMScript, -1
	object_event 29, 12, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 48,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION
