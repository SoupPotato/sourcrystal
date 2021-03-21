	const_def 2 ; object constants
	const MOUNTMOONPOKECENTER1F_NURSE
	const MOUNTMOONPOKECENTER1F_HIKER
	const MOUNTMOONPOKECENTER1F_LASS

MountMoonPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MountMoonPokecenter1FNurseScript:
	jumpstd pokecenternurse

MountMoonPokecenter1FHikerScript:
	jumptextfaceplayer MountMoonPokecenter1FHikerText

MountMoonPokecenter1FLassScript:
	jumptextfaceplayer MountMoonPokecenter1FLassText

MountMoonPokecenter1FHikerText:
	text "Oh my!"
	line "I remember there"

	para "was nothing built"
	line "here when I "
	cont "climbed the"
	cont "mountain."

	para "Things change, and"
	line "it's getting more"
	cont "and more con-"
	cont "venient."
	done

MountMoonPokecenter1FLassText:
	text "Many Trainers are"
	line "visiting the"
	cont "mountain."

	para "You never know"
	line "what wild #MON"
	cont "you'll encounter."

	para "It is very im-"
	line "portant to recover"
	cont "your #MON at"
	cont "a place like this."

	para "Don't forget to"
	line "make a record of"
	cont "your progress,"
	cont "either!"
	done

MountMoonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ROUTE_3, 2
	warp_event  4,  7, ROUTE_3, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMoonPokecenter1FNurseScript, -1
	object_event  2,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MountMoonPokecenter1FHikerScript, -1
	object_event  7,  4, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MountMoonPokecenter1FLassScript, -1