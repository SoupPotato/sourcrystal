	const_def 2 ; object constants
	const ROUTE42ECRUTEAKGATE_OFFICER
	const ROUTE42ECRUTEAKGATE_FISHER

Route42EcruteakGate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE_42_ECRUTEAK_GATE_BLOCKED
	scene_script .DummyScene1 ; SCENE_ROUTE_42_ECRUTEAK_GATE_CLEAR

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

Route42EcruteakGateOfficerScript:
	jumptextfaceplayer Route42EcruteakGateOfficerText

Route42EcruteakGateOfficerText:
	text "MT.MORTAR is like"
	line "a maze inside."

	para "Be careful. Don't"
	line "get lost in there."
	done

Route42EcruteakGateFisherStopScript:
	showemote EMOTE_SHOCK, ROUTE42ECRUTEAKGATE_FISHER, 15
	applymovement ROUTE42ECRUTEAKGATE_FISHER, MovementData_FisherStop
	follow PLAYER, ROUTE42ECRUTEAKGATE_FISHER
	applymovement PLAYER, MovementData_PlayerStepLeft
	stopfollow
	turnobject PLAYER, RIGHT
	scall Route42EcruteakGateFisherScript
	applymovement ROUTE42ECRUTEAKGATE_FISHER, MovementData_FisherWalkUp
	end

Route42EcruteakGateFisherScript:
	jumptextfaceplayer Route42EcruteakGateFisherText

Route42EcruteakGateFisherText:
	text "Woah, kid!"

	para "There's been a big"
	line "landslide on"
	cont "Mt.MORTAR!"

	para "We need some time"
	line "to clear the road."
	
	para "Perhaps you should"
	line "head to OLIVINE"
	
	para "for now while we"
	line "finish up here."
	done

MovementData_FisherStop:
	step RIGHT
	step DOWN
	turn_head LEFT
	step_end

MovementData_FisherWalkUp:
	step UP
	turn_head DOWN
	step_end

MovementData_PlayerStepLeft:
	step LEFT
	step_end

Route42EcruteakGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ECRUTEAK_CITY, 1
	warp_event  0,  5, ECRUTEAK_CITY, 2
	warp_event  9,  4, ROUTE_42, 1
	warp_event  9,  5, ROUTE_42, 2

	db 1 ; coord events
	coord_event 6,  5, SCENE_DEFAULT, Route42EcruteakGateFisherStopScript

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route42EcruteakGateOfficerScript, -1
	object_event  6,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route42EcruteakGateFisherScript, EVENT_BEAT_JASMINE
