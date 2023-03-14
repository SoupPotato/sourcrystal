	const_def 2 ; object constants
	const PEWTER_MUSEUM_2F_SCIENTIST

PewterMuseum2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterMuseum2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  7, PEWTER_MUSEUM_1F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  7,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  1,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  5,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 11,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 12,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 10,  5, SPRITE_PIKACHU, SPRITEMOVEDATA_POKEMON, 2, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
