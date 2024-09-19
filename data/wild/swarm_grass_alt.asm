; Pokémon swarms in grass

SwarmGrassWildMonsAlt:

; Slowpoke swarm
	map_id SLOWPOKE_WELL_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 5, SLOWPOKE
	db 6, SLOWPOKE
	db 7, ZUBAT
	db 6, SLOWPOKE
	db 8, ZUBAT
	db 8, SLOWPOKE
	db 8, ZUBAT
	; day
	db 5, SLOWPOKE
	db 6, SLOWPOKE
	db 7, ZUBAT
	db 6, SLOWPOKE
	db 8, ZUBAT
	db 8, SLOWPOKE
	db 8, ZUBAT
	; nite
	db 5, SLOWPOKE
	db 6, SLOWPOKE
	db 7, ZUBAT
	db 6, SLOWPOKE
	db 8, ZUBAT
	db 8, SLOWPOKE
	db 8, ZUBAT

	map_id SLOWPOKE_WELL_B2F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 21, SLOWPOKE
	db 23, SLOWPOKE
	db 19, ZUBAT
	db 21, SLOWPOKE
	db 23, GOLBAT
	db 23, SLOWPOKE
	db 23, GOLBAT
	; day
	db 21, SLOWPOKE
	db 23, SLOWPOKE
	db 19, ZUBAT
	db 21, SLOWPOKE
	db 23, GOLBAT
	db 23, SLOWPOKE
	db 23, GOLBAT
	; nite
	db 21, SLOWPOKE
	db 23, SLOWPOKE
	db 19, ZUBAT
	db 21, SLOWPOKE
	db 23, GOLBAT
	db 23, SLOWPOKE
	db 23, GOLBAT

; Teddiursa swarm
	map_id DARK_CAVE_VIOLET_ENTRANCE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 2, TEDDIURSA
	db 3, TEDDIURSA
	db 3, GEODUDE
	db 2, ZUBAT
	db 2, GEODUDE
	db 4, TEDDIURSA
	db 4, DUNSPARCE
	; day
	db 2, TEDDIURSA
	db 3, TEDDIURSA
	db 3, GEODUDE
	db 2, ZUBAT
	db 2, GEODUDE
	db 4, TEDDIURSA
	db 4, DUNSPARCE
	; nite
	db 2, TEDDIURSA
	db 3, TEDDIURSA
	db 3, GEODUDE
	db 2, ZUBAT
	db 2, GEODUDE
	db 4, TEDDIURSA
	db 4, DUNSPARCE

; Bellsprout swarm
	map_id ROUTE_32
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 4, BELLSPROUT
	db 7, BELLSPROUT
	db 6, MAREEP
	db 6, HOPPIP
	db 7, PIDGEY
	db 6, BELLSPROUT
	db 6, RATTATA
	; day
	db 4, BELLSPROUT
	db 7, BELLSPROUT
	db 6, MAREEP
	db 6, HOPPIP
	db 7, PIDGEY
	db 6, BELLSPROUT
	db 6, RATTATA
	; nite
	db 5, BELLSPROUT
	db 6, WOOPER
	db 7, BELLSPROUT
	db 6, MAREEP
	db 7, HOOTHOOT
	db 7, BELLSPROUT
	db 7, GASTLY

; Psyduck swarm
	map_id ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 12, PSYDUCK
	db 14, PSYDUCK
	db 12, SNUBBULL
	db 14, PIDGEY
	db 12, JIGGLYPUFF
	db 10, DITTO
	db 10, DITTO
	; day
	db 12, PSYDUCK
	db 14, PSYDUCK
	db 12, SNUBBULL
	db 14, PIDGEY
	db 12, JIGGLYPUFF
	db 10, DITTO
	db 10, DITTO
	; nite
	db 12, PSYDUCK
	db 14, PSYDUCK
	db 12, DROWZEE
	db 14, HOOTHOOT
	db 12, JIGGLYPUFF
	db 10, DITTO
	db 10, DITTO

; Machop swarm
	map_id MOUNT_MORTAR_1F_OUTSIDE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 13, MACHOP
	db 13, MACHOP
	db 13, ZUBAT
	db 15, MARILL
	db 14, GEODUDE
	db 16, RATTATA
	db 16, RATICATE
	; day
	db 13, MACHOP
	db 13, MACHOP
	db 13, ZUBAT
	db 15, MARILL
	db 14, GEODUDE
	db 16, RATTATA
	db 16, RATICATE
	; nite
	db 13, MACHOP
	db 13, MACHOP
	db 13, ZUBAT
	db 15, MARILL
	db 14, GOLBAT
	db 16, RATTATA
	db 16, RATICATE

	map_id MOUNT_MORTAR_1F_INSIDE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 13, MACHOP
	db 15, MACHOP
	db 15, MARILL
	db 14, RATICATE
	db 15, ZUBAT
	db 15, GOLBAT
	db 15, GOLBAT
	; day
	db 13, MACHOP
	db 15, MACHOP
	db 15, MARILL
	db 14, RATICATE
	db 15, ZUBAT
	db 15, GOLBAT
	db 15, GOLBAT
	; nite
	db 13, MACHOP
	db 15, MACHOP
	db 15, RATICATE
	db 14, ZUBAT
	db 15, MARILL
	db 15, GOLBAT
	db 15, GOLBAT

	map_id MOUNT_MORTAR_2F_INSIDE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 31, MACHOP
	db 32, MACHOP
	db 31, GRAVELER
	db 30, RATICATE
	db 32, MACHOKE
	db 30, GOLBAT
	db 30, GOLBAT
	; day
	db 31, MACHOP
	db 32, MACHOP
	db 31, GRAVELER
	db 30, RATICATE
	db 32, MACHOKE
	db 30, GOLBAT
	db 30, GOLBAT
	; nite
	db 31, MACHOP
	db 32, MACHOP
	db 31, GRAVELER
	db 30, RATICATE
	db 32, MARILL
	db 30, GOLBAT
	db 30, GOLBAT

	map_id MOUNT_MORTAR_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 15, MACHOP
	db 17, MACHOP
	db 17, GOLBAT
	db 16, MACHOP
	db 16, GEODUDE
	db 18, RATICATE
	db 18, RATICATE
	; day
	db 15, MACHOP
	db 17, MACHOP
	db 17, GOLBAT
	db 16, MACHOP
	db 16, GEODUDE
	db 18, RATICATE
	db 18, RATICATE
	; nite
	db 15, MACHOP
	db 17, MACHOP
	db 17, GOLBAT
	db 16, MARILL
	db 16, GEODUDE
	db 18, RATICATE
	db 18, RATICATE

; Tauros swarm
	map_id ROUTE_38
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 13, TAUROS
	db 14, TAUROS
	db 16, RATICATE
	db 16, MAGNEMITE
	db 16, PIDGEOTTO
	db 13, TAUROS
	db 13, MILTANK
	; day
	db 13, TAUROS
	db 14, TAUROS
	db 16, RATICATE
	db 16, MAGNEMITE
	db 16, PIDGEOTTO
	db 13, TAUROS
	db 13, MILTANK
	; nite
	db 13, TAUROS
	db 14, TAUROS
	db 16, RATICATE
	db 16, MAGNEMITE
	db 16, NOCTOWL
	db 13, TAUROS
	db 16, MEOWTH

; Lickitung swarm
	map_id ROUTE_44
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 23, LICKITUNG
	db 22, LICKITUNG
	db 22, BELLSPROUT
	db 24, WEEPINBELL
	db 24, LICKITUNG
	db 26, TANGELA
	db 26, TANGELA
	; day
	db 23, LICKITUNG
	db 22, LICKITUNG
	db 22, BELLSPROUT
	db 24, WEEPINBELL
	db 24, LICKITUNG
	db 26, TANGELA
	db 26, TANGELA
	; nite
	db 23, LICKITUNG
	db 22, LICKITUNG
	db 22, BELLSPROUT
	db 24, WEEPINBELL
	db 24, LICKITUNG
	db 26, POLIWAG
	db 26, POLIWHIRL

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
	db 3, WEEDLE
	db 4, WEEDLE
	db 3, SPINARAK
	db 4, POLIWAG
	db 4, WEEDLE
	db 3, ZUBAT
	db 4, HOOTHOOT

; Ledyba swarm
	map_id ROUTE_31
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 4, LEDYBA
	db 4, LEDYBA
	db 5, BELLSPROUT
	db 5, PIDGEY
	db 4, LEDYBA
	db 5, HOPPIP
	db 5, HOPPIP
	; day
	db 4, LEDYBA
	db 4, LEDYBA
	db 4, PIDGEY
	db 5, BELLSPROUT
	db 5, PIDGEY
	db 4, LEDYBA
	db 5, HOPPIP
	; nite
	db 4, LEDYBA
	db 4, LEDYBA
	db 4, SPINARAK
	db 5, BELLSPROUT
	db 5, HOOTHOOT
	db 5, POLIWAG
	db 5, GASTLY

; Oddish swarm
	map_id ILEX_FOREST
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 5, ODDISH
	db 5, ODDISH
	db 7, METAPOD
	db 7, KAKUNA
	db 7, ZUBAT
	db 6, PARAS
	db 6, PARAS
	; day
	db 5, ODDISH
	db 5, ODDISH
	db 7, METAPOD
	db 7, KAKUNA
	db 7, ZUBAT
	db 6, PARAS
	db 6, PARAS
	; nite
	db 5, ODDISH
	db 5, ODDISH
	db 7, ODDISH
	db 7, PSYDUCK
	db 7, ZUBAT
	db 6, PARAS
	db 6, PARAS

; Stantler swarm
	map_id ROUTE_37
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 13, STANTLER
	db 15, STANTLER
	db 14, VULPIX
	db 16, GROWLITHE
	db 15, PIDGEOTTO
	db 15, STANTLER
	db 15, LEDIAN
	; day
	db 13, STANTLER
	db 15, STANTLER
	db 14, GROWLITHE
	db 16, VULPIX
	db 15, PIDGEOTTO
	db 15, STANTLER
	db 15, PIDGEY
	; nite
	db 13, STANTLER
	db 14, STANTLER
	db 15, HOOTHOOT
	db 16, STANTLER
	db 15, NOCTOWL
	db 15, ARIADOS
	db 15, ARIADOS

; Drowzee swarm
	map_id ROUTE_34
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 10, DROWZEE
	db 11, DROWZEE
	db 12, PIDGEY
	db 10, ABRA
	db 12, JIGGLYPUFF
	db 10, SNUBBULL
	db 10, DITTO
	; day
	db 10, DROWZEE
	db 11, DROWZEE
	db 12, PIDGEY
	db 10, ABRA
	db 12, JIGGLYPUFF
	db 10, SNUBBULL
	db 10, DITTO
	; nite
	db 12, DROWZEE
	db 11, DROWZEE
	db 12, HOOTHOOT
	db 10, ABRA
	db 12, JIGGLYPUFF
	db 10, DROWZEE
	db 10, DITTO

; Venonat swarm
	map_id NATIONAL_PARK
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 12, VENONAT
	db 12, VENONAT
	db 14, NIDORAN_F
	db 13, NIDORAN_M
	db 10, CATERPIE
	db 10, WEEDLE
	db 10, LEDYBA
	; day
	db 12, VENONAT
	db 12, VENONAT
	db 14, NIDORAN_F
	db 13, NIDORAN_M
	db 10, CATERPIE
	db 10, WEEDLE
	db 10, SUNKERN
	; nite
	db 12, VENONAT
	db 12, VENONAT
	db 14, HOOTHOOT
	db 13, HOOTHOOT
	db 10, VENONAT
	db 12, VENONAT
	db 12, SPINARAK

; Growlithe swarm
	map_id ROUTE_36
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 4, GROWLITHE
	db 5, GROWLITHE
	db 4, LEDYBA
	db 5, BELLSPROUT
	db 5, VULPIX
	db 6, GROWLITHE
	db 6, PIDGEY
	; day
	db 4, GROWLITHE
	db 5, GROWLITHE
	db 4, PIDGEY
	db 5, BELLSPROUT
	db 5, VULPIX
	db 6, GROWLITHE
	db 6, PIDGEY
	; nite
	db 4, GROWLITHE
	db 5, GROWLITHE
	db 4, SPINARAK
	db 5, BELLSPROUT
	db 5, HOOTHOOT
	db 5, GROWLITHE
	db 5, GASTLY

; Pineco swarm
	map_id ROUTE_29
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 2, PINECO
	db 2, PINECO
	db 3, PIDGEY
	db 3, SENTRET
	db 2, RATTATA
	db 3, PINECO
	db 3, HOPPIP
	; day
	db 2, PINECO
	db 2, PINECO
	db 3, PIDGEY
	db 3, SENTRET
	db 2, RATTATA
	db 3, PINECO
	db 3, HOPPIP
	; nite
	db 2, PINECO
	db 2, PINECO
	db 3, HOOTHOOT
	db 3, RATTATA
	db 2, RATTATA
	db 3, PINECO
	db 3, HOOTHOOT

; Aipom swarm
	map_id ROUTE_33
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 6, AIPOM
	db 6, AIPOM
	db 6, GEODUDE
	db 6, SPEAROW
	db 7, EKANS
	db 7, AIPOM
	db 7, HOPPIP
	; day
	db 6, AIPOM
	db 6, AIPOM
	db 6, GEODUDE
	db 6, SPEAROW
	db 7, EKANS
	db 7, AIPOM
	db 7, HOPPIP
	; nite
	db 6, AIPOM
	db 6, AIPOM
	db 6, GEODUDE
	db 6, ZUBAT
	db 7, EKANS
	db 7, AIPOM
	db 7, RATTATA

; Wooper swarm
	map_id UNION_CAVE_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 6, WOOPER
	db 6, WOOPER
	db 5, ZUBAT
	db 4, WOOPER
	db 7, GEODUDE
	db 6, SANDSHREW
	db 6, ONIX
	; day
	db 6, WOOPER
	db 6, WOOPER
	db 5, ZUBAT
	db 4, WOOPER
	db 7, GEODUDE
	db 6, SANDSHREW
	db 6, ONIX
	; nite
	db 6, WOOPER
	db 6, WOOPER
	db 5, GEODUDE
	db 4, WOOPER
	db 7, ZUBAT
	db 6, ONIX
	db 6, ONIX

	map_id UNION_CAVE_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 6, WOOPER
	db 7, WOOPER
	db 8, ZUBAT
	db 8, ONIX
	db 6, GEODUDE
	db 8, RATTATA
	db 8, RATTATA
	; day
	db 6, WOOPER
	db 7, WOOPER
	db 8, ZUBAT
	db 8, ONIX
	db 6, GEODUDE
	db 8, RATTATA
	db 8, RATTATA
	; nite
	db 6, WOOPER
	db 7, WOOPER
	db 8, WOOPER
	db 8, ONIX
	db 6, GEODUDE
	db 8, RATTATA
	db 8, RATTATA

; Koffing swarm
	map_id BURNED_TOWER_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 13, KOFFING
	db 14, KOFFING
	db 15, RATTATA
	db 14, ZUBAT
	db 15, KOFFING
	db 15, RATICATE
	db 15, RATICATE
	; day
	db 13, KOFFING
	db 14, KOFFING
	db 15, RATTATA
	db 14, ZUBAT
	db 15, KOFFING
	db 15, RATICATE
	db 15, RATICATE
	; nite
	db 13, KOFFING
	db 14, KOFFING
	db 15, RATTATA
	db 14, ZUBAT
	db 15, KOFFING
	db 15, RATICATE
	db 15, RATICATE

	map_id BURNED_TOWER_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 14, KOFFING
	db 16, KOFFING
	db 14, RATTATA
	db 16, RATTATA
	db 15, ZUBAT
	db 14, MAGMAR
	db 14, MAGMAR
	; day  
	db 14, KOFFING
	db 16, KOFFING
	db 14, RATTATA
	db 16, MAGMAR
	db 15, ZUBAT
	db 14, RATTATA
	db 14, RATTATA
	; nite 
	db 14, KOFFING
	db 16, KOFFING
	db 14, RATTATA
	db 16, RATTATA
	db 15, ZUBAT
	db 14, MAGMAR
	db 14, MAGMAR

; Mareep swarm
	map_id ROUTE_42
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 15, MAREEP
	db 14, MAREEP
	db 15, MANKEY
	db 16, MAREEP
	db 15, ARBOK
	db 16, FEAROW
	db 17, FLAAFFY
	; day
	db 15, MAREEP
	db 14, MAREEP
	db 15, MANKEY
	db 16, MAREEP
	db 15, ARBOK
	db 16, FEAROW
	db 17, FLAAFFY
	; nite
	db 15, MAREEP
	db 14, MAREEP
	db 15, MANKEY
	db 16, MAREEP
	db 15, ARBOK
	db 16, GOLBAT
	db 17, FLAAFFY

; Girafarig swarm
	map_id ROUTE_43
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 15, GIRAFARIG
	db 15, GIRAFARIG
	db 16, PIDGEOTTO
	db 16, FARFETCH_D
	db 15, GIRAFARIG
	db 17, FURRET
	db 17, FURRET
	; day
	db 15, GIRAFARIG
	db 15, GIRAFARIG
	db 16, PIDGEOTTO
	db 16, FARFETCH_D
	db 15, GIRAFARIG
	db 17, FURRET
	db 17, FURRET
	; nite
	db 15, GIRAFARIG
	db 15, GIRAFARIG
	db 16, NOCTOWL
	db 16, VENONAT
	db 15, GIRAFARIG
	db 17, VENOMOTH
	db 17, VENOMOTH

; Houndour swarm
	map_id ROUTE_48
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 21, HOUNDOUR
	db 20, HOUNDOUR
	db 21, FEAROW
	db 22, HOPPIP
	db 21, FARFETCH_D
	db 20, DIGLETT
	db 20, GIRAFARIG
	; day
	db 21, HOUNDOUR
	db 20, HOUNDOUR
	db 21, FEAROW
	db 22, HOPPIP
	db 21, FARFETCH_D
	db 20, DIGLETT
	db 20, GIRAFARIG
	; nite
	db 21, HOUNDOUR
	db 20, HOUNDOUR
	db 21, FEAROW
	db 22, HOUNDOUR
	db 21, NOCTOWL
	db 20, DIGLETT
	db 20, GIRAFARIG

; Onix swarm
	map_id CLIFF_CAVE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 18, ONIX
	db 19, ONIX
	db 20, KRABBY
	db 22, GRAVELER
	db 20, ONIX
	db 22, MACHOKE
	db 23, STEELIX
	; day
	db 18, ONIX
	db 19, ONIX
	db 20, KRABBY
	db 22, GRAVELER
	db 20, ONIX
	db 22, MACHOKE
	db 23, STEELIX
	; nite
	db 18, ONIX
	db 19, ONIX
	db 20, KRABBY
	db 22, KINGLER
	db 20, ONIX
	db 20, MISDREAVUS
	db 23, STEELIX

; Sneasel swarm
	map_id ICE_PATH_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 21, SNEASEL
	db 22, SNEASEL
	db 22, ZUBAT
	db 23, SWINUB
	db 24, GOLBAT
	db 22, GOLBAT
	db 22, GOLBAT
	; day
	db 21, SNEASEL
	db 22, SNEASEL
	db 22, ZUBAT
	db 23, SWINUB
	db 24, GOLBAT
	db 22, GOLBAT
	db 22, GOLBAT
	; nite
	db 21, SNEASEL
	db 22, SNEASEL
	db 22, ZUBAT
	db 23, DELIBIRD
	db 24, GOLBAT
	db 22, DELIBIRD
	db 22, DELIBIRD

	map_id ICE_PATH_B1F
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 22, SNEASEL
	db 23, SNEASEL
	db 23, ZUBAT
	db 24, SWINUB
	db 25, GOLBAT
	db 23, GOLBAT
	db 22, JYNX
	; day
	db 22, SNEASEL
	db 23, SNEASEL
	db 23, ZUBAT
	db 24, SWINUB
	db 25, GOLBAT
	db 23, GOLBAT
	db 22, JYNX
	; nite
	db 22, SNEASEL
	db 23, SNEASEL
	db 23, ZUBAT
	db 24, DELIBIRD
	db 25, GOLBAT
	db 23, DELIBIRD
	db 22, DELIBIRD

	map_id ICE_PATH_B2F_MAHOGANY_SIDE
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 23, SNEASEL
	db 24, SNEASEL
	db 24, GOLBAT
	db 25, SWINUB
	db 26, GOLBAT
	db 22, JYNX
	db 24, JYNX
	; day
	db 23, SNEASEL
	db 24, SNEASEL
	db 24, GOLBAT
	db 25, SWINUB
	db 26, GOLBAT
	db 22, JYNX
	db 24, JYNX
	; nite
	db 23, SNEASEL
	db 24, SNEASEL
	db 24, GOLBAT
	db 25, DELIBIRD
	db 26, GOLBAT
	db 22, DELIBIRD
	db 24, DELIBIRD

	map_id ICE_PATH_B2F_BLACKTHORN_SIDE
	db 2 percent, 2 percent, 2 percent ; encounter rates: morn/day/nite
	; morn
	db 23, SNEASEL
	db 24, SNEASEL
	db 24, GOLBAT
	db 25, SWINUB
	db 26, GOLBAT
	db 22, JYNX
	db 24, JYNX
	; day
	db 23, SNEASEL
	db 24, SNEASEL
	db 24, GOLBAT
	db 25, SWINUB
	db 26, GOLBAT
	db 22, JYNX
	db 24, JYNX
	; nite
	db 23, SNEASEL
	db 24, SNEASEL
	db 24, GOLBAT
	db 25, DELIBIRD
	db 26, GOLBAT
	db 22, DELIBIRD
	db 24, DELIBIRD

	map_id ICE_PATH_B3F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 22, SNEASEL
	db 24, SNEASEL
	db 24, SWINUB
	db 25, GOLBAT
	db 26, SWINUB
	db 24, JYNX
	db 26, JYNX
	; day
	db 22, SNEASEL
	db 24, SNEASEL
	db 24, SWINUB
	db 25, GOLBAT
	db 26, SWINUB
	db 24, JYNX
	db 26, JYNX
	; nite
	db 22, SNEASEL
	db 24, SNEASEL
	db 24, DELIBIRD
	db 25, GOLBAT
	db 22, SNEASEL
	db 24, DELIBIRD
	db 26, DELIBIRD

; Skarmory swarm
	map_id ROUTE_45
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 23, SKARMORY
	db 24, SKARMORY
	db 23, GEODUDE
	db 24, GLIGAR
	db 25, DONPHAN
	db 27, SKARMORY
	db 27, SKARMORY
	; day
	db 23, SKARMORY
	db 24, SKARMORY
	db 23, GEODUDE
	db 24, GLIGAR
	db 25, DONPHAN
	db 27, SKARMORY
	db 27, SKARMORY
	; nite
	db 23, SKARMORY
	db 24, SKARMORY
	db 23, GEODUDE
	db 24, GLIGAR
	db 25, GRAVELER
	db 27, SKARMORY
	db 27, SKARMORY

; Rhyhorn swarm
	map_id VICTORY_ROAD
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 34, RHYHORN
	db 32, RHYHORN
	db 33, DONPHAN
	db 34, RHYHORN
	db 35, URSARING
	db 35, GOLBAT
	db 36, RHYDON
	; day
	db 34, RHYHORN
	db 32, RHYHORN
	db 33, DONPHAN
	db 34, RHYHORN
	db 35, URSARING
	db 35, GOLBAT
	db 36, RHYDON
	; nite
	db 34, RHYHORN
	db 32, RHYHORN
	db 33, DONPHAN
	db 34, RHYHORN
	db 35, URSARING
	db 35, GOLBAT
	db 36, RHYDON

; Mr.Mime swarm
	map_id ROUTE_21
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 27, MR__MIME
	db 25, MR__MIME
	db 35, TANGELA
	db 20, RATICATE
	db 30, TANGELA
	db 28, MR__MIME
	db 28, MR__MIME
	; day
	db 27, MR__MIME
	db 25, MR__MIME
	db 35, TANGELA
	db 20, RATICATE
	db 28, MR__MIME
	db 30, MR__MIME
	db 30, MR__MIME
	; nite
	db 27, MR__MIME
	db 25, MR__MIME
	db 35, TANGELA
	db 20, RATICATE
	db 30, TANGELA
	db 28, MR__MIME
	db 28, MR__MIME

; Raticate swarm
	map_id ROUTE_1
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 6, RATICATE
	db 8, RATICATE
	db 4, SENTRET
	db 4, PIDGEY
	db 7, RATICATE
	db 6, PIDGEY
	db 7, FURRET
	; day
	db 6, RATICATE
	db 8, RATICATE
	db 4, SENTRET
	db 4, PIDGEY
	db 7, RATICATE
	db 6, PIDGEY
	db 7, FURRET
	; nite
	db 6, RATICATE
	db 8, RATICATE
	db 4, RATTATA
	db 4, HOOTHOOT
	db 7, RATICATE
	db 6, HOOTHOOT
	db 7, HOOTHOOT

; Bulbasaur swarm
	map_id VIRIDIAN_FOREST
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 3, CATERPIE
	db 3, WEEDLE
	db 5, METAPOD
	db 5, KAKUNA
	db 8, BULBASAUR
	db 8, BULBASAUR
	db 7, PIKACHU
	; day
	db 3, CATERPIE
	db 3, WEEDLE
	db 5, METAPOD
	db 5, KAKUNA
	db 8, BULBASAUR
	db 8, BULBASAUR
	db 7, PIKACHU
	; nite
	db 3, HOOTHOOT
	db 3, HOOTHOOT
	db 5, HOOTHOOT
	db 5, NOCTOWL
	db 8, BULBASAUR
	db 8, BULBASAUR
	db 7, PIKACHU

; Charmander swarm
	map_id ROUTE_22
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 3, RATTATA
	db 3, SPEAROW
	db 5, SPEAROW
	db 4, DODUO
	db 8, CHARMANDER
	db 8, CHARMANDER
	db 6, PONYTA
	; day
	db 3, RATTATA
	db 3, SPEAROW
	db 5, SPEAROW
	db 4, DODUO
	db 8, CHARMANDER
	db 8, CHARMANDER
	db 6, PONYTA
	; nite
	db 3, RATTATA
	db 3, POLIWAG
	db 5, RATTATA
	db 4, POLIWAG
	db 8, CHARMANDER
	db 8, CHARMANDER
	db 6, PONYTA

; Clefairy swarm
	map_id MOUNT_MOON_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 8, CLEFAIRY
	db 10, CLEFAIRY
	db 12, SANDSHREW
	db 12, PARAS
	db 11, ZUBAT
	db 10, GEODUDE
	db 12, GEODUDE
	; day
	db 8, CLEFAIRY
	db 10, CLEFAIRY
	db 12, SANDSHREW
	db 12, PARAS
	db 11, ZUBAT
	db 10, GEODUDE
	db 12, GEODUDE
	; nite
	db 8, CLEFAIRY
	db 10, CLEFAIRY
	db 12, SANDSHREW
	db 12, PARAS
	db 11, ZUBAT
	db 10, GEODUDE
	db 12, CLEFAIRY

; Noctowl swarm
	map_id ROUTE_5
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 15, NOCTOWL
	db 17, NOCTOWL
	db 15, SNUBBULL
	db 12, PIDGEY
	db 14, JIGGLYPUFF
	db 14, PIDGEOTTO
	db 14, ABRA
	; day
	db 15, NOCTOWL
	db 17, NOCTOWL
	db 15, SNUBBULL
	db 12, PIDGEY
	db 14, JIGGLYPUFF
	db 14, PIDGEOTTO
	db 14, ABRA
	; nite
	db 13, NOCTOWL
	db 15, NOCTOWL
	db 13, MEOWTH
	db 12, HOOTHOOT
	db 14, JIGGLYPUFF
	db 14, NOCTOWL
	db 14, ABRA

; Abra swarm
	map_id ROUTE_6
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 10, ABRA
	db 11, ABRA
	db 17, BELLSPROUT
	db 17, MAGNEMITE
	db 12, ABRA
	db 17, SNUBBULL
	db 17, GRANBULL
	; day
	db 10, ABRA
	db 11, ABRA
	db 17, BELLSPROUT
	db 17, MAGNEMITE
	db 12, ABRA
	db 17, SNUBBULL
	db 17, GRANBULL
	; nite
	db 10, ABRA
	db 11, ABRA
	db 17, ODDISH
	db 17, MAGNEMITE
	db 12, ABRA
	db 17, MEOWTH
	db 17, PSYDUCK

; Pidgeotto swarm
	map_id ROUTE_11
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 16, PIDGEOTTO
	db 20, PIDGEOTTO
	db 20, RATICATE
	db 19, MAGNEMITE
	db 17, PIDGEOTTO
	db 18, HOPPIP
	db 18, HOPPIP
	; day
	db 16, PIDGEOTTO
	db 20, PIDGEOTTO
	db 20, RATICATE
	db 19, MAGNEMITE
	db 17, PIDGEOTTO
	db 18, HOPPIP
	db 18, HOPPIP
	; nite
	db 16, PIDGEOTTO
	db 20, PIDGEOTTO
	db 16, DROWZEE
	db 19, MAGNEMITE
	db 20, RATICATE
	db 18, HYPNO
	db 18, HYPNO

; Squirtle swarm
	map_id ROUTE_25
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 13, PIDGEY
	db 15, BELLSPROUT
	db 16, VENONAT
	db 12, ABRA
	db 8, SQUIRTLE
	db 8, SQUIRTLE
	db 16, WEEPINBELL
	; day
	db 13, PIDGEY
	db 15, BELLSPROUT
	db 16, VENONAT
	db 12, ABRA
	db 8, SQUIRTLE
	db 8, SQUIRTLE
	db 16, WEEPINBELL
	; nite
	db 13, VENONAT
	db 15, ODDISH
	db 16, VENOMOTH
	db 12, ABRA
	db 8, SQUIRTLE
	db 8, SQUIRTLE
	db 16, BELLSPROUT

; Kangaskhan swarm
	map_id ROCK_TUNNEL_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 15, KANGASKHAN
	db 16, KANGASKHAN
	db 17, MACHOP
	db 17, ZUBAT
	db 21, MACHOKE
	db 17, CUBONE
	db 19, CUBONE
	; day
	db 15, KANGASKHAN
	db 16, KANGASKHAN
	db 17, MACHOP
	db 17, ZUBAT
	db 21, MACHOKE
	db 17, CUBONE
	db 19, CUBONE
	; nite
	db 15, KANGASKHAN
	db 16, KANGASKHAN
	db 17, MACHOP
	db 17, ZUBAT
	db 21, MACHOKE
	db 17, CUBONE
	db 19, CUBONE

	map_id ROCK_TUNNEL_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 17, KANGASKHAN
	db 20, KANGASKHAN
	db 17, CUBONE
	db 18, ONIX
	db 22, KANGASKHAN
	db 20, MAROWAK
	db 22, MAROWAK
	; day
	db 17, KANGASKHAN
	db 20, KANGASKHAN
	db 17, CUBONE
	db 18, ONIX
	db 22, KANGASKHAN
	db 20, MAROWAK
	db 22, MAROWAK
	; nite
	db 17, KANGASKHAN
	db 20, KANGASKHAN
	db 17, CUBONE
	db 18, ONIX
	db 22, KANGASKHAN
	db 20, MAROWAK
	db 22, MAROWAK

; Electabuzz swarm
	map_id ROUTE_10_SOUTH
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 33, ELECTABUZZ
	db 34, ELECTABUZZ
	db 33, VOLTORB
	db 35, SPEAROW
	db 37, ELECTABUZZ
	db 33, FEAROW
	db 36, RATICATE
	; day
	db 33, ELECTABUZZ
	db 34, ELECTABUZZ
	db 33, VOLTORB
	db 35, SPEAROW
	db 37, ELECTABUZZ
	db 33, FEAROW
	db 36, RATICATE
	; nite
	db 33, ELECTABUZZ
	db 33, VOLTORB
	db 35, QUAGSIRE
	db 37, ELECTABUZZ
	db 34, ELECTABUZZ
	db 33, QUAGSIRE
	db 36, RATICATE

; Tyrogue swarm
	map_id ROUTE_8
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 19, TYROGUE
	db 16, TYROGUE
	db 22, SNUBBULL
	db 24, PIDGEOTTO
	db 18, TYROGUE
	db 20, KADABRA
	db 27, KADABRA
	; day
	db 19, TYROGUE
	db 16, TYROGUE
	db 22, SNUBBULL
	db 24, PIDGEOTTO
	db 18, TYROGUE
	db 20, KADABRA
	db 27, KADABRA
	; nite
	db 19, TYROGUE
	db 16, TYROGUE
	db 22, MEOWTH
	db 24, NOCTOWL
	db 18, TYROGUE
	db 24, HAUNTER
	db 27, KADABRA

; Grimer swarm
	map_id ROUTE_17
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 26, GRIMER
	db 28, GRIMER
	db 27, FEAROW
	db 29, GRIMER
	db 29, SLUGMA
	db 30, MUK
	db 32, MUK
	; day
	db 26, GRIMER
	db 28, GRIMER
	db 27, FEAROW
	db 29, GRIMER
	db 29, SLUGMA
	db 30, MUK
	db 32, MUK
	; nite
	db 26, GRIMER
	db 27, GRIMER
	db 28, GRIMER
	db 29, MUK
	db 29, SLUGMA
	db 30, MUK
	db 32, MUK

; Exeggcute swarm
	map_id ROUTE_15
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 26, EXEGGCUTE
	db 28, EXEGGCUTE
	db 28, NIDORINO
	db 28, NIDORINA
	db 28, HOPPIP
	db 30, HOPPIP
	db 30, CHANSEY
	; day
	db 26, EXEGGCUTE
	db 28, EXEGGCUTE
	db 28, NIDORINO
	db 28, NIDORINA
	db 28, HOPPIP
	db 30, HOPPIP
	db 30, CHANSEY
	; nite
	db 26, EXEGGCUTE
	db 28, EXEGGCUTE
	db 28, VENONAT
	db 32, NOCTOWL
	db 28, VENOMOTH
	db 30, QUAGSIRE
	db 30, CHANSEY

; Nidorina swarm
	map_id ROUTE_14
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 28, NIDORINA
	db 28, NIDORINA
	db 28, NIDORINO
	db 30, PIDGEOTTO
	db 30, NIDORINA
	db 30, SKIPLOOM
	db 30, CHANSEY
	; day
	db 28, NIDORINA
	db 28, NIDORINA
	db 28, NIDORINO
	db 30, PIDGEOTTO
	db 30, NIDORINA
	db 30, SKIPLOOM
	db 30, CHANSEY
	; nite
	db 28, NIDORINA
	db 28, NIDORINA
	db 28, QUAGSIRE
	db 30, NOCTOWL
	db 28, NIDORINO
	db 30, QUAGSIRE
	db 30, CHANSEY

; Chansey swarm
	map_id ROUTE_13
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 28, CHANSEY
	db 25, CHANSEY
	db 25, NIDORINO
	db 25, NIDORINA
	db 27, FARFETCH_D
	db 29, HOPPIP
	db 31, CHANSEY
	; day
	db 28, CHANSEY
	db 25, CHANSEY
	db 25, NIDORINO
	db 25, NIDORINA
	db 27, FARFETCH_D
	db 29, HOPPIP
	db 31, CHANSEY
	; nite
	db 28, CHANSEY
	db 25, CHANSEY
	db 25, VENONAT
	db 25, QUAGSIRE
	db 27, FARFETCH_D
	db 29, QUAGSIRE
	db 31, CHANSEY

; Jynx swarm
	map_id SEAFOAM_ISLANDS_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 32, JYNX
	db 34, JYNX
	db 34, SEEL
	db 28, PSYDUCK
	db 34, GOLDUCK
	db 28, GOLBAT
	db 29, ZUBAT
	; day
	db 32, JYNX
	db 34, JYNX
	db 34, SEEL
	db 28, PSYDUCK
	db 34, GOLDUCK
	db 28, GOLBAT
	db 29, ZUBAT
	; nite
	db 32, JYNX
	db 34, JYNX
	db 34, SEEL
	db 28, PSYDUCK
	db 34, GOLDUCK
	db 28, GOLBAT
	db 29, ZUBAT

	map_id SEAFOAM_ISLANDS_B2F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 33, JYNX
	db 35, JYNX
	db 35, SEEL
	db 30, PSYDUCK
	db 35, GOLDUCK
	db 29, GOLBAT
	db 30, ZUBAT
	; day
	db 33, JYNX
	db 35, JYNX
	db 35, SEEL
	db 30, PSYDUCK
	db 35, GOLDUCK
	db 29, GOLBAT
	db 30, ZUBAT
	; nite
	db 33, JYNX
	db 35, JYNX
	db 35, SEEL
	db 30, PSYDUCK
	db 35, GOLDUCK
	db 29, GOLBAT
	db 30, ZUBAT

	map_id SEAFOAM_ISLANDS_B3F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 36, JYNX
	db 36, JYNX
	db 36, DEWGONG
	db 36, GOLDUCK
	db 32, PSYDUCK
	db 34, SEEL
	db 32, ZUBAT
	; day
	db 36, JYNX
	db 36, JYNX
	db 36, DEWGONG
	db 36, GOLDUCK
	db 32, PSYDUCK
	db 34, SEEL
	db 32, ZUBAT
	; nite
	db 36, JYNX
	db 36, JYNX
	db 36, DEWGONG
	db 36, GOLDUCK
	db 32, PSYDUCK
	db 34, SEEL
	db 32, ZUBAT

	map_id SEAFOAM_ISLANDS_B4F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 38, JYNX
	db 36, JYNX
	db 38, DEWGONG
	db 38, GOLDUCK
	db 40, JYNX
	db 34, SEEL
	db 40, GOLBAT
	; day
	db 38, JYNX
	db 36, JYNX
	db 38, DEWGONG
	db 38, GOLDUCK
	db 40, JYNX
	db 34, SEEL
	db 40, GOLBAT
	; nite
	db 38, JYNX
	db 36, JYNX
	db 38, DEWGONG
	db 38, GOLDUCK
	db 40, JYNX
	db 34, SEEL
	db 40, GOLBAT

	db -1 ; end
