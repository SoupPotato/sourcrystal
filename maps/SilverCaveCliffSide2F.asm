	object_const_def
	const SILVERCAVECLIFFSIDE2F_POKE_BALL1
	const SILVERCAVECLIFFSIDE2F_POKE_BALL2

SilverCaveCliffSide2F_MapScripts:
	def_scene_scripts

	def_callbacks

SilverCaveCliffSide2FHyperPotion:
	itemball HYPER_POTION

SilverCaveCliffSide2FRareCandy:
	itemball RARE_CANDY


SilverCaveCliffSide2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, SILVER_CAVE_ROOM_2, 2
	warp_event  9, 17, SILVER_CAVE_ROOM_3, 1

	def_coord_events

	def_bg_events


	def_object_events
	object_event 22, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveCliffSide2FHyperPotion, EVENT_SILVER_CAVE_CLIFF_SIDE_2F_HYPER_POTION
	object_event  5, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveCliffSide2FRareCandy, EVENT_SILVER_CAVE_CLIFF_SIDE_2F_RARE_CANDY
