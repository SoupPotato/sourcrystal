	object_const_def
	const CERULEAN_CAVE_2F_POKE_BALL1
	const CERULEAN_CAVE_2F_POKE_BALL2
	const CERULEAN_CAVE_2F_POKE_BALL3
	const CERULEAN_CAVE_2F_POKE_BALL4
	const CERULEAN_CAVE_2F_ROCK1
	const CERULEAN_CAVE_2F_ROCK2
	const CERULEAN_CAVE_2F_ROCK3
	const CERULEAN_CAVE_2F_ROCK4
	const CERULEAN_CAVE_2F_ROCK5

CeruleanCave2F_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanCave2FHiddenPPUP:
	hiddenitem PP_UP, EVENT_CERULEAN_CAVE_2F_HIDDEN_PP_UP

CeruleanCave2FHiddenCalcium:
	hiddenitem CALCIUM, EVENT_CERULEAN_CAVE_2F_HIDDEN_CALCIUM

CeruleanCave2FHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_CERULEAN_CAVE_2F_HIDDEN_FULL_HEAL

CeruleanCave2FHiddenBigPearl:
	hiddenitem BIG_PEARL, EVENT_CERULEAN_CAVE_2F_HIDDEN_BIG_PEARL

CeruleanCave2FThunderstone:
	itemball THUNDERSTONE

CeruleanCave2FPPUP:
	itemball PP_UP

CeruleanCave2FUltraBall:
	itemball ULTRA_BALL

CeruleanCave2FCarbos:
	itemball CARBOS

CeruleanCave2FRock:
	jumpstd SmashRockScript

CeruleanCave2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26, 15, CERULEAN_CAVE_1F, 2
	warp_event 24,  9, CERULEAN_CAVE_1F, 3
	warp_event 18,  2, CERULEAN_CAVE_1F, 4
	warp_event 19, 17, CERULEAN_CAVE_1F, 5
	warp_event  3, 15, CERULEAN_CAVE_1F, 6
	warp_event  7,  9, CERULEAN_CAVE_1F, 7
	warp_event  9,  5, CERULEAN_CAVE_1F, 8
	warp_event  5,  7, CERULEAN_CAVE_1F, 9
	warp_event 34,  7, CERULEAN_CAVE_1F, 10

	def_coord_events

	def_bg_events
	bg_event  4, 21, BGEVENT_ITEM, CeruleanCave2FHiddenPPUP
	bg_event 30, 16, BGEVENT_ITEM, CeruleanCave2FHiddenCalcium
	bg_event 28, 22, BGEVENT_ITEM, CeruleanCave2FHiddenFullHeal
	bg_event 33, 20, BGEVENT_ITEM, CeruleanCave2FHiddenBigPearl

	def_object_events
	object_event 34, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FThunderstone, EVENT_CERULEAN_CAVE_2F_THUNDERSTONE
	object_event  6, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FPPUP, EVENT_CERULEAN_CAVE_2F_PP_UP
	object_event  3, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FUltraBall, EVENT_CERULEAN_CAVE_2F_ULTRA_BALL
	object_event 22, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave2FCarbos, EVENT_CERULEAN_CAVE_2F_CARBOS
	object_event 17, 20, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event 18, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event 10, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event 12,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event 10, 21, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
	object_event 32,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCave2FRock, -1
