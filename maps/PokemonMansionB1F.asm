	const_def 2 ; object constants

PokemonMansionB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	
PokemonMansionB1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 23, 22, POKEMON_MANSION_1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
