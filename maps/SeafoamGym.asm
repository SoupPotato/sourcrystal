	object_const_def
	const SEAFOAMGYM_BLAINE
	const SEAFOAMGYM_GYM_GUIDE
	const SEAFOAMGYM_LOWELL
	const SEAFOAMGYM_LOWELL_DEFEATED
	const SEAFOAMGYM_DANNIE
	const SEAFOAMGYM_DANNIE_DEFEATED
	const SEAFOAMGYM_CARY
	const SEAFOAMGYM_CARY_DEFEATED
	const SEAFOAMGYM_LINDEN
	const SEAFOAMGYM_LINDEN_DEFEATED
	const SEAFOAMGYM_WALDO
	const SEAFOAMGYM_WALDO_DEFEATED
	const SEAFOAMGYM_MERLE
	const SEAFOAMGYM_MERLE_DEFEATED


SeafoamGym_MapScripts:
	def_scene_scripts
	scene_script SeafoamGymNoopScene ; unusable

	def_callbacks

SeafoamGymNoopScene:
	end

SeafoamGymBlaineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RED
	iftrue .rematch
.skip_rematch
	checkflag ENGINE_VOLCANOBADGE
	iftrue .FightDone
	writetext BlaineIntroText
	waitbutton
	closetext
	winlosstext BlaineWinLossText, 0
	loadtrainer BLAINE, BLAINE1
	startbattle
	iftrue .ReturnAfterBattle
.ReturnAfterBattle:
	reloadmapafterbattle
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_SCIENTIST_LOWELL
	setevent EVENT_BEAT_SCIENTIST_DANNIE
	setevent EVENT_BEAT_SUPER_NERD_CARY
	setevent EVENT_BEAT_SCIENTIST_LINDEN
	setevent EVENT_BEAT_SUPER_NERD_WALDO
	setevent EVENT_BEAT_SUPER_NERD_MERLE
	opentext
	writetext ReceivedVolcanoBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext BlaineAfterBattleText
	waitbutton
	closetext
	end

.FightDone:
	writetext BlaineFightDoneText
	waitbutton
	closetext
	end

.rematch:
	checkflag ENGINE_DAILY_BLAINE_REMATCH
	iftrue .skip_rematch
	writetext BlaineRematchIntroText
	waitbutton
	closetext
	winlosstext BlaineRematchWinLossText, 0
	loadtrainer BLAINE, BLAINE2
	startbattle
	reloadmapafterbattle
	setflag ENGINE_DAILY_BLAINE_REMATCH
	opentext
	writetext BlaineRematchAfterBattleText
	waitbutton
	closetext
	end

TrainerScientistLowell:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SCIENTIST_LOWELL
	iftrue .Defeated
	writetext ScientistLowellSeenText
	waitbutton
	closetext
	winlosstext ScientistLowellBeatenText, 0
	loadtrainer SCIENTIST, LOWELL
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SCIENTIST_LOWELL
	opentext
	writetext ScientistLowellAfterBattleText
	waitbutton
	closetext
	applymovement SEAFOAMGYM_LOWELL, .MovementDataScientistLowell
	appear SEAFOAMGYM_LOWELL_DEFEATED
	pause 2
	disappear SEAFOAMGYM_LOWELL
	end

.Defeated:
	writetext ScientistLowellAfterBattleText
	waitbutton
	closetext
	end

.MovementDataScientistLowell:
	step UP
	turn_head DOWN
	step_end

TrainerScientistDannie:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SCIENTIST_DANNIE
	iftrue .Defeated
	writetext ScientistDannieSeenText
	waitbutton
	closetext
	winlosstext ScientistDannieBeatenText, 0
	loadtrainer SCIENTIST, DANNIE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SCIENTIST_DANNIE
	opentext
	writetext ScientistDannieAfterBattleText
	waitbutton
	closetext
	applymovement SEAFOAMGYM_DANNIE, .MovementDataScientistDannie
	appear SEAFOAMGYM_DANNIE_DEFEATED
	pause 2
	disappear SEAFOAMGYM_DANNIE
	end

.Defeated:
	writetext ScientistDannieAfterBattleText
	waitbutton
	closetext
	end

.MovementDataScientistDannie:
	step LEFT
	turn_head RIGHT
	step_end

TrainerSuperNerdCary:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SUPER_NERD_CARY
	iftrue .Defeated
	writetext SuperNerdCarySeenText
	waitbutton
	closetext
	winlosstext SuperNerdCaryBeatenText, 0
	loadtrainer SUPER_NERD, CARY
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SUPER_NERD_CARY
	opentext
	writetext SuperNerdCaryAfterBattleText
	waitbutton
	closetext
	applymovement SEAFOAMGYM_CARY, .MovementDataSuperNerdCary
	appear SEAFOAMGYM_CARY_DEFEATED
	pause 2
	disappear SEAFOAMGYM_CARY
	end

.Defeated:
	writetext SuperNerdCaryAfterBattleText
	waitbutton
	closetext
	end

.MovementDataSuperNerdCary:
	step RIGHT
	turn_head LEFT
	step_end

TrainerScientistLinden:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SCIENTIST_LINDEN
	iftrue .Defeated
	writetext ScientistLindenSeenText
	waitbutton
	closetext
	winlosstext ScientistLindenBeatenText, 0
	loadtrainer SCIENTIST, LINDEN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SCIENTIST_LINDEN
	opentext
	writetext ScientistLindenAfterBattleText
	waitbutton
	closetext
	applymovement SEAFOAMGYM_LINDEN, .MovementDataScientistLinden
	appear SEAFOAMGYM_LINDEN_DEFEATED
	pause 2
	disappear SEAFOAMGYM_LINDEN
	end

.Defeated:
	writetext ScientistLindenAfterBattleText
	waitbutton
	closetext
	end

.MovementDataScientistLinden:
	step LEFT
	turn_head RIGHT
	step_end

TrainerSuperNerdWaldo:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SUPER_NERD_WALDO
	iftrue .Defeated
	writetext SuperNerdWaldoSeenText
	waitbutton
	closetext
	winlosstext SuperNerdWaldoBeatenText, 0
	loadtrainer SUPER_NERD, WALDO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SUPER_NERD_WALDO
	opentext
	writetext SuperNerdWaldoAfterBattleText
	waitbutton
	closetext
	applymovement SEAFOAMGYM_WALDO, .MovementDataSuperNerdWaldo
	appear SEAFOAMGYM_WALDO_DEFEATED
	pause 2
	disappear SEAFOAMGYM_WALDO
	end

.Defeated:
	writetext SuperNerdWaldoAfterBattleText
	waitbutton
	closetext
	end

.MovementDataSuperNerdWaldo:
	step DOWN
	turn_head UP
	step_end

TrainerSuperNerdMerle:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SUPER_NERD_MERLE
	iftrue .Defeated
	writetext SuperNerdMerleSeenText
	waitbutton
	closetext
	winlosstext SuperNerdMerleBeatenText, 0
	loadtrainer SUPER_NERD, MERLE
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SUPER_NERD_MERLE
	opentext
	writetext SuperNerdMerleAfterBattleText
	waitbutton
	closetext
	applymovement SEAFOAMGYM_MERLE, .MovementDataSuperNerdMerle
	appear SEAFOAMGYM_MERLE_DEFEATED
	pause 2
	disappear SEAFOAMGYM_MERLE
	end

.Defeated:
	writetext SuperNerdMerleAfterBattleText
	waitbutton
	closetext
	end

.MovementDataSuperNerdMerle:
	step DOWN
	turn_head UP
	step_end

SeafoamGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLAINE
	iftrue .SeafoamGymGuideWinScript
	writetext SeafoamGymGuideText
	waitbutton
	closetext
	end

.SeafoamGymGuideWinScript:
	writetext SeafoamGymGuideWinText
	waitbutton
	closetext
	end

BlaineIntroText:
	text "BLAINE: Waaah!"

	para "My GYM in CINNABAR"
	line "burned down."

	para "My fire-breathing"
	line "#MON and I are"

	para "homeless because"
	line "of the volcano."

	para "Waaah!"

	para "But I'm back in"
	line "business as a GYM"

	para "LEADER here in"
	line "this cave."

	para "If you can beat"
	line "me, I'll give you"
	cont "a BADGE."

	para "Ha! You'd better"
	line "have BURN HEAL!"
	done

BlaineWinLossText:
	text "BLAINE: Awesome."
	line "I've burned out…"

	para "You've earned"
	line "VOLCANOBADGE!"
	done

ReceivedVolcanoBadgeText:
	text "<PLAYER> received"
	line "VOLCANOBADGE."
	done

BlaineAfterBattleText:
	text "BLAINE: I did lose"
	line "this time, but I'm"

	para "going to win the"
	line "next time."

	para "When I rebuild my"
	line "CINNABAR GYM,"

	para "we'll have to have"
	line "a rematch."
	done

BlaineFightDoneText:
	text "BLAINE: My fire"
	line "#MON will be"

	para "even stronger."
	line "Just you watch!"
	done

SeafoamGymGuideText:
	text "Yo, CHAMP in"
	line "making!"

	para "This GYM has many"
	line "Trainers and rocks"

	para "in the way from"
	line "the rebuilding."

	para "It sure wont be"
	line "easy to get to"
	cont "BLAINE!"

	para "But keep your cool"
	line "and defeat the"

	para "Trainers one by"
	line "one, and you will"

	para "surely find the"
	line "path!"
	done

SeafoamGymGuideWinText:
	text "The GYM Leader"
	line "rebuilding his"

	para "GYM and the"
	line "Trainer from"

	para "JOHTO who has come"
	line "to challenge that"
	cont "GYM Leader…"

	para "I have witnessed"
	line "a hot battle!"
	done

ScientistLowellSeenText:
	text "A white lab coat"
	line "is a researcher's"
	cont "life."

	para "We may be living"
	line "in a cave like"
	cont "this,"

	para "but we never for-"
	line "get to do the"
	cont "laundry."
	done

ScientistLowellBeatenText:
	text "It's pure white"
	line "in my head!"
	done

ScientistLowellAfterBattleText:
	text "This white lab"
	line "coat makes me feel"

	para "like I have become"
	line "smarter for some"
	cont "reason."
	done

ScientistDannieSeenText:
	text "We lost the GYM on"
	line "CINNABAR ISLAND"

	para "and felt lost"
	line "before we"
	cont "came here."
	done

ScientistDannieBeatenText:
	text "Argh!"
	done

ScientistDannieAfterBattleText:
	text "We take a step"
	line "back when we"
	cont "are defeated…"

	para "Don't you think"
	line "we are downright"
	cont "honest?"

	para "Never put us in"
	line "the same category"

	para "as SCIENTISTS who"
	line "help bad guys."
	done

SuperNerdCarySeenText:
	text "Wow, to see a GYM"
	line "in a cave like"
	cont "this?"

	para "I'd love to ex-"
	line "plore it."
	done

SuperNerdCaryBeatenText:
	text "How do I feel"
	line "about losing?"

	para "It hurts!"
	done

SuperNerdCaryAfterBattleText:
	text "Bitterness leads"
	line "to improvement"
	cont "tomorrow."
	done

ScientistLindenSeenText:
	text "BLAINE may have"
	line "lost his GYM,"

	para "but he never gives"
	line "up."

	para "His perseverance"
	line "is what motivates"
	cont "me!"
	done

ScientistLindenBeatenText:
	text "Argh…"

	para "I can't do any"
	line "more…"
	done

ScientistLindenAfterBattleText:
	text "Together with"
	line "BLAINE,"

	para "we will rebuild"
	line "our GYM!"
	done

SuperNerdWaldoSeenText:
	text "I am in the middle"
	line "of collecting"
	cont "battle records."

	para "Can you help me?"
	done

SuperNerdWaldoBeatenText:
	text "I'm not done"
	line "measuring data!"
	done

SuperNerdWaldoAfterBattleText:
	text "I didn't expect"
	line "you to be so good!"

	para "Who in the world"
	line "are you?"
	done

SuperNerdMerleSeenText:
	text "Ooh!"
	line "You look easily"
	cont "defeated!"
	done

SuperNerdMerleBeatenText:
	text "I-I didn't win."
	done

SuperNerdMerleAfterBattleText:
	text "Pardon me!"
	line "I failed to sense"

	para "how strong"
	line "you are."
	done

BlaineRematchIntroText:
	text "BLAINE: Back for"
	line "a rematch?"

	para "Great stuff kiddo!"

	para "Let's have another"
	line "scorching battle!"
	done 
	
BlaineRematchWinLossText:
	text "I lost the battle,"
	line "but my fiery soul"

	para "hasn't fizzled"
	line "out!"
	done 

BlaineRematchAfterBattleText:
	text "BLAINE: Waaah!"

	para "If I had known you"
	line "were coming, I"
	
	para "would have made"
	line "us some CINNABAR"
	cont "VOLCANO BURGERS!"
	done

SeafoamGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 19, SEAFOAM_ISLANDS, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12,  8, SPRITE_BLAINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SeafoamGymBlaineScript, -1
	object_event 14, 17, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SeafoamGymGuideScript, -1
	object_event 12, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, TrainerScientistLowell, EVENT_SCIENTIST_LOWELL
	object_event 12, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, TrainerScientistLowell, EVENT_SCIENTIST_LOWELL_DEFEATED
	object_event  7, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, TrainerScientistDannie, EVENT_SCIENTIST_DANNIE
	object_event  6, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 2, TrainerScientistDannie, EVENT_SCIENTIST_DANNIE_DEFEATED
	object_event 18, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, TrainerSuperNerdCary, EVENT_SUPER_NERD_CARY
	object_event 19, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 2, TrainerSuperNerdCary, EVENT_SUPER_NERD_CARY_DEFEATED
	object_event 17,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 3, TrainerScientistLinden, EVENT_SCIENTIST_LINDEN
	object_event 16,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 3, TrainerScientistLinden, EVENT_SCIENTIST_LINDEN_DEFEATED
	object_event 12,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, TrainerSuperNerdWaldo, EVENT_SUPER_NERD_WALDO
	object_event 12,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, TrainerSuperNerdWaldo, EVENT_SUPER_NERD_WALDO_DEFEATED
	object_event  7,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 3, TrainerSuperNerdMerle, EVENT_SUPER_NERD_MERLE
	object_event  7,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 3, TrainerSuperNerdMerle, EVENT_SUPER_NERD_MERLE_DEFEATED
