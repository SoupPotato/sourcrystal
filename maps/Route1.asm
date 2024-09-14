	object_const_def
	const ROUTE_1_YOUNGSTER1
	const ROUTE_1_YOUNGSTER2
	const ROUTE_1_COOLTRAINER_F
	const ROUTE_1_COOLTRAINER_M
	const ROUTE_1_BERRY
	const ROUTE_1_APRICORN

Route1_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route1Fruittrees

Route1Fruittrees:
.Berry:
	checkflag ENGINE_DAILY_ROUTE_1_BERRY
	iftrue .NoBerry
	appear ROUTE_1_BERRY
.NoBerry:
	;fallthrough

.Apricorn:
	checkflag ENGINE_DAILY_ROUTE_1_APRICORN
	iftrue .NoApricorn
	appear ROUTE_1_APRICORN
.NoApricorn:
	endcallback

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
	getitemname STRING_BUFFER_3, PERSIM_BERRY
	writetext Route1BerryTreeText
	promptbutton
	writetext Route1HeyItsBerryApricornText
	promptbutton
	giveitem PERSIM_BERRY
	iffalse Route1NoRoomInBag
	disappear ROUTE_1_BERRY
	setflag ENGINE_DAILY_ROUTE_1_BERRY
	writetext Route1FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route1ApricornTree:
	opentext
	getitemname STRING_BUFFER_3, BLK_APRICORN
	writetext Route1ApricornTreeText
	promptbutton
	writetext Route1HeyItsBerryApricornText
	promptbutton
	giveitem BLK_APRICORN
	iffalse Route1NoRoomInBag
	disappear ROUTE_1_APRICORN
	setflag ENGINE_DAILY_ROUTE_1_APRICORN
	writetext Route1FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route1NoBerry:
	opentext
	writetext Route1BerryTreeText
	promptbutton
	writetext Route1NothingHereText
	waitbutton
	closetext
	end

Route1NoApricorn:
	opentext
	writetext Route1ApricornTreeText
	promptbutton
	writetext Route1NothingHereText
	waitbutton
	closetext
	end

Route1NoRoomInBag:
	writetext Route1NoRoomInBagText
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

Route1ApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

Route1NothingHereText:
	text "There's nothing"
	line "here…"
	done

Route1HeyItsBerryApricornText:
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Route1FoundItemText:
	text_far _FoundItemText
	text_end

Route1NoRoomInBagText:
	text_far _CantCarryItemText
	text_end

Route1_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  9, 27, BGEVENT_READ, Route1Sign
	bg_event  7,  7, BGEVENT_READ, Route1NoBerry
	bg_event  5,  7, BGEVENT_READ, Route1NoApricorn

	def_object_events
	object_event  9, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyDanny, -1
	object_event 10, 21, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermFrench, -1
	object_event 13,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboySherman, -1
	object_event 11, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfQuinn, -1
	object_event  7,  7, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route1BerryTree, EVENT_ROUTE_1_BERRY
	object_event  5,  7, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLACK, OBJECTTYPE_SCRIPT, 0, Route1ApricornTree, EVENT_ROUTE_1_APRICORN
