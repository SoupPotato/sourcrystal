	const_def 2 ; object constants
	const YELLOWFORESTACTUALGATE_OFFICER

YellowForestActualGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

YellowForestActualGateOfficerScript:
	jumptextfaceplayer YellowForestActualGateOfficerText

YellowForestActualGateOfficerText:
	text "There are rare"
	line "#MON in"
	cont "YELLOW FOREST!"

	para "Don't forget to"
	line "bring # BALLS!"
	done

YellowForestActualGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, YELLOW_FOREST, 1
	warp_event  5,  0, YELLOW_FOREST, 2
	warp_event  4,  7, YELLOW_FOREST_GATE, 1
	warp_event  5,  7, YELLOW_FOREST_GATE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, YellowForestActualGateOfficerScript, -1
