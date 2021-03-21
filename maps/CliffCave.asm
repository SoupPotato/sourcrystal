	const_def 2 ; object constants

CliffCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CliffCaveHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_CLIFF_CAVE_HIDDEN_ULTRA_BALL

CliffCave_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  9,  9, ROUTE_47, 2
	warp_event  7, 21, ROUTE_47, 3
	warp_event  7, 37, ROUTE_47, 4
	warp_event  5,  3, CLIFF_CAVE, 5
	warp_event  5, 19, CLIFF_CAVE, 4
	warp_event  9, 19, CLIFF_CAVE, 7
	warp_event  9, 31, CLIFF_CAVE, 6

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11,  9, BGEVENT_ITEM, CliffCaveHiddenUltraBall

	db 1 ; object events
	object_event 7, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, CliffCaveManScript, -1

CliffCaveManScript:
	jumptextfaceplayer CliffCaveManText


CliffCaveManText:
	text "If you see a fork"
	line "in the road"
	cont "inside a cave,"

	para "most likely one"
	line "way is right and"
	cont "the other leads"
	cont "to a dead end."

	para "But people can't"
	line "help trying both."

	para "Do you want to"
	line "go up the ladder"
	cont "or go down the"
	cont "ladder?"
	done
