	const_def 2 ; object constants
	const DIGLETTSCAVE_POKEFAN_M

DiglettsCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DiglettsCavePokefanMScript:
	jumptextfaceplayer DiglettsCavePokefanMText

DiglettsCaveHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE

DiglettsCavePokefanMText:
	text "A bunch of DIGLETT"
	line "popped out of the"

	para "ground! That was"
	line "shocking."
	done

DiglettsCave_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 19,  5, ROUTE_11, 1
	warp_event 21,  3, DIGLETTS_CAVE, 5
	warp_event 33,  5, ROUTE_2_NORTH, 4
	warp_event 35,  3, DIGLETTS_CAVE, 6
	warp_event 35, 29, DIGLETTS_CAVE, 2
	warp_event  3,  3, DIGLETTS_CAVE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 13, BGEVENT_ITEM, DiglettsCaveHiddenMaxRevive

	db 1 ; object events
	object_event 19,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DiglettsCavePokefanMScript, -1
