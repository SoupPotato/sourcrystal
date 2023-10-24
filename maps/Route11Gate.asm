	object_const_def
	const ROUTE_11GATE_OFFICER

Route11Gate_MapScripts:
	def_scene_scripts

	def_callbacks

Route11GateOfficerScript:
	jumptextfaceplayer Route11GateOfficerText

Route11GateOfficerText:
	text "Hello, passerby!"

	para "Have you seen"
	line "DIGLETTS CAVE?"

	para "You can go"
	line "through it to get"
	cont "to ROUTE 2!"

	para "That is,"
	line "if somthing isn't"

	para "blocking the"
	line "entrance…"

	done

Route11Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_11, 2
	warp_event  0,  5, ROUTE_11, 3
	warp_event  9,  4, ROUTE_12, 2
	warp_event  9,  5, ROUTE_12, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route11GateOfficerScript, -1
