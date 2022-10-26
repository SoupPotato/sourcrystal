	const_def 2 ; object constants
	const CLIFFEDGEGATE_RECEPTIONIST

CliffEdgeGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

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

	db 2 ; warp events
	warp_event 17, 19, CIANWOOD_CITY, 8
	warp_event  3, 19, ROUTE_47, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 17,  6, BGEVENT_ITEM, CliffEdgeGateHiddenBigPearl

	db 1 ; object events
	object_event 11, 16, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, CliffEdgeGateReceptionistScript, -1
