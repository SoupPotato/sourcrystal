	object_const_def
	const SAFARI_ZONE_KANTO_REST_HOUSE_AREA_2_SCIENTIST
	const SAFARI_ZONE_KANTO_REST_HOUSE_AREA_2_ROCKER
	const SAFARI_ZONE_KANTO_REST_HOUSE_AREA_2_COOLTRAINERM

SafariKantoRestHouseArea2_MapScripts:
	def_scene_scripts

	def_callbacks

SafariKantoRestHouseArea2ScientistScript:
	faceplayer
	opentext
	writetext SafariKantoRestHouseArea2ScientistScript_Text
	waitbutton
	closetext
	end

SafariKantoRestHouseArea2RockerScript:
	faceplayer
	opentext
	writetext SafariKantoRestHouseArea2RockerScript_Text
	waitbutton
	closetext
	turnobject SAFARI_ZONE_KANTO_REST_HOUSE_AREA_2_ROCKER, UP
	end

SafariKantoRestHouseArea2CooltrainerMScript:
	faceplayer
	opentext
	writetext SafariKantoRestHouseArea2CooltrainerMScript_Text
	waitbutton
	closetext
	end

SafariKantoRestHouseArea2ScientistScript_Text:
	text "How many did you"
	line "catch? I'm bushed"
	cont "from the work!"
	done

SafariKantoRestHouseArea2RockerScript_Text:
	text "I caught a"
	line "CHANSEY!"

	para "That makes this"
	line "all worthwhile!"
	done

SafariKantoRestHouseArea2CooltrainerMScript_Text:
	text "Whew! I'm tired"
	line "from all the fun!"
	done

SafariKantoRestHouseArea2Bookshelf:
	jumpstd DifficultBookshelfScript

SafariKantoRestHouseArea2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_KANTO_AREA_2, 5
	warp_event  3,  7, SAFARI_ZONE_KANTO_AREA_2, 5

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, SafariKantoRestHouseArea2Bookshelf
	bg_event  5,  1, BGEVENT_READ, SafariKantoRestHouseArea2Bookshelf
	bg_event  6,  1, BGEVENT_READ, SafariKantoRestHouseArea2Bookshelf
	bg_event  7,  1, BGEVENT_READ, SafariKantoRestHouseArea2Bookshelf

	def_object_events
	object_event  1,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariKantoRestHouseArea2ScientistScript, 0
	object_event  5,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariKantoRestHouseArea2RockerScript, 0
	object_event  3,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariKantoRestHouseArea2CooltrainerMScript, 0