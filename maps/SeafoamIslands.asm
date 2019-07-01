	const_def 2 ; object constants

SeafoamIslands_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamIslands_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 19, 21, ROUTE_20, 1
	warp_event 19, 19, SEAFOAM_GYM, 1
	warp_event  5,  7, ROUTE_20, 2
	warp_event  5,  3, SEAFOAM_ISLANDS_B1F, 1
	warp_event 15, 17, SEAFOAM_ISLANDS_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
