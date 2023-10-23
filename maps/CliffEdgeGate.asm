	object_const_def
	const CLIFFEDGEGATE_RECEPTIONIST

CliffEdgeGate_MapScripts:
	def_scene_scripts

	def_callbacks

CliffEdgeGateReceptionistScript:
	jumptextfaceplayer CliffEdgeGateReceptionistText

CliffEdgeGateHiddenBigPearl:
	hiddenitem BIG_PEARL, EVENT_CLIFF_EDGE_GATE_HIDDEN_BIG_PEARL

CliffEdgeGateReceptionistText:
	text "The SAFARI ZONE"
	line "is this way!"

	para "It's a popular"
	line "attraction for"
	cont "tourists and"
	cont "trainers alike!"
	done

CliffEdgeGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 19, CIANWOOD_CITY, 8
	warp_event  3, 19, ROUTE_47, 1

	def_coord_events

	def_bg_events
	bg_event 17,  6, BGEVENT_ITEM, CliffEdgeGateHiddenBigPearl

	def_object_events
	object_event 11, 16, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, CliffEdgeGateReceptionistScript, -1
