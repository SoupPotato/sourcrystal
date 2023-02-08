; Pokémon swarms in grass

SwarmGrassWildMons:

; Dunsparce swarm
	map_id DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 3, GEODUDE
	db 3, DUNSPARCE
	db 2, ZUBAT
	db 2, GEODUDE
	db 2, DUNSPARCE
	db 4, DUNSPARCE
	db 4, DUNSPARCE
	; day
	db 3, GEODUDE
	db 3, DUNSPARCE
	db 2, ZUBAT
	db 2, GEODUDE
	db 2, DUNSPARCE
	db 4, DUNSPARCE
	db 4, DUNSPARCE
	; nite
	db 3, GEODUDE
	db 3, DUNSPARCE
	db 2, ZUBAT
	db 2, GEODUDE
	db 2, DUNSPARCE
	db 4, DUNSPARCE
	db 4, DUNSPARCE

; Yanma swarm
	map_id ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 12, SNUBBULL
	db 14, PIDGEY
	db 12, YANMA
	db 14, YANMA
	db 12, JIGGLYPUFF
	db 10, DITTO
	db 10, DITTO
	; day
	db 12, SNUBBULL
	db 14, PIDGEY
	db 12, YANMA
	db 14, YANMA
	db 12, JIGGLYPUFF
	db 10, DITTO
	db 10, DITTO
	; nite
	db 12, DROWZEE
	db 14, HOOTHOOT
	db 12, YANMA
	db 14, YANMA
	db 12, JIGGLYPUFF
	db 10, DITTO
	db 10, DITTO

; Marill swarm
	map_id MOUNT_MORTAR_1F_OUTSIDE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 13, MARILL
	db 13, ZUBAT
	db 15, MARILL
	db 13, MACHOP
	db 14, GEODUDE
	db 16, RATTATA
	db 16, RATICATE
	; day
	db 13, MARILL
	db 13, ZUBAT
	db 13, MARILL
	db 13, MACHOP
	db 14, GEODUDE
	db 16, RATTATA
	db 16, RATICATE
	; nite
	db 13, MARILL
	db 13, ZUBAT
	db 15, MARILL
	db 13, GOLBAT
	db 14, GEODUDE
	db 16, RATTATA
	db 16, RATICATE

; Magnemite swarm
	map_id ROUTE_38
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 14, MAGNEMITE
	db 16, RATICATE
	db 16, MAGNEMITE
	db 16, PIDGEOTTO
	db 13, TAUROS
	db 13, MILTANK
	db 13, MILTANK
	; day
	db 14, MAGNEMITE
	db 16, RATICATE
	db 16, MAGNEMITE
	db 16, PIDGEOTTO
	db 13, TAUROS
	db 13, MILTANK
	db 13, MILTANK
	; nite
	db 14, MAGNEMITE
	db 16, RATICATE
	db 16, MAGNEMITE
	db 16, NOCTOWL
	db 16, MEOWTH
	db 16, MEOWTH
	db 16, MEOWTH

	db -1 ; end
