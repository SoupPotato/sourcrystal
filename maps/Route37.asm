	const_def 2 ; object constants
	const ROUTE37_TWIN1
	const ROUTE37_TWIN2
	const ROUTE37_YOUNGSTER
	const ROUTE37_APRICORN
	const ROUTE37_SUNNY
	const ROUTE37_APRICORN2
	const ROUTE37_APRICORN3

Route37_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .FruittreesandSunny

.FruittreesandSunny
.Apricorn:
	checkflag ENGINE_DAILY_ROUTE37_APRICORN
	iftrue .NoApricorn
	appear ROUTE37_APRICORN
.NoApricorn:
	;return

.Apricorn2:
	checkflag ENGINE_DAILY_ROUTE37_APRICORN2
	iftrue .NoApricorn2
	appear ROUTE37_APRICORN2
.NoApricorn2:
	;return

.Apricorn3:
	checkflag ENGINE_DAILY_ROUTE37_APRICORN3
	iftrue .NoApricorn3
	appear ROUTE37_APRICORN3
.NoApricorn3:
	;return

.Sunny:
	checkcode VAR_WEEKDAY
	ifequal SUNDAY, .SunnyAppears
	disappear ROUTE37_SUNNY
	return

.SunnyAppears:
	appear ROUTE37_SUNNY
	return

TrainerTwinsAnnandanne1:
	trainer TWINS, ANNANDANNE1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne1SeenText, TwinsAnnandanne1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAnnandanne2:
	trainer TWINS, ANNANDANNE2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinsAnnandanne2SeenText, TwinsAnnandanne2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsAnnandanne2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicGreg:
	trainer PSYCHIC_T, GREG, EVENT_BEAT_PSYCHIC_GREG, PsychicGregSeenText, PsychicGregBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGregAfterBattleText
	waitbutton
	closetext
	end

SunnyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_MAGNET_FROM_SUNNY
	iftrue SunnySundayScript
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, SunnyNotSundayScript
	checkevent EVENT_MET_SUNNY_OF_SUNDAY
	iftrue .MetSunny
	writetext MeetSunnyText
	buttonsound
	setevent EVENT_MET_SUNNY_OF_SUNDAY
.MetSunny:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Kris
	writetext SunnyGivesGiftText1
	buttonsound
	jump .next
.Kris:
	writetext SunnyGivesGiftText2
	buttonsound
.next
	verbosegiveitem MAGNET
	iffalse SunnyDoneScript
	setevent EVENT_GOT_MAGNET_FROM_SUNNY
	writetext SunnyGaveGiftText
	waitbutton
	closetext
	end

SunnySundayScript:
	writetext SunnySundayText
	waitbutton
SunnyDoneScript:
	closetext
	end

SunnyNotSundayScript:
	writetext SunnyNotSundayText
	waitbutton
	closetext
	end

Route37Sign:
	jumptext Route37SignText

Route37ApricornTree:
	opentext
	writetext Route37ApricornTreeText
	buttonsound
	writetext Route37HeyItsApricornText
	buttonsound
	verbosegiveitem RED_APRICORN
	iffalse .NoRoomInBag
	disappear ROUTE37_APRICORN
	setflag ENGINE_DAILY_ROUTE37_APRICORN
.NoRoomInBag
	closetext
	end

Route37ApricornTree2:
	opentext
	writetext Route37ApricornTreeText
	buttonsound
	writetext Route37HeyItsApricorn2Text
	buttonsound
	verbosegiveitem BLU_APRICORN
	iffalse .NoRoomInBag
	disappear ROUTE37_APRICORN2
	setflag ENGINE_DAILY_ROUTE37_APRICORN2
.NoRoomInBag
	closetext
	end

Route37ApricornTree3:
	opentext
	writetext Route37ApricornTreeText
	buttonsound
	writetext Route37HeyItsApricorn3Text
	buttonsound
	verbosegiveitem BLK_APRICORN
	iffalse .NoRoomInBag
	disappear ROUTE37_APRICORN3
	setflag ENGINE_DAILY_ROUTE37_APRICORN3
.NoRoomInBag
	closetext
	end

Route37NoApricorn:
	opentext
	writetext Route37ApricornTreeText
	buttonsound
	writetext Route37NothingHereText
	waitbutton
	closetext
	end

Route37HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_37_HIDDEN_ETHER

TwinsAnnandanne1SeenText:
	text "ANN: ANNE and I"
	line "are in this to-"
	cont "gether!"
	done

TwinsAnnandanne1BeatenText:
	text "ANN & ANNE: Nnn… A"
	line "little too strong."
	done

TwinsAnnandanne1AfterBattleText:
	text "ANN: I can tell"
	line "what my sister and"

	para "my #MON are"
	line "thinking."
	done

TwinsAnnandanne2SeenText:
	text "ANNE: ANN and I"
	line "are in this to-"
	cont "gether!"
	done

TwinsAnnandanne2BeatenText:
	text "ANN & ANNE: Nnn… A"
	line "little too strong."
	done

TwinsAnnandanne2AfterBattleText:
	text "ANNE: We share the"
	line "same feelings as"
	cont "our #MON."
	done

PsychicGregSeenText:
	text "#MON can't do a"
	line "thing if they are"
	cont "asleep."

	para "I'll show you how"
	line "scary that is!"
	done

PsychicGregBeatenText:
	text "I lost. That's"
	line "pretty sad…"
	done

PsychicGregAfterBattleText:
	text "Putting #MON to"
	line "sleep or paralyz-"
	cont "ing them are good"
	cont "battle techniques."
	done

MeetSunnyText:
	text "SUNNY: Hi!"

	para "I'm SUNNY of Sun-"
	line "day, meaning it's"
	cont "Sunday today!"
	done

SunnyGivesGiftText1:
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done

SunnyGivesGiftText2:
	text "I was told to give"
	line "you this if I saw"
	cont "you!"
	done

SunnyGaveGiftText:
	text "SUNNY: That thing…"

	para "Um…"

	para "… What was it now…"

	para "…"

	para "Oh! I remember"
	line "now!"

	para "A #MON that"
	line "knows electric"

	para "moves should hold"
	line "it."

	para "My sis MONICA said"
	line "it powers up"
	cont "electric moves!"
	done

SunnySundayText:
	text "SUNNY: My sisters"
	line "and brothers are"
	cont "MONICA, TUSCANY,"
	cont "WESLEY, ARTHUR,"
	cont "FRIEDA and SANTOS."

	para "They're all older"
	line "than me!"
	done

SunnyNotSundayText:
	text "SUNNY: Isn't today"
	line "Sunday?"
	cont "Um… I forgot!"
	done

Route37SignText:
	text "ROUTE 37"
	done

Route37BerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

Route37ApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

Route37HeyItsApricornText:
	text "Hey! It's"
	line "RED APRICORN!"
	done

Route37HeyItsApricorn2Text:
	text "Hey! It's"
	line "BLU APRICORN!"
	done

Route37HeyItsApricorn3Text:
	text "Hey! It's"
	line "BLK APRICORN!"
	done

Route37NothingHereText:
	text "There's nothing"
	line "here…"
	done

Route37_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 5 ; bg events
	bg_event  5,  3, BGEVENT_READ, Route37Sign
	bg_event  4,  2, BGEVENT_ITEM, Route37HiddenEther
	bg_event 13,  5, BGEVENT_READ, Route37NoApricorn
	bg_event 16,  5, BGEVENT_READ, Route37NoApricorn
	bg_event 15,  7, BGEVENT_READ, Route37NoApricorn

	db 7 ; object events
	object_event  6, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne1, -1
	object_event  7, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, TrainerTwinsAnnandanne2, -1
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicGreg, -1
	object_event 13,  5, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route37ApricornTree, EVENT_ROUTE37_APRICORN
	object_event 16,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SunnyScript, EVENT_ROUTE_37_SUNNY_OF_SUNDAY
	object_event 16,  5, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route37ApricornTree2, EVENT_ROUTE37_APRICORN2
	object_event 15,  7, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, Route37ApricornTree3, EVENT_ROUTE37_APRICORN3
