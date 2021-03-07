	const_def 2 ; object constants
	const ROUTE1_YOUNGSTER1
	const ROUTE1_YOUNGSTER2
	const ROUTE1_COOLTRAINER_F
	const ROUTE1_COOLTRAINER_M
	const ROUTE1_BERRY
	const ROUTE1_APRICORN

Route1_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Fruittrees
	
.Fruittrees
.Berry:
	checkflag ENGINE_DAILY_ROUTE1_BERRY
	iftrue .NoBerry
	appear ROUTE1_BERRY
.NoBerry:
	;return
	
.Apricorn:
	checkflag ENGINE_DAILY_ROUTE1_APRICORN
	iftrue .NoApricorn
	appear ROUTE1_APRICORN
.NoApricorn:
	return

TrainerSchoolboyDanny:
	trainer SCHOOLBOY, DANNY, EVENT_BEAT_SCHOOLBOY_DANNY, SchoolboyDannySeenText, SchoolboyDannyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDannyAfterBattleText
	waitbutton
	closetext
	end
	
TrainerSchoolboySherman:
	trainer SCHOOLBOY, SHERMAN, EVENT_BEAT_SCHOOLBOY_SHERMAN, SchoolboyShermanSeenText, SchoolboyShermanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyShermanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermFrench:
	trainer COOLTRAINERM, FRENCH, EVENT_BEAT_COOLTRAINERM_FRENCH, CooltrainermFrenchSeenText, CooltrainermFrenchBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermFrenchAfterBattleText
	waitbutton
	closetext
	end
	
TrainerCooltrainerfQuinn:
	trainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERF_QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfQuinnAfterBattleText
	waitbutton
	closetext
	end

Route1Sign:
	jumptext Route1SignText

Route1BerryTree:
	opentext
	writetext Route1BerryTreeText
	buttonsound
	writetext Route1HeyItsBerryText
	buttonsound
	verbosegiveitem PERSIM_BERRY
	iffalse .NoRoomInBag
	disappear ROUTE1_BERRY
	setflag ENGINE_DAILY_ROUTE1_BERRY
.NoRoomInBag
	closetext
	end
	
Route1ApricornTree:
	opentext
	writetext Route1ApricornTreeText
	buttonsound	
	writetext Route1HeyItsApricornText
	buttonsound
	verbosegiveitem BLK_APRICORN
	iffalse .NoRoomInBag
	disappear ROUTE1_APRICORN
	setflag ENGINE_DAILY_ROUTE1_APRICORN
.NoRoomInBag
	closetext
	end

Route1NoBerry:
	opentext
	writetext Route1BerryTreeText
	buttonsound
	writetext Route1NothingHereText
	waitbutton
	closetext
	end

Route1NoApricorn:
	opentext
	writetext Route1ApricornTreeText
	buttonsound
	writetext Route1NothingHereText
	waitbutton
	closetext
	end

SchoolboyDannySeenText:
	text "If trainers meet,"
	line "the first thing to"
	cont "do is battle."
	done

SchoolboyDannyBeatenText:
	text "Awww… I've got a"
	line "losing record…"
	done

SchoolboyDannyAfterBattleText:
	text "For trainers, it's"
	line "a given that we'll"

	para "battle whenever we"
	line "meet."
	done
	
SchoolboyShermanSeenText:
	text "Right after"
	line "learning it in"
	
	para "class, I head"
	line "outside to"
	cont "practice!"
	done

SchoolboyShermanBeatenText:
	text "I need to follow"
	line "the textbook."
	done

SchoolboyShermanAfterBattleText:
	text "I should be sure"
	line "to record all of"

	para "today's mistakes"
	line "in a notebook!"
	done
	
CooltrainermFrenchSeenText:
	text "You!"
	line "I've been waiting"
	
	para "for someone like"
	line "you!"
	done

CooltrainermFrenchBeatenText:
	text "Yep, just as"
	line "strong as"
	cont "expected!"
	done

CooltrainermFrenchAfterBattleText:
	text "That was a great"
	line "fight!"

	para "Don't you agree?"
	done

CooltrainerfQuinnSeenText:
	text "You there!"
	line "Want to battle?"
	done

CooltrainerfQuinnBeatenText:
	text "Down and out…"
	done

CooltrainerfQuinnAfterBattleText:
	text "You're strong."

	para "You obviously must"
	line "have trained hard."
	done

Route1SignText:
	text "ROUTE 1"

	para "PALLET TOWN -"
	line "VIRIDIAN CITY"
	done
	
Route1BerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

Route1HeyItsBerryText:
	text "Hey! It's"
	line "PERSIM BERRY!"
	done

Route1ApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

Route1HeyItsApricornText:
	text "Hey! It's"
	line "BLK APRICORN!"
	done	

Route1NothingHereText:
	text "There's nothing"
	line "here…"
	done

Route1_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 3 ; bg events
	bg_event  9, 27, BGEVENT_READ, Route1Sign
	bg_event  7,  7, BGEVENT_READ, Route1NoBerry
	bg_event  5,  7, BGEVENT_READ, Route1NoApricorn

	db 6 ; object events
	object_event  9, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyDanny, -1
	object_event 10, 21, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermFrench, -1
	object_event 13,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboySherman, -1
	object_event 11, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfQuinn, -1
	object_event  7,  7, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route1BerryTree, EVENT_ROUTE1_BERRY
	object_event  5,  7, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, Route1ApricornTree, EVENT_ROUTE1_APRICORN
