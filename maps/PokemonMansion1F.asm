	const_def 2 ; object constants
	const POKEMON_MANSION_1F_POKE_BALL1
	const POKEMON_MANSION_1F_POKE_BALL2

PokemonMansion1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, .specialwarp
	
.specialwarp:
	loadvar wDigWarpNumber, 3
	return

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
	special FadeOutPalettes
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

	db 2 ; warp events
	warp_event 26,  2, CINNABAR_ISLAND, 2
	warp_event 21, 23, POKEMON_MANSION_B1F, 1

	db 1 ; coord events
	coord_event  1, 22, 0, WhirlWarp

	db 1 ; bg events
	bg_event 19, 18, BGEVENT_ITEM, PokemonMansion1FHiddenMaxElixer

	db 2 ; object events
	object_event 18,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion1FCalcium, EVENT_POKEMON_MANSION_1F_CALCIUM
	object_event  6,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PokemonMansion1FUltraBall, EVENT_POKEMON_MANSION_1F_ULTRA_BALL
