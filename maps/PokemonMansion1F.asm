	const_def 2 ; object constants

PokemonMansion1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

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
	
PokemonMansion1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 26,  2, CINNABAR_ISLAND, 2

	db 1 ; coord events
	coord_event  1, 22, 0, WhirlWarp

	db 0 ; bg events

	db 0 ; object events
