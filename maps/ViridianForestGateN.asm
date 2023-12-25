	object_const_def
	const VIRIDIANFORESTGATEN_OFFICER

ViridianForestGateN_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianForestGateNOfficerScript:
	jumptextfaceplayer ViridianForestGateNOfficerText

ViridianForestGateNOfficerText:
	text "VIRIDIAN FOREST"
	line "has many trees"

	para "standing like a"
	line "maze."

	para "That's why people"
	line "get lost here."
	done

ViridianForestGateN_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, ROUTE_2_NORTH, 5
	warp_event  5,  0, ROUTE_2_NORTH, 6
	warp_event  4,  7, VIRIDIAN_FOREST, 1
	warp_event  5,  7, VIRIDIAN_FOREST, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ViridianForestGateNOfficerScript, -1
