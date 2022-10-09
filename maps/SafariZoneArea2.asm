	const_def 2 ; object constants

SafariZoneArea2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneArea2_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 37, 27, SAFARI_ZONE_AREA_1, 3
	warp_event 37, 26, SAFARI_ZONE_AREA_1, 4
	warp_event 28,  8, SAFARI_ZONE_AREA_3, 1
	warp_event 29,  8, SAFARI_ZONE_AREA_3, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
