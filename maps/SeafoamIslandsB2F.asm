	object_const_def
	const SEAFOAM_ISLANDS_B2F_POKE_BALL
	const SEAFOAM_ISLANDS_B2F_BUENA
	const SEAFOAM_ISLANDS_B2F_ROCKER1
	const SEAFOAM_ISLANDS_B2F_ROCKER2

SeafoamIslandsB2F_MapScripts:
	def_scene_scripts

	def_callbacks

SeafoamIslandsB2FHiddenPearl1:
	hiddenitem PEARL, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_PEARL1

SeafoamIslandsB2FHiddenPearl2:
	hiddenitem PEARL, EVENT_SEAFOAM_ISLANDS_B2F_HIDDEN_PEARL2

SeafoamIslandsB2FWaterStone:
	itemball WATER_STONE

TrainerSkierCady:
	trainer SKIER, CADY, EVENT_BEAT_SKIER_CADY, SkierCadySeenText, SkierCadyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierCadyAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderShaun:
	trainer BOARDER, SHAUN, EVENT_BEAT_BOARDER_SHAUN, BoarderShaunSeenText, BoarderShaunBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderShaunAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBryce:
	trainer BOARDER, BRYCE, EVENT_BEAT_BOARDER_BRYCE, BoarderBryceSeenText, BoarderBryceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBryceAfterBattleText
	waitbutton
	closetext
	end

SkierCadySeenText:
	text "To beat the cold,"
	line "try warm clothes"
	cont "and a hot drink!"
	done

SkierCadyBeatenText:
	text "Argh, all the"
	line "way out here!"
	done

SkierCadyAfterBattleText:
	text "That was a hot"
	line "battle!"
	done

BoarderShaunSeenText:
	text "Hey, hey,"
	line "you're in my way!"
	cont "Right!"
	done

BoarderShaunBeatenText:
	text "I got kicked"
	line "around…"
	done

BoarderShaunAfterBattleText:
	text "All right, please"
	line "pass through!"
	done

BoarderBryceSeenText:
	text "What did you come"
	line "all the way out"
	cont "here for, I won-"
	cont "der."
	done

BoarderBryceBeatenText:
	text "I lost all the"
	line "way out here…"
	done

BoarderBryceAfterBattleText:
	text "Trainers are"
	line "everywhere."
	done

SeafoamIslandsB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 19, SEAFOAM_ISLANDS_B1F, 3
	warp_event  7, 19, SEAFOAM_ISLANDS_B1F, 4
	warp_event 13, 17, SEAFOAM_ISLANDS_B1F, 5
	warp_event 15,  9, SEAFOAM_ISLANDS_B1F, 6
	warp_event 33, 17, SEAFOAM_ISLANDS_B3F, 1
	warp_event  3, 21, SEAFOAM_ISLANDS_B3F, 2
	warp_event 33,  9, SEAFOAM_ISLANDS_B3F, 3
	warp_event 21, 11, SEAFOAM_ISLANDS_B3F, 4

	def_coord_events

	def_bg_events
	bg_event 27, 16, BGEVENT_ITEM, SeafoamIslandsB2FHiddenPearl1
	bg_event 15,  2, BGEVENT_ITEM, SeafoamIslandsB2FHiddenPearl2

	def_object_events
	object_event 14,  6, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierCady, -1
	object_event 18,  7, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderShaun, -1
	object_event 27, 11, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBryce, -1
	object_event 16, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SeafoamIslandsB2FWaterStone, EVENT_SEAFOAM_ISLANDS_B2F_WATER_STONE
