	object_const_def
	const VIRIDIANFORESTGATES_OFFICER

ViridianForestGateS_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestGateSOfficerScript:
	jumptextfaceplayer ViridianForestGateSOfficerText

ViridianForestGateSOfficerText:
	text "VIRIDIAN FOREST"
	line "is like a maze"
	cont "inside."

	para "Be careful. Don't"
	line "get lost in there."
	done

ViridianForestGateS_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, VIRIDIAN_FOREST, 2
	warp_event  5,  0, VIRIDIAN_FOREST, 3
	warp_event  4,  7, ROUTE_2_SOUTH, 2
	warp_event  5,  7, ROUTE_2_SOUTH, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ViridianForestGateSOfficerScript, -1
