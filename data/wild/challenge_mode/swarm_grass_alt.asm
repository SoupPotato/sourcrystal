; Pokémon swarms in grass

SwarmGrassWildMonsAltChallenge:

; Slowpoke swarm
	map_id SLOWPOKE_WELL_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 8, SLOWPOKE
	db 9, SLOWPOKE
	db 10, ZUBAT
	db 9, SLOWPOKE
	db 11, ZUBAT
	db 11, SLOWPOKE
	db 11, ZUBAT
	; day
	db 8, SLOWPOKE
	db 9, SLOWPOKE
	db 10, ZUBAT
	db 9, SLOWPOKE
	db 11, ZUBAT
	db 11, SLOWPOKE
	db 11, ZUBAT
	; nite
	db 8, SLOWPOKE
	db 9, SLOWPOKE
	db 10, ZUBAT
	db 9, SLOWPOKE
	db 11, ZUBAT
	db 11, SLOWPOKE
	db 11, ZUBAT

	map_id SLOWPOKE_WELL_B2F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 25, SLOWPOKE
	db 27, SLOWPOKE
	db 23, ZUBAT
	db 25, SLOWPOKE
	db 27, GOLBAT
	db 27, SLOWPOKE
	db 27, GOLBAT
	; day
	db 25, SLOWPOKE
	db 27, SLOWPOKE
	db 23, ZUBAT
	db 25, SLOWPOKE
	db 27, GOLBAT
	db 27, SLOWPOKE
	db 27, GOLBAT
	; nite
	db 25, SLOWPOKE
	db 27, SLOWPOKE
	db 23, ZUBAT
	db 25, SLOWPOKE
	db 27, GOLBAT
	db 27, SLOWPOKE
	db 27, GOLBAT

; Teddiursa swarm
	map_id DARK_CAVE_VIOLET_ENTRANCE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 4, GEODUDE
	db 3, TEDDIURSA
	db 3, ZUBAT
	db 5, GEODUDE
	db 2, TEDDIURSA
	db 5, TEDDIURSA
	db 5, DUNSPARCE
	; day
	db 4, GEODUDE
	db 3, TEDDIURSA
	db 3, ZUBAT
	db 5, GEODUDE
	db 2, TEDDIURSA
	db 5, TEDDIURSA
	db 5, DUNSPARCE
	; nite
	db 4, GEODUDE
	db 3, TEDDIURSA
	db 3, ZUBAT
	db 5, GEODUDE
	db 2, TEDDIURSA
	db 5, TEDDIURSA
	db 5, DUNSPARCE

; Bellsprout swarm
	map_id ROUTE_32
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 6, BELLSPROUT
	db 7, BELLSPROUT
	db 6, MAREEP
	db 6, HOPPIP
	db 5, PIDGEY
	db 6, BELLSPROUT
	db 7, RATTATA
	; day
	db 6, BELLSPROUT
	db 7, BELLSPROUT
	db 6, MAREEP
	db 6, HOPPIP
	db 5, PIDGEY
	db 6, BELLSPROUT
	db 7, RATTATA
	; nite
	db 6, BELLSPROUT
	db 7, WOOPER
	db 6, BELLSPROUT
	db 6, MAREEP
	db 5, HOOTHOOT
	db 6, BELLSPROUT
	db 7, GASTLY

; Psyduck swarm
	map_id ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 15, SNUBBULL
	db 15, PIDGEY
	db 13, PSYDUCK
	db 15, PSYDUCK
	db 15, JIGGLYPUFF
	db 16, DITTO
	db 16, DITTO
	; day
	db 15, SNUBBULL
	db 15, PIDGEY
	db 13, PSYDUCK
	db 15, PSYDUCK
	db 15, JIGGLYPUFF
	db 16, DITTO
	db 16, DITTO
	; nite
	db 15, DROWZEE
	db 15, HOOTHOOT
	db 13, PSYDUCK
	db 15, PSYDUCK
	db 15, JIGGLYPUFF
	db 16, DITTO
	db 16, DITTO

; Machop swarm
	map_id MOUNT_MORTAR_1F_OUTSIDE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 23, MACHOP
	db 25, ZUBAT
	db 24, MARILL
	db 24, MACHOP
	db 24, GEODUDE
	db 25, RATTATA
	db 26, RATICATE
	; day
	db 23, MACHOP
	db 25, ZUBAT
	db 24, MARILL
	db 24, MACHOP
	db 24, GEODUDE
	db 25, RATTATA
	db 26, RATICATE
	; nite
	db 23, MACHOP
	db 25, ZUBAT
	db 24, MARILL
	db 24, MACHOP
	db 24, GOLBAT
	db 25, RATTATA
	db 26, RATICATE

	map_id MOUNT_MORTAR_1F_INSIDE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 24, MACHOP
	db 24, MACHOP
	db 24, MARILL
	db 26, RATICATE
	db 26, ZUBAT
	db 25, GOLBAT
	db 25, GOLBAT
	; day
	db 24, MACHOP
	db 24, MACHOP
	db 24, MARILL
	db 26, RATICATE
	db 26, ZUBAT
	db 25, GOLBAT
	db 25, GOLBAT
	; nite
	db 24, MACHOP
	db 24, MACHOP
	db 24, RATICATE
	db 26, ZUBAT
	db 26, MARILL
	db 25, GOLBAT
	db 25, GOLBAT

	map_id MOUNT_MORTAR_2F_INSIDE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 41, MACHOP
	db 42, MACHOP
	db 41, GRAVELER
	db 40, RATICATE
	db 38, MACHOKE
	db 40, GOLBAT
	db 40, GOLBAT
	; day
	db 41, MACHOP
	db 42, MACHOP
	db 41, GRAVELER
	db 40, RATICATE
	db 38, MACHOKE
	db 40, GOLBAT
	db 40, GOLBAT
	; nite
	db 41, MACHOP
	db 42, MACHOP
	db 41, GRAVELER
	db 40, RATICATE
	db 38, MARILL
	db 40, GOLBAT
	db 40, GOLBAT

	map_id MOUNT_MORTAR_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 24, MACHOP
	db 26, MACHOP
	db 26, GOLBAT
	db 28, MACHOP
	db 27, GEODUDE
	db 28, RATICATE
	db 27, RATICATE
	; day
	db 24, MACHOP
	db 26, MACHOP
	db 26, GOLBAT
	db 28, MACHOP
	db 27, GEODUDE
	db 28, RATICATE
	db 27, RATICATE
	; nite
	db 24, MACHOP
	db 26, MACHOP
	db 26, GOLBAT
	db 28, MARILL
	db 27, GEODUDE
	db 28, RATICATE
	db 27, RATICATE

; Tauros swarm
	map_id ROUTE_38
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 20, TAUROS
	db 21, RATICATE
	db 20, MAGNEMITE
	db 20, PIDGEOTTO
	db 18, TAUROS
	db 18, TAUROS
	db 18, MILTANK
	; day
	db 20, TAUROS
	db 21, RATICATE
	db 20, MAGNEMITE
	db 20, PIDGEOTTO
	db 18, TAUROS
	db 18, TAUROS
	db 18, MILTANK
	; nite
	db 20, TAUROS
	db 21, RATICATE
	db 20, MAGNEMITE
	db 20, NOCTOWL
	db 18, TAUROS
	db 18, TAUROS
	db 18, MEOWTH

; Lickitung swarm
	map_id ROUTE_44
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 34, LICKITUNG
	db 35, LICKITUNG
	db 33, BELLSPROUT
	db 34, WEEPINBELL
	db 35, LICKITUNG
	db 37, TANGELA
	db 37, TANGELA
	; day
	db 34, LICKITUNG
	db 35, LICKITUNG
	db 33, BELLSPROUT
	db 34, WEEPINBELL
	db 35, LICKITUNG
	db 37, TANGELA
	db 37, TANGELA
	; nite
	db 34, LICKITUNG
	db 35, LICKITUNG
	db 33, BELLSPROUT
	db 34, WEEPINBELL
	db 35, LICKITUNG
	db 37, POLIWAG
	db 37, POLIWHIRL

; Weedle swarm
	map_id ROUTE_30
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 3, WEEDLE
	db 3, WEEDLE
	db 4, WEEDLE
	db 4, PIDGEY
	db 3, CATERPIE
	db 4, HOPPIP
	db 4, HOPPIP
	; day
	db 3, WEEDLE
	db 3, WEEDLE
	db 4, WEEDLE
	db 4, PIDGEY
	db 3, CATERPIE
	db 4, HOPPIP
	db 4, HOPPIP
	; nite
	db 3, SPINARAK
	db 3, WEEDLE
	db 4, POLIWAG
	db 4, WEEDLE
	db 3, ZUBAT
	db 4, WEEDLE
	db 4, HOOTHOOT

; Ledyba swarm
	map_id ROUTE_31
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 4, LEDYBA
	db 5, LEDYBA
	db 4, BELLSPROUT
	db 5, PIDGEY
	db 5, LEDYBA
	db 5, HOPPIP
	db 6, HOPPIP
	; day
	db 4, PIDGEY
	db 5, LEDYBA
	db 4, BELLSPROUT
	db 5, PIDGEY
	db 5, LEDYBA
	db 5, LEDYBA
	db 6, HOPPIP
	; nite
	db 4, SPINARAK
	db 5, LEDYBA
	db 4, BELLSPROUT
	db 5, HOOTHOOT
	db 5, LEDYBA
	db 5, LEDYBA
	db 6, POLIWAG

; Oddish swarm
	map_id ILEX_FOREST
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 7, ODDISH
	db 7, ODDISH
	db 9, METAPOD
	db 9, KAKUNA
	db 11, ZUBAT
	db 9, ODDISH
	db 10, PARAS
	; day
	db 7, ODDISH
	db 7, ODDISH
	db 9, METAPOD
	db 9, KAKUNA
	db 11, ZUBAT
	db 9, ODDISH
	db 10, PARAS
	; nite
	db 7, ODDISH
	db 7, ODDISH
	db 9, ODDISH
	db 9, PSYDUCK
	db 11, ZUBAT
	db 9, PARAS
	db 10, PARAS

; Stantler swarm
	map_id ROUTE_37
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 18, STANTLER
	db 19, VULPIX
	db 18, STANTLER
	db 19, GROWLITHE
	db 19, PIDGEOTTO
	db 19, STANTLER
	db 20, LEDIAN
	; day
	db 18, STANTLER
	db 19, GROWLITHE
	db 18, STANTLER
	db 19, VULPIX
	db 19, PIDGEOTTO
	db 19, STANTLER
	db 20, PIDGEY
	; nite
	db 18, STANTLER
	db 19, STANTLER
	db 18, HOOTHOOT
	db 19, STANTLER
	db 19, NOCTOWL
	db 19, ARIADOS
	db 20, ARIADOS

; Drowzee swarm
	map_id ROUTE_34
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 14, DROWZEE
	db 12, DROWZEE
	db 13, PIDGEY
	db 12, ABRA
	db 14, JIGGLYPUFF
	db 12, SNUBBULL
	db 15, DITTO
	; day
	db 14, DROWZEE
	db 12, DROWZEE
	db 13, PIDGEY
	db 12, ABRA
	db 14, JIGGLYPUFF
	db 12, SNUBBULL
	db 15, DITTO
	; nite
	db 14, DROWZEE
	db 12, DROWZEE
	db 13, HOOTHOOT
	db 12, ABRA
	db 14, JIGGLYPUFF
	db 12, DROWZEE
	db 15, DITTO

; Venonat swarm
	map_id NATIONAL_PARK
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 15, VENONAT
	db 15, VENONAT
	db 16, NIDORAN_F
	db 18, NIDORAN_M
	db 17, CATERPIE
	db 18, WEEDLE
	db 18, LEDYBA
	; day
	db 15, VENONAT
	db 15, VENONAT
	db 16, NIDORAN_F
	db 18, NIDORAN_M
	db 17, CATERPIE
	db 18, WEEDLE
	db 18, SUNKERN
	; nite
	db 15, VENONAT
	db 15, VENONAT
	db 16, HOOTHOOT
	db 18, HOOTHOOT
	db 17, VENONAT
	db 18, VENONAT
	db 18, SPINARAK

; Growlithe swarm
	map_id ROUTE_36
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 5, LEDYBA
	db 5, GROWLITHE
	db 6, BELLSPROUT
	db 6, VULPIX
	db 6, GROWLITHE
	db 7, GROWLITHE
	db 7, PIDGEY
	; day
	db 5, PIDGEY
	db 5, GROWLITHE
	db 6, BELLSPROUT
	db 6, VULPIX
	db 6, GROWLITHE
	db 7, GROWLITHE
	db 7, PIDGEY
	; nite
	db 5, SPINARAK
	db 5, GROWLITHE
	db 6, BELLSPROUT
	db 6, HOOTHOOT
	db 6, GROWLITHE
	db 7, GROWLITHE
	db 7, GASTLY

; Pineco swarm
	map_id ROUTE_29
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 2, PINECO
	db 3, PINECO
	db 3, PIDGEY
	db 3, SENTRET
	db 4, RATTATA
	db 3, PINECO
	db 3, HOPPIP
	; day
	db 2, PINECO
	db 3, PINECO
	db 3, PIDGEY
	db 3, SENTRET
	db 4, RATTATA
	db 3, PINECO
	db 3, HOPPIP
	; nite
	db 2, PINECO
	db 3, PINECO
	db 3, HOOTHOOT
	db 3, RATTATA
	db 4, RATTATA
	db 3, PINECO
	db 3, HOOTHOOT

; Aipom swarm
	map_id ROUTE_33
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 8, AIPOM
	db 10, AIPOM
	db 8, GEODUDE
	db 10, SPEAROW
	db 11, EKANS
	db 10, AIPOM
	db 12, HOPPIP
	; day
	db 8, AIPOM
	db 10, AIPOM
	db 8, GEODUDE
	db 10, SPEAROW
	db 11, EKANS
	db 10, AIPOM
	db 12, HOPPIP
	; nite
	db 8, AIPOM
	db 10, AIPOM
	db 8, GEODUDE
	db 10, ZUBAT
	db 11, EKANS
	db 10, AIPOM
	db 12, RATTATA

; Wooper swarm
	map_id UNION_CAVE_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 7, WOOPER
	db 7, WOOPER
	db 8, ZUBAT
	db 7, WOOPER
	db 8, GEODUDE
	db 9, SANDSHREW
	db 10, ONIX
	; day
	db 7, WOOPER
	db 7, WOOPER
	db 8, ZUBAT
	db 7, WOOPER
	db 8, GEODUDE
	db 9, SANDSHREW
	db 10, ONIX
	; nite
	db 7, WOOPER
	db 7, WOOPER
	db 8, GEODUDE
	db 7, WOOPER
	db 8, ZUBAT
	db 9, ONIX
	db 10, ONIX

	map_id UNION_CAVE_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 8, WOOPER
	db 9, WOOPER
	db 10, ZUBAT
	db 9, ONIX
	db 9, GEODUDE
	db 10, RATTATA
	db 11, RATTATA
	; day
	db 8, WOOPER
	db 9, WOOPER
	db 10, ZUBAT
	db 9, ONIX
	db 9, GEODUDE
	db 10, RATTATA
	db 11, RATTATA
	; nite
	db 8, WOOPER
	db 9, WOOPER
	db 10, WOOPER
	db 9, ONIX
	db 9, GEODUDE
	db 10, RATTATA
	db 11, RATTATA

; Koffing swarm
	map_id BURNED_TOWER_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 19, KOFFING
	db 20, KOFFING
	db 21, RATTATA
	db 20, ZUBAT
	db 21, KOFFING
	db 22, RATICATE
	db 21, RATICATE
	; day
	db 19, KOFFING
	db 20, KOFFING
	db 21, RATTATA
	db 20, ZUBAT
	db 21, KOFFING
	db 22, RATICATE
	db 21, RATICATE
	; nite
	db 19, KOFFING
	db 20, KOFFING
	db 21, RATTATA
	db 20, ZUBAT
	db 21, KOFFING
	db 22, RATICATE
	db 21, RATICATE

	map_id BURNED_TOWER_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 19, KOFFING
	db 20, KOFFING
	db 21, RATTATA
	db 20, RATICATE
	db 21, ZUBAT
	db 22, MAGMAR
	db 21, MAGMAR
	; day  
	db 19, KOFFING
	db 20, KOFFING
	db 21, RATTATA
	db 20, MAGMAR
	db 21, ZUBAT
	db 22, RATICATE
	db 21, RATICATE
	; nite 
	db 19, KOFFING
	db 20, KOFFING
	db 21, RATTATA
	db 20, RATICATE
	db 21, ZUBAT
	db 22, MAGMAR
	db 21, MAGMAR

; Mareep swarm
	map_id ROUTE_42
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 25, MAREEP
	db 23, MAREEP
	db 24, MANKEY
	db 26, MAREEP
	db 25, ARBOK
	db 27, FEAROW
	db 27, FLAAFFY
	; day
	db 25, MAREEP
	db 23, MAREEP
	db 24, MANKEY
	db 26, MAREEP
	db 25, ARBOK
	db 27, FEAROW
	db 27, FLAAFFY
	; nite
	db 25, MAREEP
	db 23, MAREEP
	db 24, MANKEY
	db 26, MAREEP
	db 25, ARBOK
	db 27, GOLBAT
	db 27, FLAAFFY

; Girafarig swarm
	map_id ROUTE_43
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 26, GIRAFARIG
	db 26, GIRAFARIG
	db 28, PIDGEOTTO
	db 26, FARFETCH_D
	db 27, GIRAFARIG
	db 28, FURRET
	db 28, FURRET
	; day
	db 26, GIRAFARIG
	db 26, GIRAFARIG
	db 28, PIDGEOTTO
	db 26, FARFETCH_D
	db 27, GIRAFARIG
	db 28, FURRET
	db 28, FURRET
	; nite
	db 26, GIRAFARIG
	db 26, GIRAFARIG
	db 28, NOCTOWL
	db 26, VENONAT
	db 27, GIRAFARIG
	db 28, VENOMOTH
	db 28, VENOMOTH

; Houndour swarm
	map_id ROUTE_48
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 27, HOUNDOUR
	db 27, HOUNDOUR
	db 24, FEAROW
	db 26, HOPPIP
	db 24, FARFETCH_D
	db 23, DIGLETT
	db 23, GIRAFARIG
	; day
	db 27, HOUNDOUR
	db 27, HOUNDOUR
	db 24, FEAROW
	db 26, HOPPIP
	db 24, FARFETCH_D
	db 23, DIGLETT
	db 23, GIRAFARIG
	; nite
	db 27, HOUNDOUR
	db 27, HOUNDOUR
	db 24, FEAROW
	db 26, HOUNDOUR
	db 24, NOCTOWL
	db 23, DIGLETT
	db 23, GIRAFARIG

; Onix swarm
	map_id CLIFF_CAVE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 27, ONIX
	db 27, ONIX
	db 28, KRABBY
	db 28, GRAVELER
	db 28, ONIX
	db 28, MACHOKE
	db 31, STEELIX
	; day
	db 27, ONIX
	db 27, ONIX
	db 28, KRABBY
	db 28, GRAVELER
	db 28, ONIX
	db 28, MACHOKE
	db 31, STEELIX
	; nite
	db 27, ONIX
	db 27, ONIX
	db 28, KRABBY
	db 28, KINGLER
	db 28, ONIX
	db 28, MISDREAVUS
	db 31, STEELIX

; Sneasel swarm
	map_id ICE_PATH_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 34, SNEASEL
	db 34, SNEASEL
	db 35, ZUBAT
	db 36, SWINUB
	db 36, GOLBAT
	db 37, GOLBAT
	db 35, GOLBAT
	; day
	db 34, SNEASEL
	db 34, SNEASEL
	db 35, ZUBAT
	db 36, SWINUB
	db 36, GOLBAT
	db 37, GOLBAT
	db 35, GOLBAT
	; nite
	db 34, SNEASEL
	db 34, SNEASEL
	db 35, ZUBAT
	db 36, DELIBIRD
	db 36, GOLBAT
	db 37, DELIBIRD
	db 35, DELIBIRD

	map_id ICE_PATH_B1F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 35, SNEASEL
	db 35, SNEASEL
	db 36, ZUBAT
	db 37, SWINUB
	db 37, GOLBAT
	db 34, GOLBAT
	db 36, JYNX
	; day
	db 35, SNEASEL
	db 35, SNEASEL
	db 36, ZUBAT
	db 37, SWINUB
	db 37, GOLBAT
	db 34, GOLBAT
	db 36, JYNX
	; nite
	db 35, SNEASEL
	db 35, SNEASEL
	db 36, ZUBAT
	db 37, DELIBIRD
	db 37, GOLBAT
	db 34, DELIBIRD
	db 36, DELIBIRD

	map_id ICE_PATH_B2F_MAHOGANY_SIDE
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 36, SNEASEL
	db 36, SNEASEL
	db 37, GOLBAT
	db 36, SWINUB
	db 36, GOLBAT
	db 35, JYNX
	db 37, JYNX
	; day
	db 36, SNEASEL
	db 36, SNEASEL
	db 37, GOLBAT
	db 36, SWINUB
	db 36, GOLBAT
	db 35, JYNX
	db 37, JYNX
	; nite
	db 36, SNEASEL
	db 36, SNEASEL
	db 37, GOLBAT
	db 36, DELIBIRD
	db 36, GOLBAT
	db 35, DELIBIRD
	db 37, DELIBIRD

	map_id ICE_PATH_B2F_BLACKTHORN_SIDE
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 36, SNEASEL
	db 36, SNEASEL
	db 37, GOLBAT
	db 36, SWINUB
	db 36, GOLBAT
	db 35, JYNX
	db 37, JYNX
	; day
	db 36, SNEASEL
	db 36, SNEASEL
	db 37, GOLBAT
	db 36, SWINUB
	db 36, GOLBAT
	db 35, JYNX
	db 37, JYNX
	; nite
	db 36, SNEASEL
	db 36, SNEASEL
	db 37, GOLBAT
	db 36, DELIBIRD
	db 36, GOLBAT
	db 35, DELIBIRD
	db 37, DELIBIRD

	map_id ICE_PATH_B3F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 37, SNEASEL
	db 37, SNEASEL
	db 38, SWINUB
	db 37, GOLBAT
	db 38, SWINUB
	db 37, JYNX
	db 39, JYNX
	; day
	db 37, SNEASEL
	db 37, SNEASEL
	db 38, SWINUB
	db 37, GOLBAT
	db 38, SWINUB
	db 37, JYNX
	db 39, JYNX
	; nite
	db 37, SNEASEL
	db 37, SNEASEL
	db 38, DELIBIRD
	db 37, GOLBAT
	db 37, SNEASEL
	db 37, DELIBIRD
	db 39, DELIBIRD

; Skarmory swarm
	map_id ROUTE_45
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 37, GEODUDE
	db 39, SKARMORY
	db 37, GLIGAR
	db 35, DONPHAN
	db 39, SKARMORY
	db 39, SKARMORY
	db 41, SKARMORY
	; day
	db 37, GEODUDE
	db 39, SKARMORY
	db 37, GLIGAR
	db 35, DONPHAN
	db 39, SKARMORY
	db 39, SKARMORY
	db 41, SKARMORY
	; nite
	db 37, GEODUDE
	db 39, SKARMORY
	db 37, GLIGAR
	db 35, GRAVELER
	db 39, SKARMORY
	db 39, SKARMORY
	db 41, SKARMORY

; Rhyhorn swarm
	map_id VICTORY_ROAD
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 45, RHYHORN
	db 43, RHYHORN
	db 44, DONPHAN
	db 45, RHYHORN
	db 46, URSARING
	db 46, GOLBAT
	db 47, RHYDON
	; day
	db 45, RHYHORN
	db 43, RHYHORN
	db 44, DONPHAN
	db 45, RHYHORN
	db 46, URSARING
	db 46, GOLBAT
	db 47, RHYDON
	; nite
	db 45, RHYHORN
	db 43, RHYHORN
	db 44, DONPHAN
	db 45, RHYHORN
	db 46, URSARING
	db 46, GOLBAT
	db 47, RHYDON

; Mr.Mime swarm
	map_id ROUTE_21
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 40, MR__MIME
	db 35, MR__MIME
	db 45, TANGELA
	db 30, RATICATE
	db 40, TANGELA
	db 38, MR__MIME
	db 38, MR__MIME
	; day
	db 40, MR__MIME
	db 35, MR__MIME
	db 45, TANGELA
	db 30, RATICATE
	db 38, MR__MIME
	db 40, MR__MIME
	db 40, MR__MIME
	; nite
	db 40, MR__MIME
	db 35, MR__MIME
	db 45, TANGELA
	db 30, RATICATE
	db 40, TANGELA
	db 38, MR__MIME
	db 38, MR__MIME

; Raticate swarm
	map_id ROUTE_1
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 14, RATICATE
	db 15, RATICATE
	db 16, SENTRET
	db 16, PIDGEY
	db 19, RATICATE
	db 18, PIDGEY
	db 19, FURRET
	; day
	db 14, RATICATE
	db 15, RATICATE
	db 16, SENTRET
	db 16, PIDGEY
	db 19, RATICATE
	db 18, PIDGEY
	db 19, FURRET
	; nite
	db 14, RATICATE
	db 15, RATICATE
	db 16, RATTATA
	db 16, HOOTHOOT
	db 19, RATICATE
	db 18, HOOTHOOT
	db 19, HOOTHOOT

; Bulbasaur swarm
	map_id VIRIDIAN_FOREST
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 15, CATERPIE
	db 15, WEEDLE
	db 17, METAPOD
	db 17, KAKUNA
	db 14, BULBASAUR
	db 14, BULBASAUR
	db 19, PIKACHU
	; day
	db 15, CATERPIE
	db 15, WEEDLE
	db 17, METAPOD
	db 17, KAKUNA
	db 14, BULBASAUR
	db 14, BULBASAUR
	db 19, PIKACHU
	; nite
	db 15, HOOTHOOT
	db 15, HOOTHOOT
	db 17, HOOTHOOT
	db 17, NOCTOWL
	db 14, BULBASAUR
	db 14, BULBASAUR
	db 19, PIKACHU

; Charmander swarm
	map_id ROUTE_22
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 15, RATTATA
	db 15, SPEAROW
	db 17, SPEAROW
	db 16, DODUO
	db 14, CHARMANDER
	db 14, CHARMANDER
	db 18, PONYTA
	; day
	db 15, RATTATA
	db 15, SPEAROW
	db 17, SPEAROW
	db 16, DODUO
	db 14, CHARMANDER
	db 14, CHARMANDER
	db 18, PONYTA
	; nite
	db 15, RATTATA
	db 15, POLIWAG
	db 17, RATTATA
	db 16, POLIWAG
	db 14, CHARMANDER
	db 14, CHARMANDER
	db 18, PONYTA

; Clefairy swarm
	map_id MOUNT_MOON_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 18, CLEFAIRY
	db 20, CLEFAIRY
	db 22, SANDSHREW
	db 22, PARAS
	db 21, ZUBAT
	db 20, GEODUDE
	db 22, GEODUDE
	; day
	db 18, CLEFAIRY
	db 20, CLEFAIRY
	db 22, SANDSHREW
	db 22, PARAS
	db 21, ZUBAT
	db 20, GEODUDE
	db 22, GEODUDE
	; nite
	db 18, CLEFAIRY
	db 20, CLEFAIRY
	db 22, SANDSHREW
	db 22, PARAS
	db 21, ZUBAT
	db 20, GEODUDE
	db 22, GEODUDE

; Noctowl swarm
	map_id ROUTE_5
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 25, NOCTOWL
	db 25, SNUBBULL
	db 27, NOCTOWL
	db 22, PIDGEY
	db 24, JIGGLYPUFF
	db 24, PIDGEOTTO
	db 24, ABRA
	; day
	db 25, NOCTOWL
	db 25, SNUBBULL
	db 27, NOCTOWL
	db 22, PIDGEY
	db 24, JIGGLYPUFF
	db 24, PIDGEOTTO
	db 24, ABRA
	; nite
	db 23, NOCTOWL
	db 23, MEOWTH
	db 25, NOCTOWL
	db 22, HOOTHOOT
	db 24, JIGGLYPUFF
	db 24, NOCTOWL
	db 24, ABRA

; Abra swarm
	map_id ROUTE_6
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 27, ABRA
	db 29, BELLSPROUT
	db 28, ABRA
	db 29, MAGNEMITE
	db 24, ABRA
	db 29, SNUBBULL
	db 29, GRANBULL
	; day
	db 27, ABRA
	db 29, BELLSPROUT
	db 28, ABRA
	db 29, MAGNEMITE
	db 24, ABRA
	db 29, SNUBBULL
	db 29, GRANBULL
	; nite
	db 27, ABRA
	db 29, ODDISH
	db 28, ABRA
	db 29, MAGNEMITE
	db 24, ABRA
	db 29, MEOWTH
	db 29, PSYDUCK

; Pidgeotto swarm
	map_id ROUTE_11
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 26, PIDGEOTTO
	db 30, RATICATE
	db 29, MAGNEMITE
	db 30, PIDGEOTTO
	db 27, PIDGEOTTO
	db 28, HOPPIP
	db 28, HOPPIP
	; day
	db 26, PIDGEOTTO
	db 30, RATICATE
	db 29, MAGNEMITE
	db 30, PIDGEOTTO
	db 27, PIDGEOTTO
	db 28, HOPPIP
	db 28, HOPPIP
	; nite
	db 26, DROWZEE
	db 30, PIDGEOTTO
	db 29, MAGNEMITE
	db 30, PIDGEOTTO
	db 27, PIDGEOTTO
	db 28, HYPNO
	db 28, HYPNO

; Squirtle swarm
	map_id ROUTE_25
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 20, PIDGEY
	db 22, BELLSPROUT
	db 23, VENONAT
	db 19, ABRA
	db 14, SQUIRTLE
	db 14, SQUIRTLE
	db 23, WEEPINBELL
	; day
	db 20, PIDGEY
	db 22, BELLSPROUT
	db 23, VENONAT
	db 19, ABRA
	db 14, SQUIRTLE
	db 14, SQUIRTLE
	db 23, WEEPINBELL
	; nite
	db 20, VENONAT
	db 22, ODDISH
	db 23, VENOMOTH
	db 19, ABRA
	db 14, SQUIRTLE
	db 14, SQUIRTLE
	db 23, BELLSPROUT

; Kangaskhan swarm
	map_id ROCK_TUNNEL_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 22, KANGASKHAN
	db 23, KANGASKHAN
	db 24, MACHOP
	db 24, ZUBAT
	db 28, MACHOKE
	db 24, CUBONE
	db 26, CUBONE
	; day
	db 22, KANGASKHAN
	db 23, KANGASKHAN
	db 24, MACHOP
	db 24, ZUBAT
	db 28, MACHOKE
	db 24, CUBONE
	db 26, CUBONE
	; nite
	db 22, KANGASKHAN
	db 23, KANGASKHAN
	db 24, MACHOP
	db 24, ZUBAT
	db 28, MACHOKE
	db 24, CUBONE
	db 26, CUBONE

	map_id ROCK_TUNNEL_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 24, CUBONE
	db 24, KANGASKHAN
	db 25, ONIX
	db 27, KANGASKHAN
	db 29, KANGASKHAN
	db 27, MAROWAK
	db 29, MAROWAK
	; day
	db 24, CUBONE
	db 24, KANGASKHAN
	db 25, ONIX
	db 27, KANGASKHAN
	db 29, KANGASKHAN
	db 27, MAROWAK
	db 29, MAROWAK
	; nite
	db 24, CUBONE
	db 24, KANGASKHAN
	db 25, ONIX
	db 27, KANGASKHAN
	db 29, KANGASKHAN
	db 27, MAROWAK
	db 29, MAROWAK

; Electabuzz swarm
	map_id ROUTE_10_SOUTH
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 36, ELECTABUZZ
	db 36, VOLTORB
	db 38, SPEAROW
	db 40, ELECTABUZZ
	db 40, ELECTABUZZ
	db 36, FEAROW
	db 39, RATICATE
	; day
	db 36, ELECTABUZZ
	db 36, VOLTORB
	db 38, SPEAROW
	db 40, ELECTABUZZ
	db 40, ELECTABUZZ
	db 36, FEAROW
	db 39, RATICATE
	; nite
	db 36, ELECTABUZZ
	db 36, VOLTORB
	db 38, QUAGSIRE
	db 40, ELECTABUZZ
	db 40, ELECTABUZZ
	db 36, QUAGSIRE
	db 39, RATICATE

; Tyrogue swarm
	map_id ROUTE_8
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 29, SNUBBULL
	db 31, PIDGEOTTO
	db 26, TYROGUE
	db 31, TYROGUE
	db 31, TYROGUE
	db 27, KADABRA
	db 34, KADABRA
	; day
	db 29, SNUBBULL
	db 31, PIDGEOTTO
	db 26, TYROGUE
	db 31, TYROGUE
	db 31, TYROGUE
	db 27, KADABRA
	db 34, KADABRA
	; nite
	db 29, MEOWTH
	db 31, NOCTOWL
	db 26, TYROGUE
	db 31, TYROGUE
	db 31, TYROGUE
	db 27, HAUNTER
	db 34, KADABRA

; Grimer swarm
	map_id ROUTE_17
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 36, GRIMER
	db 37, FEAROW
	db 38, GRIMER
	db 39, GRIMER
	db 39, SLUGMA
	db 40, MUK
	db 42, MUK
	; day
	db 36, GRIMER
	db 37, FEAROW
	db 38, GRIMER
	db 39, GRIMER
	db 39, SLUGMA
	db 40, MUK
	db 42, MUK
	; nite
	db 36, GRIMER
	db 37, GRIMER
	db 38, GRIMER
	db 39, MUK
	db 39, SLUGMA
	db 40, MUK
	db 42, MUK

; Exeggcute swarm
	map_id ROUTE_15
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 38, EXEGGCUTE
	db 38, NIDORINO
	db 42, NIDORINA
	db 38, EXEGGCUTE
	db 38, HOPPIP
	db 40, HOPPIP
	db 40, CHANSEY
	; day
	db 36, EXEGGCUTE
	db 38, NIDORINO
	db 42, NIDORINA
	db 38, EXEGGCUTE
	db 38, HOPPIP
	db 40, HOPPIP
	db 40, CHANSEY
	; nite
	db 36, EXEGGCUTE
	db 38, VENONAT
	db 42, NOCTOWL
	db 38, EXEGGCUTE
	db 38, VENOMOTH
	db 40, QUAGSIRE
	db 40, CHANSEY

; Nidorina swarm
	map_id ROUTE_14
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 38, NIDORINA
	db 38, NIDORINO
	db 40, PIDGEOTTO
	db 38, NIDORINA
	db 40, NIDORINA
	db 40, SKIPLOOM
	db 40, CHANSEY
	; day
	db 38, NIDORINA
	db 38, NIDORINO
	db 40, PIDGEOTTO
	db 38, NIDORINA
	db 40, NIDORINA
	db 40, SKIPLOOM
	db 40, CHANSEY
	; nite
	db 38, NIDORINA
	db 38, QUAGSIRE
	db 40, NOCTOWL
	db 38, NIDORINA
	db 40, NIDORINA
	db 40, QUAGSIRE
	db 40, CHANSEY

; Chansey swarm
	map_id ROUTE_13
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 35, NIDORINO
	db 35, NIDORINA
	db 38, CHANSEY
	db 35, CHANSEY
	db 37, FARFETCH_D
	db 39, HOPPIP
	db 41, CHANSEY
	; day
	db 35, NIDORINO
	db 35, NIDORINA
	db 38, CHANSEY
	db 35, CHANSEY
	db 37, FARFETCH_D
	db 39, HOPPIP
	db 41, CHANSEY
	; nite
	db 35, VENONAT
	db 35, QUAGSIRE
	db 38, CHANSEY
	db 35, CHANSEY
	db 37, FARFETCH_D
	db 39, QUAGSIRE
	db 41, CHANSEY

; Jynx swarm
	map_id SEAFOAM_ISLANDS_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 44, JYNX
	db 46, JYNX
	db 46, SEEL
	db 40, PSYDUCK
	db 46, GOLDUCK
	db 40, GOLBAT
	db 41, ZUBAT
	; day
	db 44, JYNX
	db 46, JYNX
	db 46, SEEL
	db 40, PSYDUCK
	db 46, GOLDUCK
	db 40, GOLBAT
	db 41, ZUBAT
	; nite
	db 44, JYNX
	db 46, JYNX
	db 46, SEEL
	db 40, PSYDUCK
	db 46, GOLDUCK
	db 40, GOLBAT
	db 41, ZUBAT

	map_id SEAFOAM_ISLANDS_B2F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 45, JYNX
	db 47, JYNX
	db 47, SEEL
	db 42, PSYDUCK
	db 47, GOLDUCK
	db 41, GOLBAT
	db 42, ZUBAT
	; day
	db 45, JYNX
	db 47, JYNX
	db 47, SEEL
	db 42, PSYDUCK
	db 47, GOLDUCK
	db 41, GOLBAT
	db 42, ZUBAT
	; nite
	db 45, JYNX
	db 47, JYNX
	db 47, SEEL
	db 42, PSYDUCK
	db 47, GOLDUCK
	db 41, GOLBAT
	db 42, ZUBAT

	map_id SEAFOAM_ISLANDS_B3F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 48, JYNX
	db 48, JYNX
	db 48, DEWGONG
	db 44, GOLDUCK
	db 46, PSYDUCK
	db 44, SEEL
	db 44, ZUBAT
	; day
	db 48, JYNX
	db 48, JYNX
	db 48, DEWGONG
	db 44, GOLDUCK
	db 46, PSYDUCK
	db 44, SEEL
	db 44, ZUBAT
	; nite
	db 48, JYNX
	db 48, JYNX
	db 48, DEWGONG
	db 44, GOLDUCK
	db 46, PSYDUCK
	db 44, SEEL
	db 44, ZUBAT

	map_id SEAFOAM_ISLANDS_B4F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 52, JYNX
	db 50, JYNX
	db 50, DEWGONG
	db 46, GOLDUCK
	db 46, JYNX
	db 52, SEEL
	db 52, GOLBAT
	; day
	db 52, JYNX
	db 50, JYNX
	db 50, DEWGONG
	db 46, GOLDUCK
	db 46, JYNX
	db 52, SEEL
	db 52, GOLBAT
	; nite
	db 52, JYNX
	db 50, JYNX
	db 50, DEWGONG
	db 46, GOLDUCK
	db 46, JYNX
	db 52, SEEL
	db 52, GOLBAT

	db -1 ; end
