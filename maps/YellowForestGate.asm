	const_def 2 ; object constants
	const YELLOWFORESTGATE_OFFICER

YellowForestGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

YellowForestGateOfficerScript:
	jumptextfaceplayer YellowForestGateOfficerText

YellowForestGateOfficerText:
	text "There are rare"
	line "#MON in"
	cont "YELLOW FOREST!"

	para "Don't forget to"
	line "bring # BALLS!"
	done

YellowForestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, YELLOW_FOREST, 1
	warp_event  5,  0, YELLOW_FOREST, 2
	warp_event  4,  7, ROUTE_48, 1
	warp_event  5,  7, ROUTE_48, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, YellowForestGateOfficerScript, -1
