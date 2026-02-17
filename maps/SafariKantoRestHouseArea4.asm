	object_const_def
	const SAFARI_ZONE_KANTO_REST_HOUSE_AREA_4_SCIENTIST
	const SAFARI_ZONE_KANTO_REST_HOUSE_AREA_4_COOLTRAINER_M
	const SAFARI_ZONE_KANTO_REST_HOUSE_AREA_4_TEACHER

SafariKantoRestHouseArea4_MapScripts:
	def_scene_scripts

	def_callbacks

SafariKantoRestHouseArea4ScientistScript:
	faceplayer
	opentext
	writetext SafariKantoRestHouseArea4ScientistScript_Text
	waitbutton
	closetext
	end

SafariKantoRestHouseArea4CooltrainerMScript:
	faceplayer
	opentext
	writetext SafariKantoRestHouseArea4CooltrainerMScript_Text
	waitbutton
	closetext
	end

SafariKantoRestHouseArea4TeacherScript:
	faceplayer
	opentext
	writetext SafariKantoRestHouseArea4TeacherScript_Text
	waitbutton
	closetext
	end

SafariKantoRestHouseArea4ScientistScript_Text:
	text "Tossing ROCKs at"
	line "#MON might"
	cont "make them run,"
	cont "but they'll be"
	cont "easier to catch."
	done

SafariKantoRestHouseArea4TeacherScript_Text:
	text "I hiked a lot, but"
	line "I didn't see any"
	cont "#MON I wanted."
	done

SafariKantoRestHouseArea4CooltrainerMScript_Text:
	text "Using BAIT on"
	line "#MON might"
	cont "stop them running,"
	cont "but they'll be"
	cont "harder to catch."
	done

SafariKantoRestHouseArea4Bookshelf:
	jumpstd DifficultBookshelfScript

SafariKantoRestHouseArea4_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_KANTO_AREA_4, 7
	warp_event  3,  7, SAFARI_ZONE_KANTO_AREA_4, 7

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, SafariKantoRestHouseArea4Bookshelf
	bg_event  5,  1, BGEVENT_READ, SafariKantoRestHouseArea4Bookshelf
	bg_event  6,  1, BGEVENT_READ, SafariKantoRestHouseArea4Bookshelf
	bg_event  7,  1, BGEVENT_READ, SafariKantoRestHouseArea4Bookshelf


	def_object_events
	object_event  2,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SafariKantoRestHouseArea4ScientistScript, 0
	object_event  0,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariKantoRestHouseArea4CooltrainerMScript, 0
	object_event  7,  2, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariKantoRestHouseArea4TeacherScript, 0