	const_def 2 ; object constants

SafariRestHouseArea3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariRestHouseArea3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFARI_ZONE_AREA_3, 7
	warp_event  3,  7, SAFARI_ZONE_AREA_3, 7

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
