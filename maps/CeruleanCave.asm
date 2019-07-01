	const_def 2 ; object constants

CeruleanCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 31, 25, CERULEAN_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
