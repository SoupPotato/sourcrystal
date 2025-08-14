	object_const_def
	const ROUTE16_POKEBALL

Route16_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route16AlwaysOnBikeCallback

Route16AlwaysOnBikeCallback:
	readvar VAR_YCOORD
	ifless 12, .CanWalk
	readvar VAR_XCOORD
	ifgreater 17, .CanWalk
	setflag ENGINE_ALWAYS_ON_BIKE
	endcallback

.CanWalk:
	clearflag ENGINE_ALWAYS_ON_BIKE
	endcallback

CyclingRoadSign:
	jumptext CyclingRoadSignText

Route16OpalShard:
	itemball OPAL_SHARD

CyclingRoadSignText:
	text "CYCLING ROAD"

	para "DOWNHILL COASTING"
	line "ALL THE WAY!"
	done

Route16_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  7, ROUTE_16_FUCHSIA_SPEECH_HOUSE, 1
	warp_event 22, 12, ROUTE_16_GATE, 3
	warp_event 22, 13, ROUTE_16_GATE, 4
	warp_event 17, 12, ROUTE_16_GATE, 1
	warp_event 17, 13, ROUTE_16_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 13, 11, BGEVENT_READ, CyclingRoadSign

	def_object_events
	object_event 33,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route16OpalShard, EVENT_ROUTE_16_OPAL_SHARD
