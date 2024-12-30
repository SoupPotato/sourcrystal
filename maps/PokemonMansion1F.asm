	object_const_def
	const POKEMON_MANSION_1F_POKE_BALL1
	const POKEMON_MANSION_1F_POKE_BALL2

PokemonMansion1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_STONETABLE, .specialwarp
	
.specialwarp:
	loadmem wDigWarpNumber, 3
	endcallback

WhirlWarp:
	playsound SFX_BUBBLEBEAM
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	turnobject PLAYER, LEFT
	pause 3
	turnobject PLAYER, UP
	pause 3
	turnobject PLAYER, RIGHT
	pause 3
	turnobject PLAYER, DOWN
	pause 3
	special FadeOutToWhite
	warpfacing DOWN, CINNABAR_ISLAND, 5, 3
	end

PokemonMansion1FCalcium:
	itemball CALCIUM

PokemonMansion1FUltraBall:
	itemball ULTRA_BALL

PokemonMansion1FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_POKEMON_MANSION_1F_HIDDEN_MAX_ELIXER

PokemonMansion1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26,  2, CINNABAR_ISLAND, 2
	warp_event 21, 23, POKEMON_MANSION_B1F, 1

	def_coord_events
	coord_event  1, 22, 0, WhirlWarp

	def_bg_events
	bg_event 19, 18, BGEVENT_ITEM, PokemonMansion1FHiddenMaxElixer

	def_object_events
	object_event 18,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion1FCalcium, EVENT_POKEMON_MANSION_1F_CALCIUM
	object_event  6,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion1FUltraBall, EVENT_POKEMON_MANSION_1F_ULTRA_BALL
