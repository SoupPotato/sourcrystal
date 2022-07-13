	const_def 2 ; object constants


Route10North_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	jumpstd pokecentersign

PowerPlantSignText:
	text "KANTO POWER PLANT"
	done

Route10North_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11, 21, ROUTE_10_POKECENTER_1F, 1
	warp_event  8, 19, ROCK_TUNNEL_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 21, BGEVENT_READ, Route10PokecenterSign

	db 0 ; object events
