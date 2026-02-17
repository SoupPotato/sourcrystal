	object_const_def
	const SAFARI_ZONE_KANTO_REST_HOUSE_AREA_1_BEAUTY
	const SAFARI_ZONE_KANTO_REST_HOUSE_AREA_1_SCIENTIST

SafariKantoRestHouseArea1_MapScripts:
	def_scene_scripts

	def_callbacks

SafariKantoRestHouseArea1BeautyScript:
	faceplayer
	opentext
	writetext SafariKantoRestHouseArea1BeautyScript_Text
	waitbutton
	closetext
	turnobject SAFARI_ZONE_KANTO_REST_HOUSE_AREA_1_BEAUTY, DOWN
	end

SafariKantoRestHouseArea1ScientistScript:
	faceplayer
	opentext
	writetext SafariKantoRestHouseArea1ScientistScript_Text
	waitbutton
	closetext
	end

SafariKantoRestHouseArea1BeautyScript_Text:
	text "SARA: Where did"
	line "my boy friend,"
	cont "ERIK go?"
	done

SafariKantoRestHouseArea1ScientistScript_Text:
	text "I'm catching"
	line "#MON to take"
	cont "home as gifts!"
	done

SafariKantoRestHouseArea1Bookshelf:
	jumpstd DifficultBookshelfScript

SafariKantoRestHouseArea1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_KANTO_AREA_1, 9
	warp_event  3,  7, SAFARI_ZONE_KANTO_AREA_1, 9

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, SafariKantoRestHouseArea1Bookshelf
	bg_event  5,  1, BGEVENT_READ, SafariKantoRestHouseArea1Bookshelf
	bg_event  6,  1, BGEVENT_READ, SafariKantoRestHouseArea1Bookshelf
	bg_event  7,  1, BGEVENT_READ, SafariKantoRestHouseArea1Bookshelf

	def_object_events
	object_event  5,  2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariKantoRestHouseArea1BeautyScript, 0
	object_event  2,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariKantoRestHouseArea1ScientistScript, 0
