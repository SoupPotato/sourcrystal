	object_const_def
	const SILVER_CAVE_UPPER_MOUNTAINSIDE_POKE_BALL1
	const SILVER_CAVE_UPPER_MOUNTAINSIDE_POKE_BALL2

SilverCaveUpperMountainSide_MapScripts:
	def_scene_scripts

	def_callbacks

SilverCaveUpperMountainSideHyperPotion:
	itemball HYPER_POTION

SilverCaveUpperMountainSideRareCandy:
	itemball RARE_CANDY


SilverCaveUpperMountainSide_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, SILVER_CAVE_ROOM_2, 2
	warp_event  9, 17, SILVER_CAVE_ROOM_3, 1

	def_coord_events

	def_bg_events


	def_object_events
	object_event 22, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveUpperMountainSideHyperPotion, EVENT_SILVER_CAVE_UPPER_MOUNTAINSIDE_HYPER_POTION
	object_event  5, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveUpperMountainSideRareCandy, EVENT_SILVER_CAVE_UPPER_MOUNTAINSIDE_RARE_CANDY
