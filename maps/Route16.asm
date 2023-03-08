Route16_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .AlwaysOnBike

.AlwaysOnBike:
	checkcode VAR_YCOORD
	ifless 10, .CanWalk
	checkcode VAR_XCOORD
	ifgreater 17, .CanWalk
	setflag ENGINE_ALWAYS_ON_BIKE
	return

.CanWalk:
	clearflag ENGINE_ALWAYS_ON_BIKE
	return

CyclingRoadSign:
	jumptext CyclingRoadSignText

CyclingRoadSignText:
	text "CYCLING ROAD"

	para "DOWNHILL COASTING"
	line "ALL THE WAY!"
	done

Route16_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  7,  7, ROUTE_16_FUCHSIA_SPEECH_HOUSE, 1
	warp_event 22, 12, ROUTE_16_GATE, 3
	warp_event 22, 13, ROUTE_16_GATE, 4
	warp_event 17, 12, ROUTE_16_GATE, 1
	warp_event 17, 13, ROUTE_16_GATE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 13, 11, BGEVENT_READ, CyclingRoadSign

	db 0 ; object events
