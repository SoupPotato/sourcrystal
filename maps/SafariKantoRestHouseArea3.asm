	object_const_def
	const SAFARI_ZONE_KANTO_REST_HOUSE_AREA_3_GENTLEMAN
	const SAFARI_ZONE_KANTO_REST_HOUSE_AREA_3_SCIENTIST
	const SAFARI_ZONE_KANTO_REST_HOUSE_AREA_3_OFFICER

SafariKantoRestHouseArea3_MapScripts:
	def_scene_scripts

	def_callbacks

SafariKantoRestHouseArea3GentlemanScript:
	faceplayer
	opentext
	writetext SafariKantoRestHouseArea3GentlemanScript_Text
	waitbutton
	closetext
	end

SafariKantoRestHouseArea3ScientistScript:
	faceplayer
	opentext
	writetext SafariKantoRestHouseArea3ScientistScript_Text
	waitbutton
	closetext
	end

SafariKantoRestHouseArea3OfficerScript:
	faceplayer
	opentext
	writetext SafariKantoRestHouseArea3OfficerScript_Text
	waitbutton
	closetext
	end

SafariKantoRestHouseArea3GentlemanScript_Text:
	text "My EEVEE evolved"
	line "into FLAREON!"

	para "But, a friend's"
	line "EEVEE turned into"
	cont "a VAPOREON!"
	cont "I wonder why?"
	done

SafariKantoRestHouseArea3ScientistScript_Text:
	text "You can keep any"
	line "item you find on"
	cont "the ground here."

	para "But, you will run"
	line "out of time if"
	cont "you try for all"
	cont "of them at once!"
	done

SafariKantoRestHouseArea3OfficerScript_Text:
	text "Go to the deepest"
	line "part of the"
	cont "SAFARI ZONE. You"
	cont "will win a prize!"
	done

SafariKantoRestHouseArea3Bookshelf:
	jumpstd DifficultBookshelfScript

SafariKantoRestHouseArea3_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SAFARI_ZONE_KANTO_AREA_3, 9
	warp_event  3,  7, SAFARI_ZONE_KANTO_AREA_3, 9

	def_coord_events

	def_bg_events
	bg_event  4,  1, BGEVENT_READ, SafariKantoRestHouseArea3Bookshelf
	bg_event  5,  1, BGEVENT_READ, SafariKantoRestHouseArea3Bookshelf
	bg_event  6,  1, BGEVENT_READ, SafariKantoRestHouseArea3Bookshelf
	bg_event  7,  1, BGEVENT_READ, SafariKantoRestHouseArea3Bookshelf

	def_object_events
	object_event  1,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0,  SafariKantoRestHouseArea3GentlemanScript, 0
	object_event  3,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariKantoRestHouseArea3ScientistScript, 0
	object_event  5,  5, SPRITE_OFFICER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariKantoRestHouseArea3OfficerScript, 0
