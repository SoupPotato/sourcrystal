	const_def 2 ; object constants

SafariZoneArea3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneArea3_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 29, SAFARI_ZONE_AREA_2, 3
	warp_event  9, 29, SAFARI_ZONE_AREA_2, 4
	warp_event 26, 29, SAFARI_ZONE_AREA_1, 5
	warp_event 27, 29, SAFARI_ZONE_AREA_1, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
