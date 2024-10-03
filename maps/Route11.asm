	object_const_def
	const ROUTE_11_YOUNGSTER1
	const ROUTE_11_YOUNGSTER2
	const ROUTE_11_YOUNGSTER3
	const ROUTE_11_YOUNGSTER4
	const ROUTE_11_BERRY
	const ROUTE_11_APRICORN
	const ROUTE_11_BIG_SNORLAX
	const ROUTE_11_BIG_SNORLAX_RESPAWN
	const ROUTE_11_POKE_BALL

Route11_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route11Fruittrees

Route11Fruittrees:
.Berry:
	checkflag ENGINE_DAILY_ROUTE_11_BERRY
	iftrue .NoBerry
	appear ROUTE_11_BERRY
.NoBerry:
	;fallthrough

.Apricorn:
	checkflag ENGINE_DAILY_ROUTE_11_APRICORN
	iftrue .NoApricorn
	appear ROUTE_11_APRICORN
.NoApricorn:
	endcallback

TrainerYoungsterOwen:
	trainer YOUNGSTER, OWEN, EVENT_BEAT_YOUNGSTER_OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterOwenAfterBattleText
	waitbutton
	closetext
	end

Route11DiglettsCaveSign:
	jumptext Route11DiglettsCaveSignText

Route11Snorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext Route11SnorlaxSleepingText
	waitbutton
	closetext
	end

.Awake:
	writetext Route11RadioNearSnorlaxText
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear ROUTE_11_BIG_SNORLAX
	disappear ROUTE_11_BIG_SNORLAX_RESPAWN
	setevent EVENT_FOUGHT_SNORLAX
	setevent EVENT_ROUTE_11_SNORLAX
	reloadmapafterbattle
	special CheckBattleCaughtResult
	iffalse .nocatch
	setflag ENGINE_PLAYER_CAUGHT_SNORLAX
.nocatch
	end

TrainerYoungsterJason:
	trainer YOUNGSTER, JASON, EVENT_BEAT_YOUNGSTER_JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterJasonAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicHerman:
	trainer PSYCHIC_T, HERMAN, EVENT_BEAT_PSYCHIC_HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicHermanAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFidel:
	trainer PSYCHIC_T, FIDEL, EVENT_BEAT_PSYCHIC_FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFidelAfterBattleText
	waitbutton
	closetext
	end

Route11Sign:
	jumptext Route11SignText

Route11BerryTree:
	opentext
	getitemname STRING_BUFFER_3, ORAN_BERRY
	writetext Route11BerryTreeText
	promptbutton
	writetext Route11HeyItsBerryApricornText
	promptbutton
	giveitem ORAN_BERRY
	iffalse Route11NoRoomInBag
	disappear ROUTE_11_BERRY
	setflag ENGINE_DAILY_ROUTE_11_BERRY
	writetext Route11FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route11ApricornTree:
	opentext
	getitemname STRING_BUFFER_3, GRN_APRICORN
	writetext Route11ApricornTreeText
	promptbutton
	writetext Route11HeyItsBerryApricornText
	promptbutton
	giveitem GRN_APRICORN
	iffalse Route11NoRoomInBag
	disappear ROUTE_11_APRICORN
	setflag ENGINE_DAILY_ROUTE_11_APRICORN
	writetext Route11FoundItemText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

Route11NoBerry:
	opentext
	writetext Route11BerryTreeText
	promptbutton
	writetext Route11NothingHereText
	waitbutton
	closetext
	end

Route11NoApricorn:
	opentext
	writetext Route11ApricornTreeText
	promptbutton
	writetext Route11NothingHereText
	waitbutton
	closetext
	end

Route11NoRoomInBag:
	writetext Route11NoRoomInBagText
	waitbutton
	closetext
	end

Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

Route11OpalShard:
	itemball OPAL_SHARD

YoungsterOwenSeenText:
	text "There's no cheat-"
	line "ing in #MON."

	para "Let's keep it fair"
	line "and square!"
	done

YoungsterOwenBeatenText:
	text "Huh? How did this"
	line "happen?"
	done

YoungsterOwenAfterBattleText:
	text "I fought fair and"
	line "square with honor."

	para "I don't regret"
	line "this at all."
	done

YoungsterJasonSeenText:
	text "It itches and"
	line "tickles a bit when"

	para "I wear shorts in"
	line "the grass."
	done

YoungsterJasonBeatenText:
	text "Aiyaaah!"
	line "I got stomped!"
	done

YoungsterJasonAfterBattleText:
	text "I'm going to catch"
	line "more #MON in"
	cont "the grass."
	done

PsychicHermanSeenText:
	text "…"
	done

PsychicHermanBeatenText:
	text "…"
	done

PsychicHermanAfterBattleText:
	text "…"

	para "I lost while I had"
	line "my eyes closed…"
	done

PsychicFidelSeenText:
	text "I can see it…"

	para "Everything to see"
	line "about you…"
	done

PsychicFidelBeatenText:
	text "I couldn't foresee"
	line "your power…"
	done

PsychicFidelAfterBattleText:
	text "Strength in con-"
	line "viction…"

	para "You're strong be-"
	line "cause you believe"
	cont "in your #MON."
	done

Route11SignText:
	text "ROUTE 11"
	done

Route11SnorlaxSleepingText:
	text "SNORLAX is snoring"
	line "peacefully…"
	done

Route11RadioNearSnorlaxText:
	text "The #GEAR was"
	line "placed near the"
	cont "sleeping SNORLAX…"

	para "…"

	para "SNORLAX woke up!"
	done

Route11DiglettsCaveSignText:
	text "DIGLETT'S CAVE"
	done

Route11BerryTreeText:
	text "It's a"
	line "BERRY tree…"
	done

Route11ApricornTreeText:
	text "It's an"
	line "APRICORN tree…"
	done

Route11NothingHereText:
	text "There's nothing"
	line "here…"
	done

Route11HeyItsBerryApricornText:
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Route11FoundItemText:
	text_far _FoundItemText
	text_end

Route11NoRoomInBagText:
	text_far _CantCarryItemText
	text_end

Route11_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8,  5, DIGLETTS_CAVE, 1
	warp_event 53,  8, ROUTE_11_GATE, 1
	warp_event 53,  9, ROUTE_11_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13,  5, BGEVENT_READ, Route11Sign
	bg_event 52,  5, BGEVENT_ITEM, Route11HiddenRevive
	bg_event  5,  5, BGEVENT_READ, Route11DiglettsCaveSign
	bg_event 52,  2, BGEVENT_READ, Route11NoBerry
	bg_event 53,  1, BGEVENT_READ, Route11NoApricorn

	def_object_events
	object_event 40, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	object_event 38,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJason, -1
	object_event 48,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicHerman, -1
	object_event 20,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	object_event 52,  2, SPRITE_BERRY, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route11BerryTree, EVENT_ROUTE_11_BERRY
	object_event 53,  1, SPRITE_APRICORN, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route11ApricornTree, EVENT_ROUTE_11_APRICORN
	object_event  8,  6, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11Snorlax, EVENT_ROUTE_11_SNORLAX
	object_event 51, 11, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11Snorlax, EVENT_ROUTE_11_SNORLAX_RESPAWN
	object_event 52, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route11OpalShard, EVENT_ROUTE_11_OPAL_SHARD
