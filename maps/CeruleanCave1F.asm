	object_const_def
	const CERULEAN_CAVE_1F_POKE_BALL1
	const CERULEAN_CAVE_1F_POKE_BALL2
	const CERULEAN_CAVE_1F_POKE_BALL3
	const CERULEAN_CAVE_1F_ROCK1
	const CERULEAN_CAVE_1F_ROCK2
	const CERULEAN_CAVE_1F_ROCK3
	const CERULEAN_CAVE_1F_ROCK4
	const CERULEAN_CAVE_1F_ROCK5
	const CERULEAN_CAVE_1F_ROCK6

CeruleanCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave1FHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_CERULEAN_CAVE_1F_HIDDEN_HYPER_POTION

CeruleanCave1FHiddenRevive:
	hiddenitem REVIVE, EVENT_CERULEAN_CAVE_1F_HIDDEN_REVIVE

CeruleanCave1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CERULEAN_CAVE_1F_HIDDEN_RARE_CANDY

CeruleanCave1FNugget:
	itemball NUGGET

CeruleanCave1FFullRestore:
	itemball FULL_RESTORE

CeruleanCave1FMaxElixer:
	itemball MAX_ELIXER

CeruleanCave1FRock:
	jumpstd SmashRockScript

CeruleanCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 31, 25, CERULEAN_CITY, 7
	warp_event 26, 15, CERULEAN_CAVE_2F, 1
	warp_event 24,  9, CERULEAN_CAVE_2F, 2
	warp_event 18,  2, CERULEAN_CAVE_2F, 3
	warp_event 19, 17, CERULEAN_CAVE_2F, 4
	warp_event  3, 15, CERULEAN_CAVE_2F, 5
	warp_event  7,  9, CERULEAN_CAVE_2F, 6
	warp_event  9,  5, CERULEAN_CAVE_2F, 7
	warp_event  5,  7, CERULEAN_CAVE_2F, 8
	warp_event 34,  7, CERULEAN_CAVE_2F, 9
	warp_event  3, 11, CERULEAN_CAVE_B1F, 1
	warp_event 34, 13, CERULEAN_CAVE_B1F, 2

	def_coord_events

	def_bg_events
	bg_event  2, 23, BGEVENT_ITEM, CeruleanCave1FHiddenHyperPotion
	bg_event 15, 18, BGEVENT_ITEM, CeruleanCave1FHiddenRevive
	bg_event 35, 21, BGEVENT_ITEM, CeruleanCave1FHiddenRareCandy

	def_object_events
	object_event 16,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FNugget, EVENT_CERULEAN_CAVE_1F_NUGGET
	object_event 12, 25, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FFullRestore, EVENT_CERULEAN_CAVE_1F_FULL_RESTORE
	object_event 23, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FMaxElixer, EVENT_CERULEAN_CAVE_1F_MAX_ELIXER
	object_event  5, 23, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave1FRock, -1
	object_event  7, 24, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave1FRock, -1
	object_event  4, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave1FRock, -1
	object_event  2, 24, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave1FRock, -1
	object_event  3, 23, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave1FRock, -1
	object_event  2, 22, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave1FRock, -1
