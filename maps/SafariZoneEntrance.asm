	const_def 2 ; object constants
	const SAFARIZONEENTRANCE_OFFICER

SafariZoneEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SafariZoneEntranceOfficerScript:
	jumptextfaceplayer SafariZoneEntranceOfficerText

SafariZoneEntranceOfficerText:
	text "There are rare"
	line "#MON in"
	cont "YELLOW FOREST!"

	para "Don't forget to"
	line "bring # BALLS!"
	done

SafariZoneEntrance_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, SAFARI_ZONE_AREA_1, 1
	warp_event  5,  0, SAFARI_ZONE_AREA_1, 2
	warp_event  4,  7, SAFARI_ZONE_GATE, 1
	warp_event  5,  7, SAFARI_ZONE_GATE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, SafariZoneEntranceOfficerScript, -1
