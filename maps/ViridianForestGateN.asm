	const_def 2 ; object constants
	const VIRIDIANFORESTGATEN_OFFICER

ViridianForestGateN_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianForestGateNOfficerScript:
	jumptextfaceplayer ViridianForestGateNOfficerText

ViridianForestGateNOfficerText:
	text "VIRIDIAN FOREST"
	line "not only has trees"
	cont "standing like"
	cont "a maze"

	para "but also has many"
	line "ups and downs."

	para "That's why people"
	line "get lost easily"
	cont "here."
	done

ViridianForestGateN_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_2_NORTH, 5
	warp_event  5,  0, ROUTE_2_NORTH, 6
	warp_event  4,  7, VIRIDIAN_FOREST, 1
	warp_event  5,  7, VIRIDIAN_FOREST, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ViridianForestGateNOfficerScript, -1
