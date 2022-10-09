	const_def 2 ; object constants

SafariZoneArea1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneArea1_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 18, 25, SAFARI_ZONE_ENTRANCE, 1
	warp_event 19, 25, SAFARI_ZONE_ENTRANCE, 2
	warp_event  4, 15, SAFARI_ZONE_AREA_2, 1
	warp_event  4, 14, SAFARI_ZONE_AREA_2, 2
	warp_event 14,  4, SAFARI_ZONE_AREA_3, 3
	warp_event 15,  4, SAFARI_ZONE_AREA_3, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
