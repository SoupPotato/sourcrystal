	const_def 2 ; object constants
	const VIRIDIANFORESTGATES_OFFICER

ViridianForestGateS_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

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

	db 4 ; warp events
	warp_event  4,  0, VIRIDIAN_FOREST, 2
	warp_event  5,  0, VIRIDIAN_FOREST, 3
	warp_event  4,  7, ROUTE_2_SOUTH, 2
	warp_event  5,  7, ROUTE_2_SOUTH, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ViridianForestGateSOfficerScript, -1
