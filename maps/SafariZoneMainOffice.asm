	object_const_def
	const SAFARI_ZONE_MAIN_OFFICE_OFFICER_1
	const SAFARI_ZONE_MAIN_OFFICE_OFFICER_2
	const SAFARI_ZONE_MAIN_OFFICE_CLERK


SafariZoneMainOffice_MapScripts:
	def_scene_scripts

	def_callbacks

SafariZoneMainOfficeWorker1Script:
	faceplayer
	opentext
	writetext SafariZoneMainOfficeWorker1_Text
	waitbutton
	closetext
	end

SafariZoneMainOfficeWorker2Script:
	faceplayer
	opentext
	writetext SafariZoneMainOfficeWorker2_Text
	waitbutton
	closetext
	turnobject SAFARI_ZONE_MAIN_OFFICE_OFFICER_2, UP
	end

SafariZoneMainOfficeClerkScript:
	faceplayer
	opentext
	writetext SafariZoneMainOfficeClerk_Text
	waitbutton
	closetext
	end

SafariZoneMainOfficeWorker1_Text:
	text "SLOWPOKE is very"
	line "knowledgeable"
	cont "about #MON!"

	para "Hm… SLOWPOKE?"

	para "Oh that's the"
	line "nickname we gave"
	cont "the old WARDEN!"

	para "His son runs the"
	line "SAFARI ZONE now!"
	done

SafariZoneMainOfficeWorker2_Text:
	text "This controls the"
	line "SAFARI habitat"
	cont "systems."

	para "Please, do not"
	line "touch."
	done

SafariZoneMainOfficeClerk_Text:
	text "Welcome to the"
	line "main office."

	para "My dad uses to"
	line "run this place,"

	para "but he went off"
	line "to start a new"

	para "SAFARI ZONE in"
	line "JOHTO!"
	done


SafariZoneMainOfficeBookshelf:
	jumpstd DifficultBookshelfScript

SafariZoneMainOffice_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, FUCHSIA_CITY, 2
	warp_event  5,  9, FUCHSIA_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, SafariKantoRestHouseArea3Bookshelf
	bg_event  1,  1, BGEVENT_READ, SafariKantoRestHouseArea3Bookshelf
	bg_event  2,  1, BGEVENT_READ, SafariKantoRestHouseArea3Bookshelf
	bg_event  3,  1, BGEVENT_READ, SafariKantoRestHouseArea3Bookshelf

	def_object_events
	object_event  1,  5, SPRITE_SAFARI_WORKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneMainOfficeWorker1Script, -1
	object_event 10,  5, SPRITE_SAFARI_WORKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneMainOfficeWorker2Script, -1
	object_event  6,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariZoneMainOfficeClerkScript, -1
