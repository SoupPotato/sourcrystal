	object_const_def
	const SILVER_CAVE_LOWER_MOUNTAINSIDE_POKE_BALL1
	const SILVER_CAVE_LOWER_MOUNTAINSIDE_POKE_BALL2

SilverCaveLowerMountainSide_MapScripts:
	def_scene_scripts

	def_callbacks

SilverCaveLowerMountainSideGuardSpec:
	itemball GUARD_SPEC

SilverCaveLowerMountainSideCarbos:
	itemball CARBOS


SilverCaveLowerMountainSide_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 23, 21, SILVER_CAVE_ROOM_1, 2
	warp_event  5,  5, SILVER_CAVE_ROOM_2, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 18, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveLowerMountainSideGuardSpec, EVENT_SILVER_CAVE_LOWER_MOUNTAINSIDE_GUARD_SPEC
	object_event 15, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveLowerMountainSideCarbos, EVENT_SILVER_CAVE_LOWER_MOUNTAINSIDE_CARBOS
