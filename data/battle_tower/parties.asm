BattleTowerMons:
; 10 groups (one per floor level) of 21 mons (BATTLETOWER_NUM_UNIQUE_MON).
	table_width NICKNAMED_MON_STRUCT_LENGTH, BattleTowerMons

; Group 1


	db YANMA
	db SCOPE_LENS
	db DOUBLE_EDGE, PSYCHIC_M, GUST, SWORDS_DANCE
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000 ; Health
	bigdw 50000 ; Attack
	bigdw 20000 ; Defense
	bigdw 60000 ; Speed
	bigdw 20000 ; Special
	dn 15, 13, 13, 15 ; DVs
	db 24, 16, 56, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 40 ; HP
	bigdw 40 ; Max HP
	bigdw 26 ; Atk
	bigdw 20 ; Def
	bigdw 33 ; Spd
	bigdw 26 ; SAtk
	bigdw 20 ; SDef
	db "SANDA-SU@@@"

	db DELIBIRD
	db NEVERMELTICE
	db DESTINY_BOND, ICE_BEAM, BODY_SLAM, PRESENT 
	dw 0 ; OT ID
	dt 800 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 25000
	bigdw 20000
	bigdw 60000
	bigdw 50000
	dn 14, 11, 15, 15 ; DVs
	db 8, 16, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 33 ; HP
	bigdw 33 ; Max HP
	bigdw 22 ; Atk
	bigdw 19 ; Def
	bigdw 38 ; Spd
	bigdw 26 ; SAtk
	bigdw 22 ; SDef
	db "E-HUi@@@@@@"

	db SKARMORY
	db LEFTOVERS
	db ICY_WIND, CURSE, REST, STEEL_WING
	dw 0 ; OT ID
	dt 1250 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 60000
	bigdw 20000
	bigdw 40000
	dn 7, 15, 15, 11 ; DVs
	db 24, 16, 16, 40 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 41 ; HP
	bigdw 41 ; Max HP
	bigdw 26 ; Atk
	bigdw 42 ; Def
	bigdw 24 ; Spd
	bigdw 21 ; SAtk
	bigdw 27 ; SDef
	db "BURAtuKI-@@"

	db CLEFABLE
	db SITRUS_BERRY
	db RETURN, MOONLIGHT, ICY_WIND, SING 
	dw 0 ; OT ID
	dt 800 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 25000
	bigdw 20000
	bigdw 30000
	bigdw 40000
	dn 11, 15, 10, 11 ; DVs
	db 32, 8, 24, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 47 ; HP
	bigdw 47 ; Max HP
	bigdw 25 ; Atk
	bigdw 26 ; Def
	bigdw 23 ; Spd
	bigdw 31 ; SAtk
	bigdw 30 ; SDef
	db "SO-NANSU@@@"

	db WIGGLYTUFF
	db CHARCOAL
	db SING, FLAMETHROWER, RETURN, SELFDESTRUCT
	dw 0 ; OT ID
	dt 800 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 25000
	bigdw 20000
	bigdw 30000
	bigdw 40000
	dn 11, 15, 10, 11 ; DVs
	db 24, 24, 32, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 56 ; HP
	bigdw 56 ; Max HP
	bigdw 25 ; Atk
	bigdw 20 ; Def
	bigdw 20 ; Spd
	bigdw 29 ; SAtk
	bigdw 22 ; SDef
	db "GARU-RA@@@@"

	db FARFETCH_D
	db STICK
	db BODY_SLAM, SWORDS_DANCE, MUD_SLAP, DOUBLE_TEAM 
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 50000
	bigdw 20000
	bigdw 20000
	bigdw 10000
	dn 13, 13, 11, 13 ; DVs
	db 24, 48, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 38 ; HP
	bigdw 38 ; Max HP
	bigdw 31 ; Atk
	bigdw 22 ; Def
	bigdw 23 ; Spd
	bigdw 21 ; SAtk
	bigdw 22 ; SDef
	db "SANI-GO@@@@"

	db KANGASKHAN
	db SILK_SCARF
	db GROWL, RETURN, REST, SLEEP_TALK 
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 50000
	bigdw 20000
	bigdw 20000
	bigdw 30000
	dn 15, 15, 11, 11 ; DVs
	db 61, 32, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 50 ; HP
	bigdw 50 ; Max HP
	bigdw 32 ; Atk
	bigdw 27 ; Def
	bigdw 28 ; Spd
	bigdw 19 ; SAtk
	bigdw 27 ; SDef
	db "MIRUTANKU@@"

	db TAUROS
	db SILK_SCARF
	db DOUBLE_EDGE, SURF, THIEF, HYPER_BEAM
	dw 0 ; OT ID
	dt 1250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 30000
	bigdw 60000
	bigdw 20000
	dn 15, 15, 9, 15 ; DVs
	db 24, 24, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 44 ; HP
	bigdw 44 ; Max HP
	bigdw 34 ; Atk
	bigdw 31 ; Def
	bigdw 35 ; Spd
	bigdw 18 ; SAtk
	bigdw 24 ; SDef
	db "PUTERA@@@@@"

	db RAICHU
	db MAGNET
	db THUNDERBOLT, DYNAMICPUNCH, ENCORE, THUNDER_WAVE 
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 45000
	bigdw 25000
	bigdw 40000
	bigdw 30000
	dn 15, 12, 15, 13 ; DVs
	db 24, 8, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 40 ; HP
	bigdw 40 ; Max HP
	bigdw 31 ; Atk
	bigdw 22 ; Def
	bigdw 34 ; Spd
	bigdw 30 ; SAtk
	bigdw 28 ; SDef
	db "RAPURASU@@@"

	db SNEASEL
	db LUM_BERRY
	db FRUSTRATION, LOW_KICK, PURSUIT, SWORDS_DANCE
	dw 0 ; OT ID
	dt 560 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 55000
	bigdw 20000
	bigdw 60000
	bigdw 50000
	dn 15, 11, 11, 15 ; DVs
	db 32, 32, 32, 48 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 37 ; HP
	bigdw 37 ; Max HP
	bigdw 32 ; Atk
	bigdw 21 ; Def
	bigdw 37 ; Spd
	bigdw 19 ; SAtk
	bigdw 27 ; SDef
	db "NIyu-RA@@@@"

	db STARMIE
	db LUM_BERRY
	db SURF, PSYCHIC_M, THUNDERBOLT, ICE_BEAM
	dw 0 ; OT ID
	dt 1250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 30000
	bigdw 40000
	bigdw 60000
	bigdw 40000
	dn 14, 11, 15, 15 ; DVs
	db 24, 16, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 39 ; HP
	bigdw 39 ; Max HP
	bigdw 27 ; Atk
	bigdw 29 ; Def
	bigdw 37 ; Spd
	bigdw 33 ; SAtk
	bigdw 30 ; SDef
	db "PORIGON2@@@"

	db FLAREON
	db BRIGHTPOWDER
	db SUBSTITUTE, FIRE_BLAST, DOUBLE_EDGE, MUD_SLAP
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 30000
	bigdw 40000
	bigdw 40000
	bigdw 60000
	dn 15, 15, 11, 9 ; DVs
	db 16, 8, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 42 ; HP
	bigdw 42 ; Max HP
	bigdw 38 ; Atk
	bigdw 25 ; Def
	bigdw 24 ; Spd
	bigdw 32 ; SAtk
	bigdw 36 ; SDef
	db "MUUMA@@@@@@"

	db JOLTEON
	db MAGNET
	db THUNDERBOLT, SHADOW_BALL, THUNDER_WAVE, ROAR 
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 25000
	bigdw 20000
	bigdw 60000
	bigdw 50000
	dn 14, 11, 15, 15 ; DVs
	db 24, 24, 32, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 37 ; HP
	bigdw 37 ; Max HP
	bigdw 24 ; Atk
	bigdw 22 ; Def
	bigdw 39 ; Spd
	bigdw 15 ; SAtk
	bigdw 33 ; SDef
	db "DERUBIRU@@@"

	db LICKITUNG
	db SILK_SCARF
	db MEGA_PUNCH, IRON_TAIL, FLAMETHROWER, HYPER_BEAM
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 40000
	bigdw 40000
	bigdw 20000
	bigdw 20000
	dn 15, 15, 9, 11 ; DVs
	db 32, 24, 24, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 47 ; HP
	bigdw 47 ; Max HP
	bigdw 24 ; Atk
	bigdw 28 ; Def
	bigdw 16 ; Spd
	bigdw 22 ; SAtk
	bigdw 25 ; SDef
	db "KIRINRIKI@@"

	db SLOWKING
	db LEFTOVERS
	db FUTURE_SIGHT, SURF, PSYCHIC_M, ICY_WIND 
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 20000
	bigdw 40000
	bigdw 10000
	bigdw 60000
	dn 15, 7, 15, 1 ; DVs
	db 10, 24, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 48 ; HP
	bigdw 48 ; Max HP
	bigdw 24 ; Atk
	bigdw 29 ; Def
	bigdw 13 ; Spd
	bigdw 34 ; SAtk
	bigdw 36 ; SDef
	db "HAPINASU@@@"

	db GIRAFARIG
	db TWISTEDSPOON
	db PSYCHIC_M, DOUBLE_EDGE, LOW_KICK, SHADOW_BALL
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 20000
	bigdw 40000
	bigdw 50000
	dn 15, 9, 15, 15 ; DVs
	db 16, 24, 32, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 41 ; HP
	bigdw 41 ; Max HP
	bigdw 29 ; Atk
	bigdw 23 ; Def
	bigdw 30 ; Spd
	bigdw 31 ; SAtk
	bigdw 26 ; SDef
	db "KABIGON@@@@"

	db SUDOWOODO
	db HARD_STONE
	db LOW_KICK, FLAIL, EXPLOSION, ROCK_SLIDE
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 60000
	bigdw 60000
	bigdw 20000
	bigdw 20000
	dn 15, 15, 9, 9 ; DVs
	db 32, 24, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 37 ; HP
	bigdw 37 ; Max HP
	bigdw 31 ; Atk
	bigdw 33 ; Def
	bigdw 15 ; Spd
	bigdw 15 ; SAtk
	bigdw 21 ; SDef
	db "NAtuSI-@@@@"

	db AIPOM
	db SILK_SCARF
	db DOUBLE_EDGE, BATON_PASS, DOUBLE_TEAM, PURSUIT
	dw 0 ; OT ID
	dt 800 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 60000
	bigdw 40000
	bigdw 60000
	bigdw 30000
	dn 15, 12, 11, 14 ; DVs
	db 24, 61, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 36 ; HP
	bigdw 36 ; Max HP
	bigdw 28 ; Atk
	bigdw 23 ; Def
	bigdw 30 ; Spd
	bigdw 19 ; SAtk
	bigdw 22 ; SDef
	db "HERAKUROSU@"

	db SUNFLORA
	db MIRACLE_SEED
	db GIGA_DRAIN, PSYCHIC_M, GROWTH, HIDDEN_POWER ; HP = FIRE
	dw 0 ; OT ID
	dt 560 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 20000
	bigdw 20000
	bigdw 20000
	bigdw 50000
	dn 10, 12, 14, 13 ; DVs
	db 8, 16, 61, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 38 ; HP
	bigdw 38 ; Max HP
	bigdw 25 ; Atk
	bigdw 21 ; Def
	bigdw 17 ; Spd
	bigdw 34 ; SAtk
	bigdw 30 ; SDef
	db "ANNO-N@@@@@"

	db WOBBUFFET
	db SITRUS_BERRY
	db COUNTER, MIRROR_COAT, SAFEGUARD, DESTINY_BOND
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 20000
	bigdw 40000
	bigdw 20000
	bigdw 50000
	dn 13, 13, 11, 11 ; DVs
	db 32, 32, 40, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 67 ; HP
	bigdw 67 ; Max HP
	bigdw 17 ; Atk
	bigdw 24 ; Def
	bigdw 17 ; Spd
	bigdw 19 ; SAtk
	bigdw 24 ; SDef
	db "KENTAROSU@@"

	db VAPOREON
	db MYSTIC_WATER
	db SURF, SHADOW_BALL, MUD_SLAP, TOXIC 
	dw 0 ; OT ID
	dt 1000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 30000
	bigdw 30000
	bigdw 20000
	bigdw 50000
	dn 13, 13, 11, 13 ; DVs
	db 24, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 55 ; HP
	bigdw 55 ; Max HP
	bigdw 24 ; Atk
	bigdw 23 ; Def
	bigdw 23 ; Spd
	bigdw 34 ; SAtk
	bigdw 31 ; SDef
	db "BARIYA-DO@@"

	
	; Group 2
	
	db RATICATE
	db FOCUS_BAND
	db FOCUS_ENERGY, RETURN, REVERSAL, BITE 
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 40000
	dn 15, 15, 11, 15 ; DVs
	db 48, 32, 24, 40 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 68 ; HP
	bigdw 68 ; Max HP
	bigdw 54 ; Atk
	bigdw 46 ; Def
	bigdw 61 ; Spd
	bigdw 39 ; SAtk
	bigdw 47 ; SDef
	db "BURAtuKI-@@"

	db FEAROW
	db BRIGHTPOWDER
	db PURSUIT, TRI_ATTACK, MUD_SLAP, DOUBLE_TEAM
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 40000
	dn 15, 11, 13, 12 ; DVs
	db 32, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 71 ; HP
	bigdw 71 ; Max HP
	bigdw 58 ; Atk
	bigdw 46 ; Def
	bigdw 61 ; Spd
	bigdw 44 ; SAtk
	bigdw 44 ; SDef
	db "SUTA-MI-@@@"

	db FEAROW
	db LEFTOVERS
	db REST, SLEEP_TALK, DOUBLE_EDGE, CURSE
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 40000
	dn 15, 11, 13, 12 ; DVs
	db 16, 16, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 71 ; HP
	bigdw 71 ; Max HP
	bigdw 58 ; Atk
	bigdw 46 ; Def
	bigdw 61 ; Spd
	bigdw 44 ; SAtk
	bigdw 44 ; SDef
	db "GIyaRADOSU@"

	db DUNSPARCE
	db SILK_SCARF
	db FIRE_BLAST, EARTHQUAKE, AGILITY, RETURN
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 50000
	bigdw 30000
	bigdw 60000
	dn 15, 15, 13, 11 ; DVs
	db 8, 16, 48, 32 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 88 ; HP
	bigdw 88 ; Max HP
	bigdw 51 ; Atk
	bigdw 50 ; Def
	bigdw 36 ; Spd
	bigdw 48 ; SAtk
	bigdw 48 ; SDef
	db "HAGANE-RU@@"

	db GLIGAR
	db SOFT_SAND
	db ROCK_SLIDE, WING_ATTACK, EARTHQUAKE, SWORDS_DANCE
	dw 0 ; OT ID
	dt 5460 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 55000
	bigdw 40000
	dn 13, 15, 13, 13 ; DVs
	db 16, 56, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 72 ; HP
	bigdw 72 ; Max HP
	bigdw 51 ; Atk
	bigdw 64 ; Def
	bigdw 55 ; Spd
	bigdw 34 ; SAtk
	bigdw 46 ; SDef
	db "HU-DEiN@@@@"

	db QWILFISH
	db POISON_BARB
	db SURF, EXPLOSION, THUNDER_WAVE, SLUDGE_BOMB
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 60000
	bigdw 30000
	bigdw 60000
	bigdw 40000
	dn 15, 11, 15, 15 ; DVs
	db 24, 8, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 70 ; HP
	bigdw 70 ; Max HP
	bigdw 61 ; Atk
	bigdw 52 ; Def
	bigdw 57 ; Spd
	bigdw 43 ; SAtk
	bigdw 43 ; SDef
	db "UINDEi@@@@@"

	db CORSOLA
	db MYSTIC_WATER
	db EXPLOSION, SURF, EARTHQUAKE, RECOVER
	dw 0 ; OT ID
	dt 6400 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 60000
	bigdw 50000
	bigdw 20000
	bigdw 50000
	dn 13, 13, 11, 13 ; DVs
	db 8, 24, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 63 ; HP
	bigdw 63 ; Max HP
	bigdw 54 ; Atk
	bigdw 53 ; Def
	bigdw 32 ; Spd
	bigdw 48 ; SAtk
	bigdw 49 ; SDef
	db "HERAKUROSU@"

	db DELIBIRD
	db NO_ITEM
	db PRESENT, ICE_BEAM, THIEF, DESTINY_BOND
	dw 0 ; OT ID
	dt 6400 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 13, 13, 14, 13 ; DVs
	db 24, 16, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 62 ; HP
	bigdw 62 ; Max HP
	bigdw 40 ; Atk
	bigdw 36 ; Def
	bigdw 48 ; Spd
	bigdw 45 ; SAtk
	bigdw 37 ; SDef
	db "NAtuSI-@@@@"

	db STANTLER
	db SILK_SCARF
	db HYPNOSIS, DOUBLE_EDGE, MEGAHORN, SHADOW_BALL 
	dw 0 ; OT ID
	dt 10000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 20000
	bigdw 60000
	bigdw 50000
	dn 15, 13, 15, 13 ; DVs
	db 32, 24, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 73 ; HP
	bigdw 73 ; Max HP
	bigdw 60 ; Atk
	bigdw 42 ; Def
	bigdw 56 ; Spd
	bigdw 56 ; SAtk
	bigdw 48 ; SDef
	db "PUTERA@@@@@"

	db HITMONLEE
	db BLACKBELT_I
	db HI_JUMP_KICK, ROCK_SLIDE, EARTHQUAKE, SWORDS_DANCE 
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 20000
	bigdw 60000
	bigdw 50000
	dn 15, 13, 15, 13 ; DVs
	db 48, 32, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 64 ; HP
	bigdw 64 ; Max HP
	bigdw 70 ; Atk
	bigdw 38 ; Def
	bigdw 57 ; Spd
	bigdw 36 ; SAtk
	bigdw 66 ; SDef
	db "HAPINASU@@@"

	db HITMONCHAN
	db BLACKBELT_I
	db MACH_PUNCH, COUNTER, EARTHQUAKE, ICE_PUNCH
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 20000
	bigdw 60000
	bigdw 50000
	dn 15, 13, 15, 13 ; DVs
	db 48, 32, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 64 ; HP
	bigdw 64 ; Max HP
	bigdw 64 ; Atk
	bigdw 48 ; Def
	bigdw 52 ; Spd
	bigdw 36 ; SAtk
	bigdw 66 ; SDef
	db "RAPURASU@@@"

	db LICKITUNG
	db LEFTOVERS
	db FIRE_BLAST, SEISMIC_TOSS, REST, SLEEP_TALK 
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 30000
	bigdw 50000
	bigdw 10000
	bigdw 30000
	dn 13, 13, 11, 13 ; DVs
	db 8, 32, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 84 ; HP
	bigdw 84 ; Max HP
	bigdw 41 ; Atk
	bigdw 51 ; Def
	bigdw 27 ; Spd
	bigdw 42 ; SAtk
	bigdw 48 ; SDef
	db "PIKATIyuU@@"

	db MR__MIME
	db TWISTEDSPOON
	db PSYCHIC_M, CONFUSE_RAY, MIMIC, SHADOW_BALL 
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 20000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 11, 15, 15, 11 ; DVs
	db 16, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 62 ; HP
	bigdw 62 ; Max HP
	bigdw 34 ; Atk
	bigdw 49 ; Def
	bigdw 57 ; Spd
	bigdw 63 ; SAtk
	bigdw 71 ; SDef
	db "HAtuSAMU@@@"

	db TOGETIC
	db SITRUS_BERRY
	db CHARM, ENCORE, RETURN, METRONOME 
	dw 0 ; OT ID
	dt 6400 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 32, 8, 32, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 70 ; HP
	bigdw 70 ; Max HP
	bigdw 39 ; Atk
	bigdw 57 ; Def
	bigdw 39 ; Spd
	bigdw 55 ; SAtk
	bigdw 65 ; SDef
	db "EBIWARA-@@@"

	db GYARADOS
	db MYSTIC_WATER
	db DOUBLE_EDGE, ICE_BEAM, EARTHQUAKE, SURF
	dw 0 ; OT ID
	dt 10000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 40000
	bigdw 40000
	bigdw 30000
	dn 15, 11, 15, 13 ; DVs
	db 24, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 86 ; HP
	bigdw 86 ; Max HP
	bigdw 73 ; Atk
	bigdw 51 ; Def
	bigdw 52 ; Spd
	bigdw 43 ; SAtk
	bigdw 59 ; SDef
	db "KENTAROSU@@"

	db GYARADOS
	db KINGS_ROCK
	db SUBSTITUTE, RETURN, THUNDER_WAVE, WATERFALL 
	dw 0 ; OT ID
	dt 10000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 40000
	bigdw 40000
	bigdw 30000
	dn 15, 11, 15, 13 ; DVs
	db 16, 32, 32, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 86 ; HP
	bigdw 86 ; Max HP
	bigdw 73 ; Atk
	bigdw 51 ; Def
	bigdw 52 ; Spd
	bigdw 43 ; SAtk
	bigdw 59 ; SDef
	db "MARIRURI@@@"

	db LAPRAS
	db LUM_BERRY
	db SURF, SING, BODY_SLAM, ICE_BEAM 
	dw 0 ; OT ID
	dt 10000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 30000
	bigdw 60000
	bigdw 30000
	bigdw 60000
	dn 11, 15, 15, 13 ; DVs
	db 24, 24, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 100 ; HP
	bigdw 100 ; Max HP
	bigdw 52 ; Atk
	bigdw 55 ; Def
	bigdw 42 ; Spd
	bigdw 57 ; SAtk
	bigdw 61 ; SDef
	db "MIRUTANKU@@"

	db FURRET
	db SILK_SCARF
	db RETURN, THUNDER, BLIZZARD, QUICK_ATTACK
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 60000
	bigdw 30000
	bigdw 60000
	bigdw 50000
	dn 15, 11, 12, 13 ; DVs
	db 32, 16, 8, 48 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 80 ; HP
	bigdw 80 ; Max HP
	bigdw 53 ; Atk
	bigdw 43 ; Def
	bigdw 58 ; Spd
	bigdw 39 ; SAtk
	bigdw 43 ; SDef
	db "PUKURIN@@@@"

	db NOCTOWL
	db SPELL_TAG
	db RETURN, SHADOW_BALL, REST, SLEEP_TALK 
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 20000
	bigdw 50000
	dn 15, 13, 13, 13 ; DVs
	db 32, 24, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 88 ; HP
	bigdw 88 ; Max HP
	bigdw 43 ; Atk
	bigdw 42 ; Def
	bigdw 50 ; Spd
	bigdw 56 ; SAtk
	bigdw 59 ; SDef
	db "PUKURIN@@@@"

	db PIKACHU
	db LIGHT_BALL
	db THUNDER, IRON_TAIL, DOUBLE_TEAM, HIDDEN_POWER ; HP = ICE
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 13, 15, 11 ; DVs
	db 16, 24, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 62 ; HP
	bigdw 62 ; Max HP
	bigdw 45 ; Atk
	bigdw 39 ; Def
	bigdw 57 ; Spd
	bigdw 43 ; SAtk
	bigdw 43 ; SDef
	db "NIDOKINGU@@"

	db QUAGSIRE
	db LEFTOVERS
	db SURF, EARTHQUAKE, ICY_WIND, RECOVER
	dw 0 ; OT ID
	dt 8000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 30000
	bigdw 60000
	bigdw 10000
	bigdw 30000
	dn 13, 13, 11, 13 ; DVs
	db 24, 16, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 86 ; HP
	bigdw 86 ; Max HP
	bigdw 52 ; Atk
	bigdw 57 ; Def
	bigdw 27 ; Spd
	bigdw 44 ; SAtk
	bigdw 44 ; SDef
	db "NUO-@@@@@@@"

	
	; Group 3
	
	db CLEFABLE
	db SITRUS_BERRY
	db MOONLIGHT, BELLY_DRUM, RETURN, FLAMETHROWER 
	dw 0 ; OT ID
	dt 21600 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 40000
	bigdw 20000
	bigdw 30000
	dn 15, 14, 12, 13 ; DVs
	db 8, 16, 32, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 121 ; HP
	bigdw 121 ; Max HP
	bigdw 74 ; Atk
	bigdw 72 ; Def
	bigdw 59 ; Spd
	bigdw 76 ; SAtk
	bigdw 79 ; SDef
	db "SANDA-SU@@@"

	db BELLOSSOM
	db MIRACLE_SEED
	db SLEEP_POWDER, SYNTHESIS, GIGA_DRAIN, SLUDGE_BOMB
	dw 0 ; OT ID
	dt 21760 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 20000
	bigdw 40000
	bigdw 40000
	bigdw 60000
	dn 11, 15, 15, 9 ; DVs
	db 24, 8, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 109 ; HP
	bigdw 109 ; Max HP
	bigdw 70 ; Atk
	bigdw 87 ; Def
	bigdw 55 ; Spd
	bigdw 86 ; SAtk
	bigdw 92 ; SDef
	db "NIyoROBON@@"

	db JUMPLUFF
	db LEFTOVERS
	db SUBSTITUTE, LEECH_SEED, SLEEP_POWDER, DOUBLE_TEAM
	dw 0 ; OT ID
	dt 21760 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 60000
	bigdw 40000
	dn 11, 15, 15, 15 ; DVs
	db 16, 16, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 106 ; HP
	bigdw 106 ; Max HP
	bigdw 57 ; Atk
	bigdw 71 ; Def
	bigdw 98 ; Spd
	bigdw 62 ; SAtk
	bigdw 86 ; SDef
	db "SUTA-MI-@@@"

	db SLOWBRO
	db TWISTEDSPOON
	db SURF, FUTURE_SIGHT, THUNDER_WAVE, FIRE_BLAST
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 30000
	bigdw 40000
	bigdw 10000
	bigdw 50000
	dn 9, 15, 15, 9 ; DVs
	db 24, 24, 32, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 124 ; HP
	bigdw 124 ; Max HP
	bigdw 68 ; Atk
	bigdw 95 ; Def
	bigdw 35 ; Spd
	bigdw 90 ; SAtk
	bigdw 78 ; SDef
	db "RU-ZIyuRA@@"

	db MAGNETON
	db MAGNET
	db THUNDERBOLT, SCREECH, THUNDER_WAVE, EXPLOSION
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 50000
	bigdw 40000
	bigdw 60000
	dn 15, 11, 14, 13 ; DVs
	db 24, 61, 32, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 93 ; HP
	bigdw 93 ; Max HP
	bigdw 68 ; Atk
	bigdw 85 ; Def
	bigdw 69 ; Spd
	bigdw 103 ; SAtk
	bigdw 73 ; SDef
	db "DAGUTORIO@@"

	db MAGNETON
	db MAGNET
	db THUNDER, RAIN_DANCE, HIDDEN_POWER, EXPLOSION ; HP = WATER
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 50000
	bigdw 40000
	bigdw 60000
	dn 14, 13, 14, 13 ; DVs
	db 16, 8, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 88 ; HP
	bigdw 88 ; Max HP
	bigdw 67 ; Atk
	bigdw 86 ; Def
	bigdw 69 ; Spd
	bigdw 103 ; SAtk
	bigdw 73 ; SDef
	db "KIREIHANA@@"

	db KINGLER
	db LUM_BERRY
	db SWORDS_DANCE, METAL_CLAW, DOUBLE_EDGE, ROCK_SLIDE 
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	dn 15, 15, 12, 11 ; DVs
	db 48, 56, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 96 ; HP
	bigdw 96 ; Max HP
	bigdw 110 ; Atk
	bigdw 99 ; Def
	bigdw 71 ; Spd
	bigdw 59 ; SAtk
	bigdw 59 ; SDef
	db "HAPINASU@@@"

	db ELECTRODE
	db NO_ITEM
	db ZAP_CANNON, EXPLOSION, THIEF, TOXIC 
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 40000
	bigdw 60000
	bigdw 60000
	dn 11, 11, 15, 15 ; DVs
	db 8, 8, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 100 ; HP
	bigdw 100 ; Max HP
	bigdw 59 ; Atk
	bigdw 68 ; Def
	bigdw 126 ; Spd
	bigdw 80 ; SAtk
	bigdw 80 ; SDef
	db "HERUGA-@@@@"

	db MAROWAK
	db THICK_CLUB
	db SWORDS_DANCE, EARTHQUAKE, ROCK_SLIDE, LOW_KICK 
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 60000
	bigdw 20000
	bigdw 30000
	dn 15, 15, 15, 11 ; DVs
	db 48, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 100 ; HP
	bigdw 100 ; Max HP
	bigdw 80 ; Atk
	bigdw 98 ; Def
	bigdw 49 ; Spd
	bigdw 56 ; SAtk
	bigdw 74 ; SDef
	db "KAIRIKI-@@@"

	db HITMONTOP
	db BLACKBELT_I
	db HI_JUMP_KICK, PURSUIT, EARTHQUAKE, DOUBLE_TEAM
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 60000
	bigdw 20000
	bigdw 30000
	dn 14, 15, 12, 13 ; DVs
	db 32, 32, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 93 ; HP
	bigdw 93 ; Max HP
	bigdw 89 ; Atk
	bigdw 89 ; Def
	bigdw 65 ; Spd
	bigdw 46 ; SAtk
	bigdw 91 ; SDef
	db "KUROBAtuTO@"

	db MR__MIME
	db TWISTEDSPOON
	db PSYCHIC_M, ENCORE, SHADOW_BALL, FIRE_PUNCH 
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 20000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 13, 13, 15, 15 ; DVs
	db 16, 8, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 88 ; HP
	bigdw 88 ; Max HP
	bigdw 70 ; Atk
	bigdw 70 ; Def
	bigdw 86 ; Spd
	bigdw 92 ; SAtk
	bigdw 104 ; SDef
	db "PORIGON2@@@"

	db SCYTHER
	db SILK_SCARF
	db WING_ATTACK, AGILITY, BATON_PASS, DOUBLE_EDGE 
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 60000
	bigdw 40000
	bigdw 60000
	bigdw 10000
	dn 15, 14, 14, 15 ; DVs
	db 56, 48, 61, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 100 ; HP
	bigdw 100 ; Max HP
	bigdw 98 ; Atk
	bigdw 76 ; Def
	bigdw 95 ; Spd
	bigdw 53 ; SAtk
	bigdw 68 ; SDef
	db "GARAGARA@@@"

	db ARIADOS
	db LUM_BERRY
	db NIGHT_SHADE, TOXIC, GIGA_DRAIN, PSYCHIC_M 
	dw 0 ; OT ID
	dt 21600 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 40000
	bigdw 30000
	bigdw 60000
	dn 15, 14, 11, 13 ; DVs
	db 24, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 103 ; HP
	bigdw 103 ; Max HP
	bigdw 86 ; Atk
	bigdw 70 ; Def
	bigdw 49 ; Spd
	bigdw 68 ; SAtk
	bigdw 68 ; SDef
	db "MARUMAIN@@@"

	db ARIADOS
	db SILVERPOWDER
	db SWORDS_DANCE, MEGAHORN, RETURN, PURSUIT  
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 40000
	bigdw 30000
	bigdw 60000
	dn 15, 14, 11, 13 ; DVs
	db 48, 16, 32, 32 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 103 ; HP
	bigdw 103 ; Max HP
	bigdw 86 ; Atk
	bigdw 70 ; Def
	bigdw 49 ; Spd
	bigdw 68 ; SAtk
	bigdw 68 ; SDef
	db "RAPURASU@@@"

	db ARBOK
	db BRIGHTPOWDER
	db CRUNCH, PURSUIT, IRON_TAIL, SLUDGE_BOMB 
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 40000
	bigdw 40000
	bigdw 30000
	dn 15, 15, 11, 13 ; DVs
	db 24, 32, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 103 ; HP
	bigdw 103 ; Max HP
	bigdw 89 ; Atk
	bigdw 70 ; Def
	bigdw 75 ; Spd
	bigdw 63 ; SAtk
	bigdw 71 ; SDef
	db "RANTA-N@@@@"

	db VILEPLUME
	db MIRACLE_SEED
	db SWORDS_DANCE, SLUDGE_BOMB, GIGA_DRAIN, SWAGGER
	dw 0 ; OT ID
	dt 21760 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 30000
	bigdw 40000
	bigdw 50000
	dn 15, 11, 14, 14 ; DVs
	db 48, 16, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 110 ; HP
	bigdw 110 ; Max HP
	bigdw 80 ; Atk
	bigdw 75 ; Def
	bigdw 58 ; Spd
	bigdw 96 ; SAtk
	bigdw 84 ; SDef
	db "E-HUi@@@@@@"

	db PARASECT
	db MIRACLE_SEED
	db SPORE, LEECH_SEED, GIGA_DRAIN, SLUDGE_BOMB
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 30000
	bigdw 40000
	bigdw 50000
	dn 15, 12, 15, 11 ; DVs
	db 24, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 100 ; HP
	bigdw 100 ; Max HP
	bigdw 89 ; Atk
	bigdw 73 ; Def
	bigdw 44 ; Spd
	bigdw 66 ; SAtk
	bigdw 78 ; SDef
	db "DOKUKURAGE@"

	db POLIWRATH
	db BLACKBELT_I
	db DYNAMICPUNCH, SURF, ICY_WIND, HYPNOSIS 
	dw 0 ; OT ID
	dt 21760 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 8, 24, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 121 ; HP
	bigdw 121 ; Max HP
	bigdw 89 ; Atk
	bigdw 89 ; Def
	bigdw 74 ; Spd
	bigdw 74 ; SAtk
	bigdw 86 ; SDef
	db "GENGA-@@@@@"

	db VICTREEBEL
	db SITRUS_BERRY
	db SLEEP_POWDER, SLUDGE_BOMB, GIGA_DRAIN, REFLECT
	dw 0 ; OT ID
	dt 21760 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 15, 13, 13, 15 ; DVs
	db 24, 16, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 115 ; HP
	bigdw 115 ; Max HP
	bigdw 95 ; Atk
	bigdw 68 ; Def
	bigdw 68 ; Spd
	bigdw 87 ; SAtk
	bigdw 69 ; SDef
	db "RINGUMA@@@@"

	db FARFETCH_D
	db STICK
	db RETURN, FEINT_ATTACK, QUICK_ATTACK, SWORDS_DANCE 
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	dn 13, 13, 11, 13 ; DVs
	db 32, 32, 48, 48 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 97 ; HP
	bigdw 66 ; Max HP
	bigdw 81 ; Atk
	bigdw 60 ; Def
	bigdw 66 ; Spd
	bigdw 61 ; SAtk
	bigdw 63 ; SDef
	db "ONIDORIRU@@"

	db DUGTRIO
	db SOFT_SAND
	db EARTHQUAKE, ROCK_SLIDE, BEAT_UP, TOXIC
	dw 0 ; OT ID
	dt 27000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 50000
	bigdw 60000
	bigdw 40000
	dn 15, 13, 11, 15 ; DVs
	db 16, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 88 ; HP
	bigdw 88 ; Max HP
	bigdw 92 ; Atk
	bigdw 59 ; Def
	bigdw 104 ; Spd
	bigdw 56 ; SAtk
	bigdw 68 ; SDef
	db "OKORIZARU@@"

	
	; Group 4
	
	db MAGMAR
	db CHARCOAL
	db FLAMETHROWER, CROSS_CHOP, CONFUSE_RAY, THUNDERPUNCH 
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 40000
	bigdw 60000
	bigdw 50000
	dn 13, 13, 11, 13 ; DVs
	db 24, 8, 16, 13 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 127 ; HP
	bigdw 127 ; Max HP
	bigdw 116 ; Atk
	bigdw 79 ; Def
	bigdw 114 ; Spd
	bigdw 119 ; SAtk
	bigdw 107 ; SDef
	db "KENTAROSU@@"

	db DEWGONG
	db SCOPE_LENS
	db ENCORE, ICE_BEAM, SURF, PERISH_SONG
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 20000
	bigdw 40000
	bigdw 40000
	bigdw 50000
	dn 9, 12, 15, 13 ; DVs
	db 8, 16, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 150 ; HP
	bigdw 150 ; Max HP
	bigdw 82 ; Atk
	bigdw 98 ; Def
	bigdw 91 ; Spd
	bigdw 95 ; SAtk
	bigdw 115 ; SDef
	db "KINGUDORA@@"

	db HYPNO
	db LEFTOVERS
	db SEISMIC_TOSS, PSYCHIC_M, SLEEP_TALK, REST 
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 10000
	bigdw 40000
	bigdw 20000
	bigdw 60000
	dn 13, 13, 11, 13 ; DVs
	db 32, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 154 ; HP
	bigdw 154 ; Max HP
	bigdw 80 ; Atk
	bigdw 93 ; Def
	bigdw 83 ; Spd
	bigdw 99 ; SAtk
	bigdw 133 ; SDef
	db "KABIGON@@@@"

	db EXEGGUTOR
	db TWISTEDSPOON
	db GIGA_DRAIN, PSYCHIC_M, EXPLOSION, LOW_KICK
	dw 0 ; OT ID
	dt 80000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	dn 14, 11, 15, 13 ; DVs
	db 8, 16, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 151 ; HP
	bigdw 151 ; Max HP
	bigdw 114 ; Atk
	bigdw 101 ; Def
	bigdw 76 ; Spd
	bigdw 139 ; SAtk
	bigdw 99 ; SDef
	db "RAPURASU@@@"

	db WEEZING
	db POISON_BARB
	db SLUDGE_BOMB, FIRE_BLAST, SHADOW_BALL, EXPLOSION 
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 60000
	bigdw 20000
	bigdw 40000
	dn 15, 15, 11, 13 ; DVs
	db 16, 8, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 134 ; HP
	bigdw 134 ; Max HP
	bigdw 111 ; Atk
	bigdw 137 ; Def
	bigdw 77 ; Spd
	bigdw 101 ; SAtk
	bigdw 89 ; SDef
	db "HAGANE-RU@@"

	db BUTTERFREE
	db NO_ITEM
	db PSYCHIC_M, SLEEP_POWDER, CHARM, THIEF
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 20000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	dn 13, 11, 12, 13 ; DVs
	db 16, 24, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 133 ; HP
	bigdw 133 ; Max HP
	bigdw 65 ; Atk
	bigdw 71 ; Def
	bigdw 93 ; Spd
	bigdw 106 ; SAtk
	bigdw 98 ; SDef
	db "HU-DEiN@@@@"

	db TYPHLOSION
	db CHARCOAL
	db FIRE_BLAST, SHADOW_BALL, LOW_KICK, THUNDERPUNCH
	dw 0 ; OT ID
	dt 56660 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 60000
	bigdw 60000
	dn 15, 11, 15, 15 ; DVs
	db 8, 24, 32, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 144 ; HP
	bigdw 144 ; Max HP
	bigdw 106 ; Atk
	bigdw 93 ; Def
	bigdw 121 ; Spd
	bigdw 128 ; SAtk
	bigdw 109 ; SDef
	db "SUTA-MI-@@@"

	db FERALIGATR
	db KINGS_ROCK
	db WATERFALL, CRUNCH, EARTHQUAKE, SWORDS_DANCE 
	dw 0 ; OT ID
	dt 56660 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 15, 15, 15, 11 ; DVs
	db 24, 24, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 154 ; HP
	bigdw 154 ; Max HP
	bigdw 125 ; Atk
	bigdw 119 ; Def
	bigdw 93 ; Spd
	bigdw 100 ; SAtk
	bigdw 103 ; SDef
	db "SO-NANSU@@@"

	db FERALIGATR
	db MYSTIC_WATER
	db HYDRO_PUMP, ICE_BEAM, EARTHQUAKE, ROCK_SLIDE
	dw 0 ; OT ID
	dt 56660 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 15, 15, 15, 11 ; DVs
	db 8, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 154 ; HP
	bigdw 154 ; Max HP
	bigdw 125 ; Atk
	bigdw 119 ; Def
	bigdw 93 ; Spd
	bigdw 100 ; SAtk
	bigdw 103 ; SDef
	db "SO-NANSU@@@"

	db MEGANIUM
	db LUM_BERRY
	db SWORDS_DANCE, DOUBLE_EDGE, EARTHQUAKE, SYNTHESIS 
	dw 0 ; OT ID
	dt 56660 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	bigdw 60000
	dn 11, 15, 15, 15 ; DVs
	db 48, 24, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 150 ; HP
	bigdw 150 ; Max HP
	bigdw 101 ; Atk
	bigdw 117 ; Def
	bigdw 98 ; Spd
	bigdw 107 ; SAtk
	bigdw 121 ; SDef
	db "HAtuSAMU@@@"

	db MEGANIUM
	db MIRACLE_SEED
	db PETAL_DANCE, SYNTHESIS, BODY_SLAM, REFLECT 
	dw 0 ; OT ID
	dt 56660 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	bigdw 60000
	dn 11, 15, 15, 15 ; DVs
	db 10, 8, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 150 ; HP
	bigdw 150 ; Max HP
	bigdw 101 ; Atk
	bigdw 117 ; Def
	bigdw 98 ; Spd
	bigdw 107 ; SAtk
	bigdw 121 ; SDef
	db "DAGUTORIO@@"

	db ARIADOS
	db BRIGHTPOWDER
	db NIGHT_SHADE, MEGAHORN, PSYCHIC_M, SUBSTITUTE
	dw 0 ; OT ID
	dt 51200 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 60000
	bigdw 30000
	bigdw 30000
	bigdw 40000
	dn 15, 11, 11, 15 ; DVs
	db 24, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 135 ; HP
	bigdw 135 ; Max HP
	bigdw 87 ; Atk
	bigdw 81 ; Def
	bigdw 66 ; Spd
	bigdw 81 ; SAtk
	bigdw 81 ; SDef
	db "YADORAN@@@@"

	db MUK
	db BRIGHTPOWDER
	db MINIMIZE, EXPLOSION, SLUDGE_BOMB, FIRE_BLAST 
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	dn 15, 15, 13, 13 ; DVs
	db 32, 8, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 170 ; HP
	bigdw 170 ; Max HP
	bigdw 121 ; Atk
	bigdw 97 ; Def
	bigdw 75 ; Spd
	bigdw 87 ; SAtk
	bigdw 115 ; SDef
	db "PORIGON2@@@"

	db LANTURN
	db MAGNET
	db THUNDER, SURF, ICE_BEAM, AGILITY 
	dw 0 ; OT ID
	dt 80000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 60000
	dn 11, 12, 15, 13 ; DVs
	db 16, 24, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 183 ; HP
	bigdw 183 ; Max HP
	bigdw 77 ; Atk
	bigdw 78 ; Def
	bigdw 86 ; Spd
	bigdw 102 ; SAtk
	bigdw 102 ; SDef
	db "UINDEi@@@@@"

	db PIDGEOT
	db BRIGHTPOWDER
	db RETURN, MUD_SLAP, AGILITY, SUBSTITUTE 
	dw 0 ; OT ID
	dt 56660 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	dn 15, 12, 14, 13 ; DVs
	db 24, 16, 48, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 141 ; HP
	bigdw 141 ; Max HP
	bigdw 103 ; Atk
	bigdw 91 ; Def
	bigdw 113 ; Spd
	bigdw 94 ; SAtk
	bigdw 94 ; SDef
	db "HUoRETOSU@@"

	db PIDGEOT
	db BLACKGLASSES
	db DOUBLE_EDGE, STEEL_WING, PURSUIT, FLY 
	dw 0 ; OT ID
	dt 56660 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	dn 15, 12, 14, 13 ; DVs
	db 24, 40, 32, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 141 ; HP
	bigdw 141 ; Max HP
	bigdw 103 ; Atk
	bigdw 91 ; Def
	bigdw 113 ; Spd
	bigdw 94 ; SAtk
	bigdw 94 ; SDef
	db "OMUSUTA-@@@"

	db ARBOK
	db SOFT_SAND
	db GLARE, SUBSTITUTE, SLUDGE_BOMB, EARTHQUAKE 
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 40000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 14, 13 ; DVs
	db 48, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 123 ; HP
	bigdw 123 ; Max HP
	bigdw 117 ; Atk
	bigdw 87 ; Def
	bigdw 96 ; Spd
	bigdw 86 ; SAtk
	bigdw 96 ; SDef
	db "RIZA-DON@@@"

	db SANDSLASH
	db SOFT_SAND
	db EARTHQUAKE, ROCK_SLIDE, SWORDS_DANCE, LOW_KICK
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 15, 15, 14, 13 ; DVs
	db 16, 16, 48, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 141 ; HP
	bigdw 141 ; Max HP
	bigdw 121 ; Atk
	bigdw 127 ; Def
	bigdw 84 ; Spd
	bigdw 72 ; SAtk
	bigdw 80 ; SDef
	db "NAtuSI-@@@@"

	db BEEDRILL
	db SILVERPOWDER
	db SWORDS_DANCE, FEINT_ATTACK, SLUDGE_BOMB, PIN_MISSILE 
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	bigdw 60000
	dn 15, 13, 11, 13 ; DVs
	db 48, 32, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 128 ; HP
	bigdw 128 ; Max HP
	bigdw 111 ; Atk
	bigdw 64 ; Def
	bigdw 99 ; Spd
	bigdw 69 ; SAtk
	bigdw 97 ; SDef
	db "SURI-PA-@@@"

	db PRIMEAPE
	db BLACKBELT_I
	db CROSS_CHOP, THUNDER, EARTHQUAKE, ICE_PUNCH 
	dw 0 ; OT ID
	dt 64000 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 50000
	bigdw 30000
	bigdw 60000
	bigdw 40000
	dn 15, 13, 14, 13 ; DVs
	db 8, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 127 ; HP
	bigdw 127 ; Max HP
	bigdw 123 ; Atk
	bigdw 80 ; Def
	bigdw 115 ; Spd
	bigdw 84 ; SAtk
	bigdw 92 ; SDef
	db "BETOBETON@@"

	db POLIWRATH
	db LEFTOVERS
	db HYPNOSIS, BELLY_DRUM, DYNAMICPUNCH, ROCK_SLIDE 
	dw 0 ; OT ID
	dt 56660 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 32, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 158 ; HP
	bigdw 158 ; Max HP
	bigdw 113 ; Atk
	bigdw 117 ; Def
	bigdw 97 ; Spd
	bigdw 97 ; SAtk
	bigdw 113 ; SDef
	db "EREBU-@@@@@"

	
	; Group 5
	
	db TENTACRUEL
	db MYSTIC_WATER
	db SLUDGE_BOMB, SURF, BARRIER, GIGA_DRAIN
	dw 0 ; OT ID
	dt 156250 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 60000
	bigdw 50000
	bigdw 50000
	dn 12, 15, 15, 11 ; DVs
	db 16, 24, 48, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 175 ; HP
	bigdw 175 ; Max HP
	bigdw 112 ; Atk
	bigdw 115 ; Def
	bigdw 144 ; Spd
	bigdw 128 ; SAtk
	bigdw 168 ; SDef
	db "KINGUDORA@@"

	db RAPIDASH
	db CHARCOAL
	db LOW_KICK, FIRE_BLAST, SUNNY_DAY, SOLARBEAM 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 60000
	bigdw 50000
	bigdw 50000
	dn 15, 12, 15, 15 ; DVs
	db 32, 8, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 164 ; HP
	bigdw 164 ; Max HP
	bigdw 117 ; Atk
	bigdw 128 ; Def
	bigdw 153 ; Spd
	bigdw 128 ; SAtk
	bigdw 128 ; SDef
	db "HERUGA-@@@@"

	db SLOWBRO
	db LEFTOVERS
	db SURF, PSYCHIC_M, REST, THUNDER_WAVE
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 20000
	bigdw 60000
	bigdw 20000
	bigdw 40000
	dn 13, 15, 15, 9 ; DVs
	db 24, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 200 ; HP
	bigdw 200 ; Max HP
	bigdw 110 ; Atk
	bigdw 160 ; Def
	bigdw 61 ; Spd
	bigdw 145 ; SAtk
	bigdw 125 ; SDef
	db "TUBOTUBO@@@"

	db MAGNETON
	db MAGNET
	db THUNDER, LIGHT_SCREEN, SCREECH, EXPLOSION 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	bigdw 60000
	dn 15, 11, 14, 15 ; DVs
	db 16, 48, 61, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 146 ; HP
	bigdw 146 ; Max HP
	bigdw 97 ; Atk
	bigdw 142 ; Def
	bigdw 115 ; Spd
	bigdw 170 ; SAtk
	bigdw 120 ; SDef
	db "KABIGON@@@@"

	db SKARMORY
	db LEFTOVERS
	db REST, TOXIC, PROTECT, STEEL_WING 
	dw 0 ; OT ID
	dt 156250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 30000
	bigdw 60000
	bigdw 10000
	bigdw 60000
	dn 9, 15, 15, 13 ; DVs
	db 16, 16, 16, 40 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 170 ; HP
	bigdw 170 ; Max HP
	bigdw 115 ; Atk
	bigdw 190 ; Def
	bigdw 100 ; Spd
	bigdw 90 ; SAtk
	bigdw 120 ; SDef
	db "RAPURASU@@@"

	db DODRIO
	db SILK_SCARF
	db DOUBLE_EDGE, JUMP_KICK, DRILL_PECK, SWORDS_DANCE 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 60000
	bigdw 40000
	bigdw 60000
	bigdw 40000
	dn 15, 13, 11, 15 ; DVs
	db 24, 40, 32, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 156 ; HP
	bigdw 156 ; Max HP
	bigdw 160 ; Atk
	bigdw 113 ; Def
	bigdw 160 ; Spd
	bigdw 101 ; SAtk
	bigdw 101 ; SDef
	db "SANDA-SU@@@"

	db MUK
	db CHARCOAL
	db SLUDGE_BOMB, FIRE_BLAST, DYNAMICPUNCH, EXPLOSION 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 40000
	bigdw 40000
	bigdw 50000
	dn 15, 13, 11, 12 ; DVs
	db 16, 8, 8, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 208 ; HP
	bigdw 208 ; Max HP
	bigdw 155 ; Atk
	bigdw 118 ; Def
	bigdw 92 ; Spd
	bigdw 109 ; SAtk
	bigdw 144 ; SDef
	db "HAtuSAMU@@@"

	db MUK
	db LEFTOVERS
	db TOXIC, FIRE_BLAST, MINIMIZE, REST
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 40000
	bigdw 40000
	bigdw 50000
	dn 15, 13, 11, 12 ; DVs
	db 16, 8, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 208 ; HP
	bigdw 208 ; Max HP
	bigdw 155 ; Atk
	bigdw 118 ; Def
	bigdw 92 ; Spd
	bigdw 109 ; SAtk
	bigdw 144 ; SDef
	db "YADOKINGU@@"

	db CLOYSTER
	db NEVERMELTICE
	db SURF, ICE_BEAM, TOXIC, EXPLOSION 
	dw 0 ; OT ID
	dt 156250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 30000
	bigdw 30000
	dn 15, 15, 15, 12 ; DVs
	db 24, 16, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 153 ; HP
	bigdw 153 ; Max HP
	bigdw 145 ; Atk
	bigdw 230 ; Def
	bigdw 108 ; Spd
	bigdw 126 ; SAtk
	bigdw 86 ; SDef
	db "KAIRIKI-@@@"

	db VENOMOTH
	db BRIGHTPOWDER
	db SLEEP_POWDER, PSYCHIC_M, SLUDGE_BOMB, FLASH 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 20000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	dn 11, 14, 15, 11 ; DVs
	db 24, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 166 ; HP
	bigdw 166 ; Max HP
	bigdw 98 ; Atk
	bigdw 104 ; Def
	bigdw 127 ; Spd
	bigdw 138 ; SAtk
	bigdw 138 ; SDef
	db "SUTA-MI-@@@"

	db HYPNO
	db SITRUS_BERRY
	db PSYCHIC_M, LIGHT_SCREEN, FUTURE_SIGHT, SHADOW_BALL 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 20000
	bigdw 40000
	bigdw 60000
	bigdw 30000
	dn 9, 15, 15, 11 ; DVs
	db 16, 48, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 190 ; HP
	bigdw 190 ; Max HP
	bigdw 104 ; Atk
	bigdw 115 ; Def
	bigdw 104 ; Spd
	bigdw 121 ; SAtk
	bigdw 163 ; SDef
	db "DAGUTORIO@@"

	db KINGLER
	db SCOPE_LENS
	db FLAIL, CRABHAMMER, RETURN, TOXIC 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 60000
	bigdw 60000
	bigdw 30000
	bigdw 50000
	dn 15, 15, 15, 11 ; DVs
	db 24, 16, 32, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 158 ; HP
	bigdw 158 ; Max HP
	bigdw 180 ; Atk
	bigdw 165 ; Def
	bigdw 112 ; Spd
	bigdw 98 ; SAtk
	bigdw 98 ; SDef
	db "MARUMAIN@@@"

	db MAROWAK
	db THICK_CLUB
	db ROCK_SLIDE, EARTHQUAKE, FIRE_BLAST, SWORDS_DANCE 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 60000
	bigdw 60000
	bigdw 20000
	bigdw 40000
	dn 15, 15, 13, 13 ; DVs
	db 16, 16, 8, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 163 ; HP
	bigdw 163 ; Max HP
	bigdw 130 ; Atk
	bigdw 160 ; Def
	bigdw 80 ; Spd
	bigdw 93 ; SAtk
	bigdw 123 ; SDef
	db "PUTERA@@@@@"

	db HITMONCHAN
	db BLACKBELT_I
	db MACH_PUNCH, DYNAMICPUNCH, ROCK_SLIDE, SWORDS_DANCE 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 60000
	bigdw 60000
	bigdw 40000
	bigdw 40000
	dn 15, 15, 13, 13 ; DVs
	db 48, 8, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 153 ; HP
	bigdw 153 ; Max HP
	bigdw 155 ; Atk
	bigdw 129 ; Def
	bigdw 119 ; Spd
	bigdw 78 ; SAtk
	bigdw 153 ; SDef
	db "KUROBAtuTO@"

	db WEEZING
	db SCOPE_LENS
	db SLUDGE_BOMB, FLAMETHROWER, EXPLOSION, TOXIC 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 60000
	bigdw 60000
	bigdw 40000
	bigdw 40000
	dn 15, 15, 13, 13 ; DVs
	db 16, 24, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 168 ; HP
	bigdw 168 ; Max HP
	bigdw 140 ; Atk
	bigdw 170 ; Def
	bigdw 103 ; Spd
	bigdw 128 ; SAtk
	bigdw 113 ; SDef
	db "SANDA-@@@@@"

	db MANTINE
	db LUM_BERRY
	db SURF, TOXIC, REST, HAZE
	dw 0 ; OT ID
	dt 156250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 10000
	bigdw 60000
	bigdw 40000
	bigdw 50000
	dn 11, 15, 13, 13 ; DVs
	db 24, 16, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 190 ; HP
	bigdw 170 ; Max HP
	bigdw 68 ; Atk
	bigdw 120 ; Def
	bigdw 115 ; Spd
	bigdw 126 ; SAtk
	bigdw 186 ; SDef
	db "EA-MUDO@@@@"

	db BLISSEY
	db LEFTOVERS
	db FLAMETHROWER, TOXIC, SOFTBOILED, THUNDER_WAVE
	dw 0 ; OT ID
	dt 100000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 10000
	bigdw 60000
	bigdw 40000
	bigdw 50000
	dn 11, 15, 13, 13 ; DVs
	db 24, 16, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 360 ; HP
	bigdw 360 ; Max HP
	bigdw 38 ; Atk
	bigdw 60 ; Def
	bigdw 98 ; Spd
	bigdw 121 ; SAtk
	bigdw 181 ; SDef
	db "HUoRETOSU@@"

	db KANGASKHAN
	db KINGS_ROCK
	db CRUNCH, DOUBLE_EDGE, CURSE, REST 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 11, 15 ; DVs
	db 24, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 205 ; HP
	bigdw 205 ; Max HP
	bigdw 145 ; Atk
	bigdw 128 ; Def
	bigdw 138 ; Spd
	bigdw 84 ; SAtk
	bigdw 124 ; SDef
	db "HAGANE-RU@@"

	db SLOWKING
	db TWISTEDSPOON
	db SURF, PSYCHIC_M, THUNDER_WAVE, REST 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 20000
	bigdw 50000
	bigdw 20000
	bigdw 60000
	dn 9, 15, 15, 9 ; DVs
	db 24, 16, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 200 ; HP
	bigdw 200 ; Max HP
	bigdw 106 ; Atk
	bigdw 128 ; Def
	bigdw 61 ; Spd
	bigdw 150 ; SAtk
	bigdw 160 ; SDef
	db "KIRINRIKI@@"

	db SCYTHER
	db SILVERPOWDER
	db SLASH, WING_ATTACK, STEEL_WING, SWORDS_DANCE 
	dw 0 ; OT ID
	dt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 30000
	bigdw 60000
	bigdw 30000
	dn 15, 10, 13, 15 ; DVs
	db 32, 56, 40, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 166 ; HP
	bigdw 166 ; Max HP
	bigdw 160 ; Atk
	bigdw 116 ; Def
	bigdw 155 ; Spd
	bigdw 94 ; SAtk
	bigdw 119 ; SDef
	db "GIyaRADOSU@"

	db MURKROW
	db BLACKGLASSES
	db FEINT_ATTACK, DRILL_PECK, CONFUSE_RAY, THUNDER_WAVE
	dw 0 ; OT ID
	dt 117360 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 30000
	bigdw 60000
	bigdw 50000
	dn 15, 10, 15, 15 ; DVs
	db 32, 32, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 156 ; HP
	bigdw 156 ; Max HP
	bigdw 135 ; Atk
	bigdw 78 ; Def
	bigdw 141 ; Spd
	bigdw 133 ; SAtk
	bigdw 90 ; SDef
	db "HURI-ZA-@@@"

	
	; Group 6
	
	db LAPRAS
	db MYSTIC_WATER
	db SURF, ICE_BEAM, CONFUSE_RAY, PERISH_SONG  
	dw 0 ; OT ID
	dt 270000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 20000
	bigdw 40000
	bigdw 30000
	bigdw 60000
	dn 15, 15, 15, 11 ; DVs
	db 24, 16, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 280 ; HP
	bigdw 280 ; Max HP
	bigdw 146 ; Atk
	bigdw 149 ; Def
	bigdw 116 ; Spd
	bigdw 161 ; SAtk
	bigdw 173 ; SDef
	db "KINGUDORA@@"

	db FLAREON
	db CHARCOAL
	db FIRE_BLAST, SHADOW_BALL, DOUBLE_EDGE, MUD_SLAP  
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 60000
	bigdw 40000
	bigdw 30000
	bigdw 60000
	dn 15, 14, 15, 11 ; DVs
	db 8, 24, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 194 ; HP
	bigdw 194 ; Max HP
	bigdw 215 ; Atk
	bigdw 123 ; Def
	bigdw 122 ; Spd
	bigdw 173 ; SAtk
	bigdw 191 ; SDef
	db "BANGIRASU@@"

	db PORYGON2
	db LEFTOVERS
	db RETURN, ICE_BEAM, RECOVER, CURSE 
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 40000
	bigdw 40000
	bigdw 50000
	dn 15, 14, 15, 11 ; DVs
	db 32, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 221 ; HP
	bigdw 221 ; Max HP
	bigdw 155 ; Atk
	bigdw 159 ; Def
	bigdw 120 ; Spd
	bigdw 182 ; SAtk
	bigdw 170 ; SDef
	db "HERUGA-@@@@"

	db KABUTOPS
	db KINGS_ROCK
	db WATERFALL, ROCK_SLIDE, LOW_KICK, SWORDS_DANCE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 60000
	bigdw 60000
	bigdw 30000
	bigdw 50000
	dn 15, 15, 11, 15 ; DVs
	db 24, 16, 32, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 193 ; HP
	bigdw 193 ; Max HP
	bigdw 197 ; Atk
	bigdw 185 ; Def
	bigdw 144 ; Spd
	bigdw 129 ; SAtk
	bigdw 135 ; SDef
	db "PORIGON2@@@"

	db OMASTAR
	db MYSTIC_WATER
	db HYDRO_PUMP, RAIN_DANCE, REST, SLEEP_TALK 
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 60000
	bigdw 30000
	bigdw 60000
	dn 11, 15, 15, 11 ; DVs
	db 8, 8, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 205 ; HP
	bigdw 205 ; Max HP
	bigdw 116 ; Atk
	bigdw 209 ; Def
	bigdw 110 ; Spd
	bigdw 197 ; SAtk
	bigdw 143 ; SDef
	db "KAIRIKI-@@@"

	db AERODACTYL
	db HARD_STONE
	db ROCK_SLIDE, EARTHQUAKE, WING_ATTACK, CRUNCH  
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 60000
	bigdw 20000
	bigdw 60000
	bigdw 20000
	dn 15, 11, 11, 15 ; DVs
	db 16, 16, 56, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 209 ; HP
	bigdw 209 ; Max HP
	bigdw 185 ; Atk
	bigdw 117 ; Def
	bigdw 215 ; Spd
	bigdw 111 ; SAtk
	bigdw 129 ; SDef
	db "SANDA-@@@@@"

	db CHARIZARD
	db CHARCOAL
	db FIRE_BLAST, THUNDERPUNCH, OUTRAGE, DRAGONBREATH 
	dw 0 ; OT ID
	dt 211060 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	bigdw 60000
	dn 11, 11, 15, 15 ; DVs
	db 8, 24, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 207 ; HP
	bigdw 207 ; Max HP
	bigdw 149 ; Atk
	bigdw 137 ; Def
	bigdw 176 ; Spd
	bigdw 190 ; SAtk
	bigdw 161 ; SDef
	db "SO-NANSU@@@"

	db CHARIZARD
	db FOCUS_BAND
	db FIRE_BLAST, EARTHQUAKE, ROCK_SLIDE, BELLY_DRUM 
	dw 0 ; OT ID
	dt 211060 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 60000
	bigdw 30000
	bigdw 50000
	bigdw 60000
	dn 15, 11, 11, 15 ; DVs
	db 8, 24, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 207 ; HP
	bigdw 207 ; Max HP
	bigdw 149 ; Atk
	bigdw 137 ; Def
	bigdw 176 ; Spd
	bigdw 185 ; SAtk
	bigdw 156 ; SDef
	db "PUTERA@@@@@"

	db VENUSAUR
	db FOCUS_BAND
	db GIGA_DRAIN, SLUDGE_BOMB, HIDDEN_POWER, SLEEP_POWDER ; HP = FIRE
	dw 0 ; OT ID
	dt 211060 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 20000
	bigdw 50000
	bigdw 40000
	bigdw 60000
	dn 10, 12, 15, 11 ; DVs
	db 8, 16, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 206 ; HP
	bigdw 206 ; Max HP
	bigdw 136 ; Atk
	bigdw 152 ; Def
	bigdw 144 ; Spd
	bigdw 179 ; SAtk
	bigdw 179 ; SDef
	db "KAIRIyu-@@@"

	db VENUSAUR
	db LEFTOVERS
	db SWORDS_DANCE, SLUDGE_BOMB, EARTHQUAKE, SLEEP_POWDER
	dw 0 ; OT ID
	dt 211060 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 20000
	bigdw 50000
	bigdw 40000
	bigdw 60000
	dn 11, 14, 15, 11 ; DVs
	db 48, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 215 ; HP
	bigdw 215 ; Max HP
	bigdw 137 ; Atk
	bigdw 131 ; Def
	bigdw 144 ; Spd
	bigdw 179 ; SAtk
	bigdw 179 ; SDef
	db "BURAtuKI-@@"

	db BLASTOISE
	db SITRUS_BERRY
	db SURF, TOXIC, REST, SLEEP_TALK
	dw 0 ; OT ID
	dt 211060 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 20000
	bigdw 60000
	bigdw 50000
	bigdw 30000
	dn 11, 14, 15, 11 ; DVs
	db 24, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 214 ; HP
	bigdw 214 ; Max HP
	bigdw 138 ; Atk
	bigdw 178 ; Def
	bigdw 145 ; Spd
	bigdw 150 ; SAtk
	bigdw 174 ; SDef
	db "UINDEi@@@@@"

	db MURKROW
	db BLACKGLASSES
	db FEINT_ATTACK, DRILL_PECK, THUNDER_WAVE, PERISH_SONG 
	dw 0 ; OT ID
	dt 211060 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 30000
	bigdw 60000
	bigdw 50000
	dn 15, 12, 15, 9 ; DVs
	db 32, 32, 32, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 185 ; HP
	bigdw 185 ; Max HP
	bigdw 161 ; Atk
	bigdw 95 ; Def
	bigdw 161 ; Spd
	bigdw 158 ; SAtk
	bigdw 107 ; SDef
	db "EA-MUDO@@@@"

	db XATU
	db TWISTEDSPOON
	db PSYCHIC_M, DRILL_PECK, GIGA_DRAIN, SHADOW_BALL
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	bigdw 60000
	dn 15, 14, 15, 11 ; DVs
	db 16, 32, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 191 ; HP
	bigdw 191 ; Max HP
	bigdw 143 ; Atk
	bigdw 139 ; Def
	bigdw 162 ; Spd
	bigdw 173 ; SAtk
	bigdw 143 ; SDef
	db "HAPINASU@@@"

	db AMPHAROS
	db MAGNET
	db THUNDER, CONFUSE_RAY, ICE_PUNCH, AGILITY 
	dw 0 ; OT ID
	dt 211060 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 60000
	dn 15, 13, 15, 12 ; DVs
	db 16, 16, 24, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 219 ; HP
	bigdw 219 ; Max HP
	bigdw 138 ; Atk
	bigdw 152 ; Def
	bigdw 111 ; Spd
	bigdw 197 ; SAtk
	bigdw 167 ; SDef
	db "KABIGON@@@@"

	db AMPHAROS
	db MAGNET
	db THUNDER, LOW_KICK, ICE_PUNCH, AGILITY 
	dw 0 ; OT ID
	dt 211060 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 60000
	dn 15, 13, 15, 12 ; DVs
	db 16, 32, 24, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 219 ; HP
	bigdw 219 ; Max HP
	bigdw 138 ; Atk
	bigdw 152 ; Def
	bigdw 111 ; Spd
	bigdw 197 ; SAtk
	bigdw 167 ; SDef
	db "HERAKUROSU@"

	db ELECTRODE
	db MAGNET
	db THUNDER, LIGHT_SCREEN, EXPLOSION, MIRROR_COAT 
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 60000
	bigdw 40000
	bigdw 60000
	bigdw 60000
	dn 15, 11, 15, 15 ; DVs
	db 16, 48, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 185 ; HP
	bigdw 185 ; Max HP
	bigdw 119 ; Atk
	bigdw 132 ; Def
	bigdw 249 ; Spd
	bigdw 155 ; SAtk
	bigdw 155 ; SDef
	db "RU-ZIyuRA@@"

	db SUDOWOODO
	db HARD_STONE
	db ROCK_SLIDE, CURSE, EXPLOSION, EARTHQUAKE
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 60000
	bigdw 60000
	bigdw 40000
	bigdw 30000
	dn 15, 15, 11, 15 ; DVs
	db 16, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 197 ; HP
	bigdw 197 ; Max HP
	bigdw 179 ; Atk
	bigdw 197 ; Def
	bigdw 89 ; Spd
	bigdw 80 ; SAtk
	bigdw 122 ; SDef
	db "KAMEtuKUSU@"

	db POLITOED 
	db LUM_BERRY
	db SURF, ICE_BEAM, PERISH_SONG, HYPNOSIS 
	dw 0 ; OT ID
	dt 211060 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 40000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	dn 11, 15, 13, 11 ; DVs
	db 24, 16, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 232 ; HP
	bigdw 232 ; Max HP
	bigdw 138 ; Atk
	bigdw 143 ; Def
	bigdw 135 ; Spd
	bigdw 158 ; SAtk
	bigdw 170 ; SDef
	db "SAIDON@@@@@"

	db ESPEON
	db TWISTEDSPOON
	db PSYCHIC_M, SHADOW_BALL, MORNING_SUN, THUNDER_WAVE 
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 11, 15, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 191 ; HP
	bigdw 191 ; Max HP
	bigdw 122 ; Atk
	bigdw 125 ; Def
	bigdw 191 ; Spd
	bigdw 215 ; SAtk
	bigdw 173 ; SDef
	db "SANDOPAN@@@"

	db UMBREON
	db LEFTOVERS
	db CRUNCH, CURSE, REST, SLEEP_TALK 
	dw 0 ; OT ID
	dt 216000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 60000
	bigdw 30000
	bigdw 30000
	dn 15, 15, 11, 15 ; DVs
	db 24, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 232 ; HP
	bigdw 232 ; Max HP
	bigdw 137 ; Atk
	bigdw 191 ; Def
	bigdw 126 ; Spd
	bigdw 116 ; SAtk
	bigdw 200 ; SDef
	db "PARASEKUTO@"

	db PINSIR
	db SILVERPOWDER
	db SWORDS_DANCE, EARTHQUAKE, SUBMISSION, FEINT_ATTACK 
	dw 0 ; OT ID
	dt 270000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 60000
	bigdw 30000
	bigdw 30000
	dn 15, 15, 11, 15 ; DVs
	db 48, 16, 40, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 196 ; HP
	bigdw 196 ; Max HP
	bigdw 209 ; Atk
	bigdw 179 ; Def
	bigdw 150 ; Spd
	bigdw 110 ; SAtk
	bigdw 128 ; SDef
	db "GORO-NIya@@"

	
	; Group 7
	
	db NIDOQUEEN
	db NEVERMELTICE
	db EARTHQUAKE, ICE_BEAM, THUNDER, CHARM
	dw 0 ; OT ID
	dt 344960 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 15, 13, 13, 13 ; DVs
	db 16, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 269 ; HP
	bigdw 269 ; Max HP
	bigdw 196 ; Atk
	bigdw 184 ; Def
	bigdw 159 ; Spd
	bigdw 163 ; SAtk
	bigdw 177 ; SDef
	db "SANDA-SU@@@"

	db SNEASEL
	db BLACKGLASSES
	db BEAT_UP, ICE_BEAM, LOW_KICK, SWORDS_DANCE
	dw 0 ; OT ID
	dt 344960 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 40000
	dn 15, 13, 15, 15 ; DVs
	db 16, 16, 32, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 208 ; HP
	bigdw 208 ; Max HP
	bigdw 201 ; Atk
	bigdw 142 ; Def
	bigdw 229 ; Spd
	bigdw 110 ; SAtk
	bigdw 166 ; SDef
	db "SIyaWA-ZU@@"

	db GRANBULL
	db SCOPE_LENS
	db OUTRAGE, FRUSTRATION, CRUNCH, FIRE_BLAST
	dw 0 ; OT ID
	dt 274400 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 60000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	dn 13, 13, 13, 13 ; DVs
	db 16, 32, 24, 8 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 257 ; HP
	bigdw 257 ; Max HP
	bigdw 236 ; Atk
	bigdw 158 ; Def
	bigdw 116 ; Spd
	bigdw 146 ; SAtk
	bigdw 146 ; SDef
	db "HAPINASU@@@"

	db SCIZOR
	db METAL_COAT
	db STEEL_WING, FURY_CUTTER, SWORDS_DANCE, DOUBLE_EDGE
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 60000
	bigdw 30000
	bigdw 50000
	dn 15, 15, 13, 15 ; DVs
	db 40, 32, 48, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 234 ; HP
	bigdw 234 ; Max HP
	bigdw 250 ; Atk
	bigdw 208 ; Def
	bigdw 147 ; Spd
	bigdw 139 ; SAtk
	bigdw 174 ; SDef
	db "KABIGON@@@@"

	db URSARING
	db SILK_SCARF
	db RETURN, EARTHQUAKE, CROSS_CHOP, SWORDS_DANCE
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 30000
	bigdw 50000
	dn 15, 15, 13, 15 ; DVs
	db 32, 16, 8, 48 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 269 ; HP
	bigdw 269 ; Max HP
	bigdw 250 ; Atk
	bigdw 173 ; Def
	bigdw 133 ; Spd
	bigdw 167 ; SAtk
	bigdw 167 ; SDef
	db "HERUGA-@@@@"

	db DONPHAN
	db CHESTO_BERRY
	db REST, EARTHQUAKE, TOXIC, ROAR 
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 30000
	bigdw 50000
	dn 15, 15, 13, 11 ; DVs
	db 16, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 269 ; HP
	bigdw 269 ; Max HP
	bigdw 236 ; Atk
	bigdw 236 ; Def
	bigdw 120 ; Spd
	bigdw 146 ; SAtk
	bigdw 146 ; SDef
	db "BANGIRASU@@"

	db MILTANK
	db LEFTOVERS
	db MILK_DRINK, BODY_SLAM, SURF, CHARM 
	dw 0 ; OT ID
	dt 428750 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 40000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 13, 15 ; DVs
	db 16, 24, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 276 ; HP
	bigdw 276 ; Max HP
	bigdw 173 ; Atk
	bigdw 215 ; Def
	bigdw 208 ; Spd
	bigdw 121 ; SAtk
	bigdw 163 ; SDef
	db "SANDA-@@@@@"

	db OCTILLERY
	db MYSTIC_WATER
	db HYDRO_PUMP, ICE_BEAM, TOXIC, FIRE_BLAST 
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 60000
	dn 11, 13, 15, 11 ; DVs
	db 8, 16, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 241 ; HP
	bigdw 241 ; Max HP
	bigdw 202 ; Atk
	bigdw 167 ; Def
	bigdw 113 ; Spd
	bigdw 215 ; SAtk
	bigdw 173 ; SDef
	db "NAtuSI-@@@@"

	db PILOSWINE
	db NEVERMELTICE
	db ICY_WIND, ROCK_SLIDE, EARTHQUAKE, ROAR 
	dw 0 ; OT ID
	dt 428750 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 15, 15, 15, 11 ; DVs
	db 24, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 283 ; HP
	bigdw 283 ; Max HP
	bigdw 208 ; Atk
	bigdw 177 ; Def
	bigdw 120 ; Spd
	bigdw 145 ; SAtk
	bigdw 145 ; SDef
	db "BURAtuKI-@@"

	db MAGCARGO
	db CHARCOAL
	db FIRE_BLAST, ROCK_SLIDE, RECOVER, TOXIC
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 60000
	bigdw 30000
	bigdw 60000
	dn 15, 15, 15, 11 ; DVs
	db 8, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 248 ; HP
	bigdw 206 ; Max HP
	bigdw 135 ; Atk
	bigdw 236 ; Def
	bigdw 92 ; Spd
	bigdw 194 ; SAtk
	bigdw 180 ; SDef
	db "GIyaRADOSU@"

	db SHUCKLE
	db LEFTOVERS
	db DEFENSE_CURL, TOXIC, FLASH, REST
	dw 0 ; OT ID
	dt 344960 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 0
	bigdw 60000
	bigdw 0
	bigdw 60000
	dn 15, 13, 15, 11 ; DVs
	db 61, 16, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 171 ; HP
	bigdw 171 ; Max HP
	bigdw 37 ; Atk
	bigdw 390 ; Def
	bigdw 27 ; Spd
	bigdw 82 ; SAtk
	bigdw 390 ; SDef
	db "NUO-@@@@@@@"

	db STEELIX
	db LEFTOVERS
	db EARTHQUAKE, ROCK_SLIDE, CURSE, REST 
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 30000
	bigdw 60000
	dn 15, 15, 15, 11 ; DVs
	db 16, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 248 ; HP
	bigdw 248 ; Max HP
	bigdw 187 ; Atk
	bigdw 348 ; Def
	bigdw 92 ; Spd
	bigdw 145 ; SAtk
	bigdw 159 ; SDef
	db "RINGUMA@@@@"

	db MISDREAVUS
	db SPELL_TAG
	db SHADOW_BALL, PAIN_SPLIT, ICY_WIND, THUNDER 
	dw 0 ; OT ID
	dt 274400 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 40000
	bigdw 60000
	bigdw 30000
	bigdw 60000
	dn 11, 15, 15, 11 ; DVs
	db 24, 32, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 227 ; HP
	bigdw 227 ; Max HP
	bigdw 139 ; Atk
	bigdw 152 ; Def
	bigdw 169 ; Spd
	bigdw 187 ; SAtk
	bigdw 187 ; SDef
	db "BARIYA-DO@@"

	db XATU
	db SHARP_BEAK
	db PSYCHIC_M, DRILL_PECK, SHADOW_BALL, THUNDER_WAVE 
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 40000
	bigdw 60000
	bigdw 30000
	bigdw 60000
	dn 11, 15, 15, 11 ; DVs
	db 16, 32, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 234 ; HP
	bigdw 234 ; Max HP
	bigdw 160 ; Atk
	bigdw 166 ; Def
	bigdw 183 ; Spd
	bigdw 201 ; SAtk
	bigdw 166 ; SDef
	db "OKORIZARU@@"

	db TYPHLOSION
	db CHARCOAL
	db FIRE_BLAST, THUNDERPUNCH, SUNNY_DAY, SOLARBEAM 
	dw 0 ; OT ID
	dt 344960 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 11, 15, 15, 15 ; DVs
	db 8, 24, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 245 ; HP
	bigdw 245 ; Max HP
	bigdw 173 ; Atk
	bigdw 177 ; Def
	bigdw 208 ; Spd
	bigdw 221 ; SAtk
	bigdw 187 ; SDef
	db "KIRINRIKI@@"

	db FERALIGATR
	db KINGS_ROCK
	db WATERFALL, ROCK_SLIDE, EARTHQUAKE, SWORDS_DANCE 
	dw 0 ; OT ID
	dt 344960 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 40000
	dn 15, 15, 11, 15 ; DVs
	db 24, 16, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 255 ; HP
	bigdw 255 ; Max HP
	bigdw 215 ; Atk
	bigdw 208 ; Def
	bigdw 177 ; Spd
	bigdw 166 ; SAtk
	bigdw 171 ; SDef
	db "SAWAMURA-@@"

	db MEGANIUM
	db MIRACLE_SEED
	db PETAL_DANCE, EARTHQUAKE, SYNTHESIS, TOXIC 
	dw 0 ; OT ID
	dt 344960 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 40000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 11 ; DVs
	db 16, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 255 ; HP
	bigdw 255 ; Max HP
	bigdw 175 ; Atk
	bigdw 208 ; Def
	bigdw 175 ; Spd
	bigdw 184 ; SAtk
	bigdw 208 ; SDef
	db "HERAKUROSU@"

	db POLITOED
	db LUM_BERRY
	db SURF, ICE_BEAM, HYPNOSIS, TOXIC 
	dw 0 ; OT ID
	dt 344960 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 40000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 11 ; DVs
	db 24, 16, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 269 ; HP
	bigdw 269 ; Max HP
	bigdw 166 ; Atk
	bigdw 173 ; Def
	bigdw 161 ; Spd
	bigdw 194 ; SAtk
	bigdw 208 ; SDef
	db "HUSIGIBANA@"

	db LANTURN
	db MAGNET
	db SURF, THUNDERBOLT, THUNDER_WAVE, ICE_BEAM 
	dw 0 ; OT ID
	dt 428750 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 40000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 11 ; DVs
	db 24, 24, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 318 ; HP
	bigdw 318 ; Max HP
	bigdw 142 ; Atk
	bigdw 149 ; Def
	bigdw 156 ; Spd
	bigdw 175 ; SAtk
	bigdw 175 ; SDef
	db "RIZA-DON@@@"

	db CROBAT
	db LUM_BERRY
	db SLUDGE_BOMB, CRUNCH, TOXIC, DOUBLE_TEAM 
	dw 0 ; OT ID
	dt 343000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 11, 15 ; DVs
	db 16, 24, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 255 ; HP
	bigdw 255 ; Max HP
	bigdw 194 ; Atk
	bigdw 180 ; Def
	bigdw 250 ; Spd
	bigdw 161 ; SAtk
	bigdw 175 ; SDef
	db "KAMEtuKUSU@"

	db RHYDON
	db SITRUS_BERRY
	db ROCK_SLIDE, EARTHQUAKE, ZAP_CANNON, MEGAHORN 
	dw 0 ; OT ID
	dt 428750 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 290 ; HP
	bigdw 290 ; Max HP
	bigdw 250 ; Atk
	bigdw 236 ; Def
	bigdw 124 ; Spd
	bigdw 131 ; SAtk
	bigdw 131 ; SDef
	db "KAMEtuKUSU@"

	
	; Group 8
	
	db ZAPDOS
	db MAGNET
	db THUNDERBOLT, DRILL_PECK, THUNDER_WAVE, AGILITY
	dw 0 ; OT ID
	dt 640000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 32, 32, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 306 ; HP
	bigdw 306 ; Max HP
	bigdw 221 ; Atk
	bigdw 213 ; Def
	bigdw 237 ; Spd
	bigdw 277 ; SAtk
	bigdw 221 ; SDef
	db "SANDA-SU@@@"

	db MOLTRES
	db CHARCOAL
	db FIRE_BLAST, SUNNY_DAY, SOLARBEAM, ANCIENTPOWER 
	dw 0 ; OT ID
	dt 640000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 8, 8, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 306 ; HP
	bigdw 306 ; Max HP
	bigdw 237 ; Atk
	bigdw 221 ; Def
	bigdw 221 ; Spd
	bigdw 277 ; SAtk
	bigdw 213 ; SDef
	db "KABIGON@@@@"

	db ARTICUNO
	db NEVERMELTICE
	db BLIZZARD, SKY_ATTACK, TOXIC, REST 
	dw 0 ; OT ID
	dt 640000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 8, 8, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 306 ; HP
	bigdw 306 ; Max HP
	bigdw 213 ; Atk
	bigdw 237 ; Def
	bigdw 213 ; Spd
	bigdw 229 ; SAtk
	bigdw 277 ; SDef
	db "HERUGA-@@@@"

	db SNORLAX
	db LUM_BERRY
	db DOUBLE_EDGE, EARTHQUAKE, THUNDER, SELFDESTRUCT
	dw 0 ; OT ID
	dt 640000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 16, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 418 ; HP
	bigdw 418 ; Max HP
	bigdw 253 ; Atk
	bigdw 181 ; Def
	bigdw 125 ; Spd
	bigdw 181 ; SAtk
	bigdw 181 ; SDef
	db "KENTAROSU@@"

	db ARCANINE
	db CHARCOAL
	db DOUBLE_EDGE, FIRE_BLAST, EXTREMESPEED, CRUNCH
	dw 0 ; OT ID
	dt 640000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 8, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 306 ; HP
	bigdw 306 ; Max HP
	bigdw 253 ; Atk
	bigdw 205 ; Def
	bigdw 229 ; Spd
	bigdw 237 ; SAtk
	bigdw 205 ; SDef
	db "RAPURASU@@@"

	db EXEGGUTOR
	db TWISTEDSPOON
	db GIGA_DRAIN, SLEEP_POWDER, PSYCHIC_M, EXPLOSION 
	dw 0 ; OT ID
	dt 640000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 8, 24, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 314 ; HP
	bigdw 314 ; Max HP
	bigdw 229 ; Atk
	bigdw 213 ; Def
	bigdw 165 ; Spd
	bigdw 277 ; SAtk
	bigdw 197 ; SDef
	db "BANGIRASU@@"

	db GYARADOS
	db FOCUS_BAND
	db HYDRO_PUMP, THUNDER, EARTHQUAKE, ICY_WIND 
	dw 0 ; OT ID
	dt 640 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 8, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 314 ; HP
	bigdw 314 ; Max HP
	bigdw 277 ; Atk
	bigdw 204 ; Def
	bigdw 207 ; Spd
	bigdw 173 ; SAtk
	bigdw 237 ; SDef
	db "GENGA-@@@@@"

	db VAPOREON
	db CHESTO_BERRY
	db SURF, ICE_BEAM, TOXIC, REST 
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 370 ; HP
	bigdw 370 ; Max HP
	bigdw 181 ; Atk
	bigdw 173 ; Def
	bigdw 181 ; Spd
	bigdw 253 ; SAtk
	bigdw 229 ; SDef
	db "HUoRETOSU@@"

	db JOLTEON
	db MAGNET
	db THUNDERBOLT, THUNDER_WAVE, SHADOW_BALL, HIDDEN_POWER ; ICE 
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 13, 15, 15 ; DVs
	db 24, 32, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 266 ; HP
	bigdw 266 ; Max HP
	bigdw 181 ; Atk
	bigdw 170 ; Def
	bigdw 285 ; Spd
	bigdw 253 ; SAtk
	bigdw 229 ; SDef
	db "KINGUDORA@@"

	db RHYDON
	db LUM_BERRY
	db ROCK_SLIDE, EARTHQUAKE, MEGAHORN, SWORDS_DANCE 
	dw 0 ; OT ID
	dt 640000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 330 ; HP
	bigdw 330 ; Max HP
	bigdw 285 ; Atk
	bigdw 269 ; Def
	bigdw 141 ; Spd
	bigdw 149 ; SAtk
	bigdw 149 ; SDef
	db "KAIRIyu-@@@"

	db AERODACTYL
	db HARD_STONE
	db ROCK_SLIDE, EARTHQUAKE, FIRE_BLAST, CRUNCH
	dw 0 ; OT ID
	dt 640000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 290 ; HP
	bigdw 290 ; Max HP
	bigdw 245 ; Atk
	bigdw 181 ; Def
	bigdw 295 ; Spd
	bigdw 173 ; SAtk
	bigdw 197 ; SDef
	db "PORIGON2@@@"

	db TAUROS
	db SILK_SCARF
	db DOUBLE_EDGE, EARTHQUAKE, FIRE_BLAST, THUNDER
	dw 0 ; OT ID
	dt 640000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 282 ; HP
	bigdw 282 ; Max HP
	bigdw 237 ; Atk
	bigdw 229 ; Def
	bigdw 253 ; Spd
	bigdw 141 ; SAtk
	bigdw 189 ; SDef
	db "RU-ZIyuRA@@"

	db NIDOKING
	db SITRUS_BERRY
	db SLUDGE_BOMB, EARTHQUAKE, THUNDER, ICE_BEAM 
	dw 0 ; OT ID
	dt 526260 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 292 ; HP
	bigdw 292 ; Max HP
	bigdw 242 ; Atk
	bigdw 201 ; Def
	bigdw 213 ; Spd
	bigdw 213 ; SAtk
	bigdw 197 ; SDef
	db "MANTAIN@@@@"

	db JYNX
	db FOCUS_BAND
	db PSYCHIC_M, ICE_BEAM, LOVELY_KISS, NIGHTMARE 
	dw 0 ; OT ID
	dt 512000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 266 ; HP
	bigdw 266 ; Max HP
	bigdw 157 ; Atk
	bigdw 133 ; Def
	bigdw 229 ; Spd
	bigdw 261 ; SAtk
	bigdw 229 ; SDef
	db "EA-MUDO@@@@"

	db STARMIE
	db CHERI_BERRY
	db PSYCHIC_M, SURF, ICE_BEAM, THUNDERBOLT 
	dw 0 ; OT ID
	dt 640000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 24, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 258 ; HP
	bigdw 258 ; Max HP
	bigdw 197 ; Atk
	bigdw 213 ; Def
	bigdw 261 ; Spd
	bigdw 237 ; SAtk
	bigdw 213 ; SDef
	db "HUaIYA-@@@@"

	db CLOYSTER
	db PERSIM_BERRY
	db SURF, ICY_WIND, TOXIC, EXPLOSION
	dw 0 ; OT ID
	dt 640000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 24, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 242 ; HP
	bigdw 242 ; Max HP
	bigdw 229 ; Atk
	bigdw 365 ; Def
	bigdw 189 ; Spd
	bigdw 213 ; SAtk
	bigdw 149 ; SDef
	db "PUTERA@@@@@"

	db GOLEM
	db SOFT_SAND
	db ROCK_SLIDE, EARTHQUAKE, EXPLOSION, FIRE_BLAST 
	dw 0 ; OT ID
	dt 526260 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 8, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 290 ; HP
	bigdw 290 ; Max HP
	bigdw 269 ; Atk
	bigdw 285 ; Def
	bigdw 149 ; Spd
	bigdw 165 ; SAtk
	bigdw 181 ; SDef
	db "MARUMAIN@@@"

	db GENGAR
	db SPELL_TAG
	db SHADOW_BALL, THUNDERBOLT, ICE_PUNCH, EXPLOSION 
	dw 0 ; OT ID
	dt 526260 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 24, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 258 ; HP
	bigdw 258 ; Max HP
	bigdw 181 ; Atk
	bigdw 173 ; Def
	bigdw 253 ; Spd
	bigdw 285 ; SAtk
	bigdw 197 ; SDef
	db "DAGUTORIO@@"

	db MACHAMP
	db BLACKBELT_I
	db CROSS_CHOP, ROCK_SLIDE, EARTHQUAKE, FIRE_BLAST 
	dw 0 ; OT ID
	dt 526260 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 8, 16, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 306 ; HP
	bigdw 306 ; Max HP
	bigdw 285 ; Atk
	bigdw 205 ; Def
	bigdw 165 ; Spd
	bigdw 181 ; SAtk
	bigdw 213 ; SDef
	db "UTUBOtuTO@@"

	db ALAKAZAM
	db LUM_BERRY
	db PSYCHIC_M, DYNAMICPUNCH, RECOVER, FIRE_PUNCH 
	dw 0 ; OT ID
	dt 526260 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 8, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 250 ; HP
	bigdw 250 ; Max HP
	bigdw 157 ; Atk
	bigdw 149 ; Def
	bigdw 269 ; Spd
	bigdw 293 ; SAtk
	bigdw 229 ; SDef
	db "UTUBOtuTO@@"

	db DRAGONITE
	db DRAGON_FANG
	db OUTRAGE, EARTHQUAKE, EXTREMESPEED, FIRE_BLAST 
	dw 0 ; OT ID
	dt 640000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 8, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 308 ; HP
	bigdw 308 ; Max HP
	bigdw 292 ; Atk
	bigdw 229 ; Def
	bigdw 205 ; Spd
	bigdw 237 ; SAtk
	bigdw 237 ; SDef
	db "GURANBURU@@"

	
	; Group 9
	
	db SUICUNE
	db LEFTOVERS
	db SURF, TOXIC, REST, SLEEP_TALK 
	dw 0 ; OT ID
	dt 911250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 361 ; HP
	bigdw 361 ; Max HP
	bigdw 221 ; Atk
	bigdw 293 ; Def
	bigdw 239 ; Spd
	bigdw 248 ; SAtk
	bigdw 293 ; SDef
	db "BURAtuKI-@@"

	db ENTEI
	db CHARCOAL
	db FIRE_BLAST, SUNNY_DAY, SOLARBEAM, PSYCHIC_M 
	dw 0 ; OT ID
	dt 911250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 8, 8, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 388 ; HP
	bigdw 388 ; Max HP
	bigdw 293 ; Atk
	bigdw 239 ; Def
	bigdw 266 ; Spd
	bigdw 248 ; SAtk
	bigdw 221 ; SDef
	db "KAIRIyu-@@@"

	db RAIKOU
	db LEFTOVERS
	db THUNDER, CRUNCH, REST, SLEEP_TALK
	dw 0 ; OT ID
	dt 911250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 343 ; HP
	bigdw 343 ; Max HP
	bigdw 239 ; Atk
	bigdw 221 ; Def
	bigdw 293 ; Spd
	bigdw 293 ; SAtk
	bigdw 266 ; SDef
	db "SUTA-MI-@@@"

	db URSARING
	db SILK_SCARF
	db DOUBLE_EDGE, CROSS_CHOP, ROCK_SLIDE, SWORDS_DANCE 
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 8, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 343 ; HP
	bigdw 343 ; Max HP
	bigdw 320 ; Atk
	bigdw 221 ; Def
	bigdw 185 ; Spd
	bigdw 221 ; SAtk
	bigdw 221 ; SDef
	db "PARUSIeN@@@"

	db FORRETRESS
	db SILK_SCARF
	db PIN_MISSILE, ZAP_CANNON, EXPLOSION, TOXIC 
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 32, 8, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 316 ; HP
	bigdw 316 ; Max HP
	bigdw 248 ; Atk
	bigdw 338 ; Def
	bigdw 158 ; Spd
	bigdw 194 ; SAtk
	bigdw 194 ; SDef
	db "KUROBAtuTO@"

	db QUAGSIRE
	db LEFTOVERS
	db SURF, EARTHQUAKE, RECOVER, TOXIC 
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 352 ; HP
	bigdw 352 ; Max HP
	bigdw 239 ; Atk
	bigdw 239 ; Def
	bigdw 149 ; Spd
	bigdw 203 ; SAtk
	bigdw 203 ; SDef
	db "PORIGON2@@@"

	db ESPEON
	db TWISTEDSPOON
	db PSYCHIC_M, SHADOW_BALL, MORNING_SUN, FUTURE_SIGHT 
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 24, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 298 ; HP
	bigdw 298 ; Max HP
	bigdw 203 ; Atk
	bigdw 194 ; Def
	bigdw 284 ; Spd
	bigdw 320 ; SAtk
	bigdw 257 ; SDef
	db "KINGUDORA@@"

	db UMBREON
	db LUM_BERRY
	db CONFUSE_RAY, TOXIC, CRUNCH, MOONLIGHT 
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 352 ; HP
	bigdw 352 ; Max HP
	bigdw 203 ; Atk
	bigdw 284 ; Def
	bigdw 203 ; Spd
	bigdw 194 ; SAtk
	bigdw 320 ; SDef
	db "BANGIRASU@@"

	db PILOSWINE
	db NEVERMELTICE
	db ICY_WIND, ROCK_SLIDE, EARTHQUAKE, REFLECT
	dw 0 ; OT ID
	dt 911250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 361 ; HP
	bigdw 361 ; Max HP
	bigdw 266 ; Atk
	bigdw 230 ; Def
	bigdw 176 ; Spd
	bigdw 194 ; SAtk
	bigdw 194 ; SDef
	db "RAPURASU@@@"

	db HOUNDOOM
	db BLACKGLASSES
	db CRUNCH, SUNNY_DAY, FIRE_BLAST, SOLARBEAM
	dw 0 ; OT ID
	dt 911250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 8, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 316 ; HP
	bigdw 316 ; Max HP
	bigdw 248 ; Atk
	bigdw 176 ; Def
	bigdw 257 ; Spd
	bigdw 284 ; SAtk
	bigdw 230 ; SDef
	db "E-HUi@@@@@@"

	db BLISSEY
	db LEFTOVERS
	db SEISMIC_TOSS, FLAMETHROWER, TOXIC, SOFTBOILED 
	dw 0 ; OT ID
	dt 583200 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 32, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 640 ; HP
	bigdw 640 ; Max HP
	bigdw 104 ; Atk
	bigdw 104 ; Def
	bigdw 185 ; Spd
	bigdw 221 ; SAtk
	bigdw 329 ; SDef
	db "KAIRIKI-@@@"

	db STEELIX
	db METAL_COAT
	db IRON_TAIL, EARTHQUAKE, REST, CURSE 
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 316 ; HP
	bigdw 316 ; Max HP
	bigdw 239 ; Atk
	bigdw 446 ; Def
	bigdw 140 ; Spd
	bigdw 185 ; SAtk
	bigdw 203 ; SDef
	db "KABIGON@@@@"

	db HERACROSS
	db SILVERPOWDER
	db MEGAHORN, ROCK_SLIDE, EARTHQUAKE, SWORDS_DANCE 
	dw 0 ; OT ID
	dt 911250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 325 ; HP
	bigdw 325 ; Max HP
	bigdw 311 ; Atk
	bigdw 221 ; Def
	bigdw 239 ; Spd
	bigdw 158 ; SAtk
	bigdw 257 ; SDef
	db "UINDEi@@@@@"

	db SCIZOR
	db BRIGHTPOWDER
	db AGILITY, SWORDS_DANCE, STEEL_WING, BATON_PASS 
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 48, 48, 40, 61 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 307 ; HP
	bigdw 307 ; Max HP
	bigdw 320 ; Atk
	bigdw 266 ; Def
	bigdw 203 ; Spd
	bigdw 185 ; SAtk
	bigdw 230 ; SDef
	db "HAPINASU@@@"

	db SKARMORY
	db LEFTOVERS
	db DRILL_PECK, REST, CURSE, TOXIC 
	dw 0 ; OT ID
	dt 911250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 32, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 298 ; HP
	bigdw 298 ; Max HP
	bigdw 230 ; Atk
	bigdw 338 ; Def
	bigdw 212 ; Spd
	bigdw 158 ; SAtk
	bigdw 212 ; SDef
	db "HERUGA-@@@@"

	db KINGDRA
	db LUM_BERRY
	db HYDRO_PUMP, OUTRAGE, ICE_BEAM, REST 
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 8, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 316 ; HP
	bigdw 316 ; Max HP
	bigdw 257 ; Atk
	bigdw 257 ; Def
	bigdw 239 ; Spd
	bigdw 257 ; SAtk
	bigdw 257 ; SDef
	db "EA-MUDO@@@@"

	db PORYGON2
	db LEFTOVERS
	db CURSE, RETURN, ICE_BEAM, RECOVER 
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 32, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 334 ; HP
	bigdw 334 ; Max HP
	bigdw 230 ; Atk
	bigdw 248 ; Def
	bigdw 194 ; Spd
	bigdw 275 ; SAtk
	bigdw 257 ; SDef
	db "TUBOTUBO@@@"

	db PORYGON2
	db SILK_SCARF
	db CURSE, RETURN, PSYCHIC_M, RECOVER 
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 32, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 334 ; HP
	bigdw 334 ; Max HP
	bigdw 230 ; Atk
	bigdw 248 ; Def
	bigdw 194 ; Spd
	bigdw 275 ; SAtk
	bigdw 257 ; SDef
	db "BU-SUTA-@@@"

	db DONPHAN
	db PECHA_BERRY
	db ROCK_SLIDE, EARTHQUAKE, DOUBLE_EDGE, SCARY_FACE 
	dw 0 ; OT ID
	dt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 343 ; HP
	bigdw 343 ; Max HP
	bigdw 302 ; Atk
	bigdw 302 ; Def
	bigdw 176 ; Spd
	bigdw 194 ; SAtk
	bigdw 194 ; SDef
	db "MIRUTANKU@@"

	db TYRANITAR
	db BLACKGLASSES
	db PURSUIT, CRUNCH, ICE_BEAM, EARTHQUAKE 
	dw 0 ; OT ID
	dt 911250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 32, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 361 ; HP
	bigdw 361 ; Max HP
	bigdw 328 ; Atk
	bigdw 284 ; Def
	bigdw 196 ; Spd
	bigdw 257 ; SAtk
	bigdw 266 ; SDef
	db "KENTAROSU@@"

	db TYRANITAR
	db MAGNET
	db ROCK_SLIDE, CRUNCH, THUNDER, EARTHQUAKE 
	dw 0 ; OT ID
	dt 911250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 361 ; HP
	bigdw 361 ; Max HP
	bigdw 328 ; Atk
	bigdw 284 ; Def
	bigdw 196 ; Spd
	bigdw 257 ; SAtk
	bigdw 266 ; SDef
	db "BETOBETON@@"

	
	; Group 10
	
	db ZAPDOS
	db LEFTOVERS
	db THUNDER, HIDDEN_POWER, REST, SLEEP_TALK ; HP = ICE 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 13, 15, 15 ; DVs
	db 16, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 383 ; HP
	bigdw 383 ; Max HP
	bigdw 278 ; Atk
	bigdw 266 ; Def
	bigdw 298 ; Spd
	bigdw 348 ; SAtk
	bigdw 278 ; SDef
	db "HERUGA-@@@@"

	db MEW
	db TWISTEDSPOON
	db PSYCHIC_M, DYNAMICPUNCH, SHADOW_BALL, EXPLOSION 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 8, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 403 ; HP
	bigdw 403 ; Max HP
	bigdw 298 ; Atk
	bigdw 298 ; Def
	bigdw 298 ; Spd
	bigdw 298 ; SAtk
	bigdw 298 ; SDef
	db "KAIRIKI-@@@"

	db MEWTWO
	db LUM_BERRY
	db PSYCHIC_M, FIRE_BLAST, DYNAMICPUNCH, SHADOW_BALL 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 8, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 415 ; HP
	bigdw 415 ; Max HP
	bigdw 318 ; Atk
	bigdw 278 ; Def
	bigdw 358 ; Spd
	bigdw 406 ; SAtk
	bigdw 278 ; SDef
	db "KINGUDORA@@"

	db RAIKOU
	db SITRUS_BERRY
	db THUNDER, CRUNCH, REST, REFLECT 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 24, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 383 ; HP
	bigdw 383 ; Max HP
	bigdw 268 ; Atk
	bigdw 248 ; Def
	bigdw 328 ; Spd
	bigdw 328 ; SAtk
	bigdw 298 ; SDef
	db "SANDA-SU@@@"

	db LUGIA
	db LEFTOVERS
	db CURSE, AEROBLAST, REST, SLEEP_TALK 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 8, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 415 ; HP
	bigdw 415 ; Max HP
	bigdw 278 ; Atk
	bigdw 358 ; Def
	bigdw 318 ; Spd
	bigdw 278 ; SAtk
	bigdw 406 ; SDef
	db "KENTAROSU@@"

	db HO_OH
	db CHARCOAL
	db SACRED_FIRE, THUNDER, EARTHQUAKE, RECOVER
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 8, 16, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 415 ; HP
	bigdw 415 ; Max HP
	bigdw 358 ; Atk
	bigdw 278 ; Def
	bigdw 278 ; Spd
	bigdw 318 ; SAtk
	bigdw 406 ; SDef
	db "UINDEi@@@@@"

	db CELEBI
	db BRIGHTPOWDER
	db GIGA_DRAIN, PSYCHIC_M, RECOVER, THUNDER_WAVE 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 8, 16, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 401 ; HP
	bigdw 401 ; Max HP
	bigdw 298 ; Atk
	bigdw 298 ; Def
	bigdw 298 ; Spd
	bigdw 298 ; SAtk
	bigdw 298 ; SDef
	db "RIZA-DON@@@"

	db TYRANITAR
	db CHESTO_BERRY
	db ROCK_SLIDE, EARTHQUAKE, CURSE, REST 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 403 ; HP
	bigdw 403 ; Max HP
	bigdw 366 ; Atk
	bigdw 318 ; Def
	bigdw 220 ; Spd
	bigdw 288 ; SAtk
	bigdw 298 ; SDef
	db "MARUMAIN@@@"

	db TYRANITAR
	db SITRUS_BERRY
	db CRUNCH, PURSUIT, FIRE_BLAST, THUNDER_WAVE  
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 24, 32, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 403 ; HP
	bigdw 403 ; Max HP
	bigdw 366 ; Atk
	bigdw 318 ; Def
	bigdw 220 ; Spd
	bigdw 288 ; SAtk
	bigdw 298 ; SDef
	db "SAIDON@@@@@"

	db DRAGONITE
	db LUM_BERRY
	db OUTRAGE, FIRE_BLAST, EARTHQUAKE, EXTREMESPEED 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 8, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 385 ; HP
	bigdw 385 ; Max HP
	bigdw 366 ; Atk
	bigdw 288 ; Def
	bigdw 258 ; Spd
	bigdw 298 ; SAtk
	bigdw 298 ; SDef
	db "HAGANE-RU@@"

	db SNORLAX
	db LEFTOVERS
	db REST, EARTHQUAKE, CURSE, DOUBLE_EDGE 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 523 ; HP
	bigdw 523 ; Max HP
	bigdw 318 ; Atk
	bigdw 228 ; Def
	bigdw 158 ; Spd
	bigdw 228 ; SAtk
	bigdw 318 ; SDef
	db "ONIDORIRU@@"

	db STEELIX
	db SILK_SCARF
	db CURSE, EARTHQUAKE, ROCK_SLIDE, EXPLOSION 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 353 ; HP
	bigdw 353 ; Max HP
	bigdw 268 ; Atk
	bigdw 498 ; Def
	bigdw 158 ; Spd
	bigdw 208 ; SAtk
	bigdw 228 ; SDef
	db "MUUMA@@@@@@"

	db HERACROSS
	db SILVERPOWDER
	db MEGAHORN, ROCK_SLIDE, LOW_KICK, SWORDS_DANCE  
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 32, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 363 ; HP
	bigdw 363 ; Max HP
	bigdw 348 ; Atk
	bigdw 248 ; Def
	bigdw 268 ; Spd
	bigdw 178 ; SAtk
	bigdw 288 ; SDef
	db "NIyu-RA@@@@"

	db GENGAR
	db FOCUS_BAND
	db SHADOW_BALL, GIGA_DRAIN, THUNDER, EXPLOSION 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 24, 8, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 323 ; HP
	bigdw 323 ; Max HP
	bigdw 228 ; Atk
	bigdw 218 ; Def
	bigdw 318 ; Spd
	bigdw 358 ; SAtk
	bigdw 248 ; SDef
	db "HAtuSAMU@@@"

	db SUICUNE
	db LEFTOVERS
	db SURF, TOXIC, REST, SLEEP_TALK 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 24, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 403 ; HP
	bigdw 403 ; Max HP
	bigdw 248 ; Atk
	bigdw 328 ; Def
	bigdw 268 ; Spd
	bigdw 278 ; SAtk
	bigdw 328 ; SDef
	db "HAPINASU@@@"

	db QUAGSIRE
	db LUM_BERRY
	db ICY_WIND, SURF, EARTHQUAKE, RECOVER 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 24, 24, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 393 ; HP
	bigdw 393 ; Max HP
	bigdw 268 ; Atk
	bigdw 268 ; Def
	bigdw 168 ; Spd
	bigdw 228 ; SAtk
	bigdw 268 ; SDef
	db "INOMU-@@@@@"

	db JOLTEON
	db MAGNET
	db THUNDER, SHADOW_BALL, SUBSTITUTE, HIDDEN_POWER ; HP = ICE 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 13, 15, 15 ; DVs
	db 16, 24, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 333 ; HP
	bigdw 333 ; Max HP
	bigdw 228 ; Atk
	bigdw 214 ; Def
	bigdw 358 ; Spd
	bigdw 318 ; SAtk
	bigdw 288 ; SDef
	db "NAtuSI-@@@@"

	db MEWTWO
	db BLACKBELT_I
	db ICE_BEAM, THUNDER, DYNAMICPUNCH, SELFDESTRUCT 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 8, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 415 ; HP
	bigdw 415 ; Max HP
	bigdw 318 ; Atk
	bigdw 278 ; Def
	bigdw 358 ; Spd
	bigdw 406 ; SAtk
	bigdw 278 ; SDef
	db "OMUSUTA-@@@"

	db BLISSEY
	db LEFTOVERS
	db SEISMIC_TOSS, FLAMETHROWER, TOXIC, SOFTBOILED 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 32, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 713 ; HP
	bigdw 713 ; Max HP
	bigdw 118 ; Atk
	bigdw 118 ; Def
	bigdw 208 ; Spd
	bigdw 248 ; SAtk
	bigdw 368 ; SDef
	db "GORO-NIya@@"

	db GOLEM
	db CHARCOAL
	db ROCK_SLIDE, EARTHQUAKE, FIRE_BLAST, EXPLOSION 
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 8, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 363 ; HP
	bigdw 363 ; Max HP
	bigdw 338 ; Atk
	bigdw 358 ; Def
	bigdw 188 ; Spd
	bigdw 208 ; SAtk
	bigdw 228 ; SDef
	db "EBIWARA-@@@"

	db ENTEI
	db SITRUS_BERRY
	db FIRE_BLAST, SUNNY_DAY, SOLARBEAM, DOUBLE_EDGE
	dw 0 ; OT ID
	dt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 8, 8, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 433 ; HP
	bigdw 433 ; Max HP
	bigdw 328 ; Atk
	bigdw 268 ; Def
	bigdw 298 ; Spd
	bigdw 278 ; SAtk
	bigdw 248 ; SDef
	db "RANTA-N@@@@"

	assert_table_length 10 * BATTLETOWER_NUM_UNIQUE_MON
