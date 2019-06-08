	const_def 2 ; object constants

Route48_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route48YellowForestSign:
	jumptext Route48YellowForestSignText

Route48Nugget:
	itemball NUGGET

Route48YellowForestSignText:
	text "North to"
	line "YELLOW FOREST"
	done

Route48_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11,  5, YELLOW_FOREST_GATE, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 27, 11, BGEVENT_READ, Route48YellowForestSign

	db 1 ; object events
	object_event  4, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route48Nugget, EVENT_ROUTE_48_NUGGET
