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

	db 0 ; object events
