	object_const_def
	const ROUTE_17_BIKER1
	const ROUTE_17_BIKER2
	const ROUTE_17_BIKER3
	const ROUTE_17_BIKER4

Route17_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route17AlwaysOnBikeCallback

Route17AlwaysOnBikeCallback:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	endcallback

TrainerBikerReese:
	trainer BIKER, REESE1, EVENT_BEAT_BIKER_REESE, BikerReeseSeenText, BikerReeseBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BIKER_REESE
	opentext
	checkflag ENGINE_REESE_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_BIKER_REESE
	iftrue .ReeseDefeated
	checkevent EVENT_REESE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	writetext BikerReeseAfterBattleText
	waitbutton
	setevent EVENT_REESE_ASKED_FOR_PHONE_NUMBER
	scall Route17AskNumber1
	jump .AskForNumber

.AskedBefore:
	scall Route17AskNumber2
.AskForNumber:
	askforphonenumber PHONE_BIKER_REESE
	ifequal PHONE_CONTACTS_FULL, Route17PhoneFull
	ifequal PHONE_CONTACT_REFUSED, Route17NumberDeclined
	gettrainername STRING_BUFFER_3, BIKER, REESE1
	scall Route17RegisteredNumber
	jump Route17NumberAccepted

.WantsBattle:
	scall Route17Rematch
	winlosstext BikerReeseBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftrue .LoadFight2
	checkevent ENGINE_FLYPOINT_PEWTER
	iftrue .LoadFight1
	loadtrainer BIKER, REESE1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REESE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BIKER, REESE2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REESE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BIKER, REESE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REESE_READY_FOR_REMATCH
	end

.ReeseDefeated:
	writetext BikerReeseAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerJoseph:
	trainer BIKER, JOSEPH, EVENT_BEAT_BIKER_JOSEPH, BikerJosephSeenText, BikerJosephBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJosephAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerEoin:
	trainer BIKER, EOIN1, EVENT_BEAT_BIKER_EOIN, BikerEoinSeenText, BikerEoinBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BIKER_EOIN
	opentext
	checkflag ENGINE_EOIN_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_BIKER_EOIN
	iftrue .EoinDefeated
	checkevent EVENT_EOIN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	writetext BikerEoinAfterBattleText
	waitbutton
	setevent EVENT_EOIN_ASKED_FOR_PHONE_NUMBER
	scall Route17AskNumber1
	jump .AskForNumber

.AskedBefore:
	scall Route17AskNumber2
.AskForNumber:
	askforphonenumber PHONE_BIKER_EOIN
	ifequal PHONE_CONTACTS_FULL, Route17PhoneFull
	ifequal PHONE_CONTACT_REFUSED, Route17NumberDeclined
	gettrainername STRING_BUFFER_3, BIKER, EOIN1
	scall Route17RegisteredNumber
	jump Route17NumberAccepted

.WantsBattle:
	scall Route17Rematch
	winlosstext BikerEoinBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftrue .LoadFight2
	checkevent ENGINE_FLYPOINT_PEWTER
	iftrue .LoadFight1
	loadtrainer BIKER, EOIN1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_EOIN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BIKER, EOIN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_EOIN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BIKER, EOIN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_EOIN_READY_FOR_REMATCH
	end

.EoinDefeated:
	writetext BikerEoinAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerAiden:
	trainer BIKER, AIDEN1, EVENT_BEAT_BIKER_AIDEN, BikerAidenSeenText, BikerAidenBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BIKER_AIDEN
	opentext
	checkflag ENGINE_AIDEN_READY_FOR_REMATCH
	iftrue .WantsBattle
	checkcellnum PHONE_BIKER_AIDEN
	iftrue .AidenDefeated
	checkevent EVENT_AIDEN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedBefore
	writetext BikerAidenAfterBattleText
	waitbutton
	setevent EVENT_AIDEN_ASKED_FOR_PHONE_NUMBER
	scall Route17AskNumber1
	jump .AskForNumber

.AskedBefore:
	scall Route17AskNumber2
.AskForNumber:
	askforphonenumber PHONE_BIKER_AIDEN
	ifequal PHONE_CONTACTS_FULL, Route17PhoneFull
	ifequal PHONE_CONTACT_REFUSED, Route17NumberDeclined
	gettrainername STRING_BUFFER_3, BIKER, AIDEN1
	scall Route17RegisteredNumber
	jump Route17NumberAccepted

.WantsBattle:
	scall Route17Rematch
	winlosstext BikerAidenBeatenText, 0
	checkevent EVENT_BEAT_BLUE
	iftrue .LoadFight2
	checkevent ENGINE_FLYPOINT_PEWTER
	iftrue .LoadFight1
	loadtrainer BIKER, AIDEN1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_AIDEN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BIKER, AIDEN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_AIDEN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BIKER, AIDEN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_AIDEN_READY_FOR_REMATCH
	end

.AidenDefeated:
	writetext BikerAidenAfterBattleText
	waitbutton
	closetext
	end

Route17AskNumber1:
	jumpstd AskNumber1MScript
	end

Route17AskNumber2:
	jumpstd AskNumber2MScript
	end

Route17RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

Route17NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

Route17NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

Route17PhoneFull:
	jumpstd PhoneFullMScript
	end

Route17Rematch:
	jumpstd RematchMScript
	end

TrainerBikerTheron:
	trainer BIKER, THERON, EVENT_BEAT_BIKER_THERON, BikerTheronSeenText, BikerTheronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerTheronAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerTeddy:
	trainer BIKER, TEDDY, EVENT_BEAT_BIKER_TEDDY, BikerTeddySeenText, BikerTeddyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerTeddyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerMarkey:
	trainer BIKER, MARKEY, EVENT_BEAT_BIKER_MARKEY, BikerMarkeySeenText, BikerMarkeyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerMarkeyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerCharles:
	trainer BIKER, CHARLES, EVENT_BEAT_BIKER_CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerRiley:
	trainer BIKER, RILEY, EVENT_BEAT_BIKER_RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRileyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerJoel:
	trainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJoelAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerGlenn:
	trainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerGlennAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerDan:
	trainer BIKER, DAN, EVENT_BEAT_BIKER_DAN, BikerDanSeenText, BikerDanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerDanAfterBattleText
	waitbutton
	closetext
	end

Route17HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_17_HIDDEN_MAX_ETHER

Route17HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_17_HIDDEN_MAX_ELIXER

BikerReeseSeenText:
	text "Hey, you! You're"
	line "from JOHTO, huh?"
	done

BikerReeseBeatenText:
	text "Whoa, you kick!"
	done

BikerReeseAfterBattleText:
	text "Don't get cocky,"
	line "you JOHTO punk!"
	done

BikerJosephSeenText:
	text "Modding my BIKE"
	line "costs a bunch of"
	cont "money!"

	para "I need a job!"
	done

BikerJosephBeatenText:
	text "Argh. I failed!"
	done

BikerJosephAfterBattleText:
	text "BIKE?"

	para "Oh, I was talking"
	line "about my BICYCLE!"
	done

BikerEoinSeenText:
	text "Vroom vroom!"
	line "Baribaribaribari!"

	para "What do you think"
	line "of my engine"
	cont "imitation?"
	done

BikerEoinBeatenText:
	text "Hnnff…hnnff…"
	line "I'm out of breath…"
	done

BikerEoinAfterBattleText:
	text "We don't put out"
	line "any exhaust fumes."

	para "We're a biker club"
	line "that's kind to"
	cont "nature!"
	done

BikerAidenSeenText:
	text "Hey, who told you"
	line "you could ride up"
	cont "and down this"
	cont "road?"
	done

BikerAidenBeatenText:
	text "Crash!"
	done

BikerAidenAfterBattleText:
	text "Awesome BIKE!"
	line "Treat it well!"
	done

BikerDanSeenText:
	text "Parara parapara"
	line "para-parara!"

	para "My horn's got a"
	line "great melody to"
	cont "it, don't you"
	cont "think?"
	done

BikerDanBeatenText:
	text "Paaraaraaaaa…"
	done

BikerDanAfterBattleText:
	text "I love this melan-"
	line "choly melody."

	para "It really suits"
	line "me well…"
	done

BikerTheronSeenText:
	text "I'll toughen you"
	line "up."

	para "Now, you come"
	line "along with me."
	done

BikerTheronBeatenText:
	text "All right, thanks!"
	done

BikerTheronAfterBattleText:
	text "All right! That"
	line "fighting yell was"
	cont "great!"
	done

BikerTeddySeenText:
	text "Hey, that's a"
	line "cool BIKE you're"
	cont "riding!"
	done

BikerTeddyBeatenText:
	text "Great job."
	done

BikerTeddyAfterBattleText:
	text "I love the way you"
	line "do battle, too!"

	para "Consider me a fan!"
	done

BikerMarkeySeenText:
	text "Hey hey hey!"
	line "You're in my way!"

	para "IN MY WAY!"
	done

BikerMarkeyBeatenText:
	text "I lost. I lost!"
	done

BikerMarkeyAfterBattleText:
	text "Won't you give it"
	line "a try?"

	para "Would you like to"
	line "join my team?"
	done

BikerRileySeenText:
	text "You're gonna lose!"
	line "I've got a hunch!"
	done

BikerRileyBeatenText:
	text "Maybe my hunch was"
	line "a little off…"
	done

BikerRileyAfterBattleText:
	text "You're so cool!"

	para "You don't do any-"
	line "thing halfway!"
	done

BikerJoelSeenText:
	text "Wow. That's a cool"
	line "BICYCLE!"
	done

BikerJoelBeatenText:
	text "But you don't just"
	line "look cool…"
	done

BikerJoelAfterBattleText:
	text "I look cool, but"
	line "I'm weak, so I'm"
	cont "not really cool."

	para "I have to train"
	line "harder…"
	done

BikerGlennSeenText:
	text "Hey! Want to have"
	line "a speed battle?"
	done

BikerGlennBeatenText:
	text "Yikes! You've got"
	line "awesome torque!"
	done

BikerGlennAfterBattleText:
	text "Hands-free riding"
	line "is considered cool"
	cont "on CYCLING ROAD."
	done

BikerCharlesSeenText:
	text "We're fearless"
	line "highway stars!"
	done

BikerCharlesBeatenText:
	text "Arrrgh! Crash and"
	line "burn!"
	done

BikerCharlesAfterBattleText:
	text "Reckless driving"
	line "causes accidents!"
	cont "Take it easy!"
	done

Route17_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 14, 10, BGEVENT_ITEM, Route17HiddenMaxEther
	bg_event  9, 111, BGEVENT_ITEM, Route17HiddenMaxElixer

	def_object_events
	object_event  8,  9, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, -1
	object_event 12, 19, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerJoel, -1
	object_event  3, 88, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBikerGlenn, -1
	object_event  9, 120, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerCharles, -1
	object_event  4, 15, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerReese, -1
	object_event 14, 37, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerJoseph, -1
	object_event 14, 95, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerEoin, -1
	object_event  5, 31, SPRITE_BIKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE,  0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerAiden, -1
	object_event 17, 61, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerTheron, -1
	object_event  2, 59, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerTeddy, -1
	object_event  5, 103, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerMarkey, -1
	object_event  9, 63, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerDan, -1
