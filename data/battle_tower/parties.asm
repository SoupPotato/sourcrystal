BattleTowerMons:
; 10 groups (one per floor level) of 21 mons (BATTLETOWER_NUM_UNIQUE_MON).
	table_width NICKNAMED_MON_STRUCT_LENGTH

; Group 1


	db YANMA
	db SCOPE_LENS
	db DOUBLE_EDGE, PSYCHIC_M, GUST, SWORDS_DANCE
	dw 0 ; OT ID
	bigdt 1000 ; Exp
	; Stat exp
	bigdw 20000 ; Health
	bigdw 40000 ; Attack
	bigdw 20000 ; Defense
	bigdw 40000 ; Speed
	bigdw 30000 ; Special
	dn 11, 12, 14, 15 ; DVs
	db 24, 16, 56, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 38 ; HP
	bigdw 38 ; Max HP
	bigdw 25 ; Atk
	bigdw 19 ; Def
	bigdw 32 ; Spd
	bigdw 27 ; SAtk
	bigdw 21 ; SDef
	db "SANDA-SU@@@"

	db DELIBIRD
	db NEVERMELTICE
	db DESTINY_BOND, ICE_PUNCH, BODY_SLAM, PRESENT 
	dw 0 ; OT ID
	bigdt 800 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 25000
	bigdw 20000
	bigdw 60000
	bigdw 50000
	dn 14, 11, 15, 15 ; DVs
	db 8, 24, 24, 24 ; PP
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
	bigdt 1250 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 20000
	bigdw 30000
	bigdw 20000
	dn 12, 15, 11, 11 ; DVs
	db 24, 16, 16, 40 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 39 ; HP
	bigdw 39 ; Max HP
	bigdw 28 ; Atk
	bigdw 39 ; Def
	bigdw 24 ; Spd
	bigdw 19 ; SAtk
	bigdw 25 ; SDef
	db "BURAtuKI-@@"

	db CLEFABLE
	db SITRUS_BERRY
	db RETURN, MOONLIGHT, ICY_WIND, SING 
	dw 0 ; OT ID
	bigdt 800 ; Exp
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
	bigdt 800 ; Exp
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
	bigdt 1000 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 30000
	bigdw 20000
	bigdw 20000
	bigdw 10000
	dn 13, 13, 11, 13 ; DVs
	db 24, 48, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 36 ; HP
	bigdw 36 ; Max HP
	bigdw 24 ; Atk
	bigdw 21 ; Def
	bigdw 23 ; Spd
	bigdw 21 ; SAtk
	bigdw 22 ; SDef
	db "SANI-GO@@@@"

	db KANGASKHAN
	db SILK_SCARF
	db GROWL, RETURN, REST, SLEEP_TALK 
	dw 0 ; OT ID
	bigdt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 20000
	bigdw 20000
	bigdw 30000
	dn 15, 15, 11, 11 ; DVs
	db 61, 32, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 48 ; HP
	bigdw 48 ; Max HP
	bigdw 31 ; Atk
	bigdw 27 ; Def
	bigdw 28 ; Spd
	bigdw 19 ; SAtk
	bigdw 27 ; SDef
	db "MIRUTANKU@@"

	db TAUROS
	db NO_ITEM
	db RETURN, SURF, THIEF, HYPER_BEAM
	dw 0 ; OT ID
	bigdt 1250 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	bigdw 20000
	dn 15, 12, 11, 14 ; DVs
	db 32, 24, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 41 ; HP
	bigdw 41 ; Max HP
	bigdw 33 ; Atk
	bigdw 30 ; Def
	bigdw 34 ; Spd
	bigdw 18 ; SAtk
	bigdw 24 ; SDef
	db "PUTERA@@@@@"

	db RAICHU
	db MAGNET
	db THUNDERBOLT, DYNAMICPUNCH, ENCORE, THUNDER_WAVE 
	dw 0 ; OT ID
	bigdt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 20000
	bigdw 20000
	bigdw 60000
	bigdw 30000
	dn 12, 12, 13, 14 ; DVs
	db 24, 8, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 36 ; HP
	bigdw 36 ; Max HP
	bigdw 28 ; Atk
	bigdw 21 ; Def
	bigdw 35 ; Spd
	bigdw 29 ; SAtk
	bigdw 27 ; SDef
	db "RAPURASU@@@"

	db SNEASEL
	db LUM_BERRY
	db FRUSTRATION, LOW_KICK, PURSUIT, SWORDS_DANCE
	dw 0 ; OT ID
	bigdt 560 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	bigdw 30000
	dn 15, 11, 11, 15 ; DVs
	db 32, 32, 32, 48 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 37 ; HP
	bigdw 37 ; Max HP
	bigdw 31 ; Atk
	bigdw 24 ; Def
	bigdw 35 ; Spd
	bigdw 18 ; SAtk
	bigdw 26 ; SDef
	db "NIyu-RA@@@@"

	db STARMIE
	db LUM_BERRY
	db SURF, THUNDER_WAVE, RECOVER, PSYCHIC_M
	dw 0 ; OT ID
	bigdt 1250 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 40000
	bigdw 40000
	dn 11, 11, 14, 15 ; DVs
	db 24, 32, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 39 ; HP
	bigdw 39 ; Max HP
	bigdw 26 ; Atk
	bigdw 29 ; Def
	bigdw 36 ; Spd
	bigdw 32 ; SAtk
	bigdw 29 ; SDef
	db "PORIGON2@@@"

	db FLAREON
	db BRIGHTPOWDER
	db SUBSTITUTE, FLAMETHROWER, DOUBLE_EDGE, MUD_SLAP
	dw 0 ; OT ID
	bigdt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 20000
	bigdw 40000
	dn 15, 13, 11, 9 ; DVs
	db 16, 24, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 40 ; HP
	bigdw 40 ; Max HP
	bigdw 39 ; Atk
	bigdw 23 ; Def
	bigdw 23 ; Spd
	bigdw 31 ; SAtk
	bigdw 34 ; SDef
	db "MUUMA@@@@@@"

	db JOLTEON
	db MAGNET
	db THUNDERBOLT, SHADOW_BALL, THUNDER_WAVE, MIMIC 
	dw 0 ; OT ID
	bigdt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 20000
	bigdw 50000
	bigdw 40000
	dn 14, 11, 15, 15 ; DVs
	db 24, 24, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 40 ; HP
	bigdw 40 ; Max HP
	bigdw 25 ; Atk
	bigdw 23 ; Def
	bigdw 38 ; Spd
	bigdw 34 ; SAtk
	bigdw 31 ; SDef
	db "DERUBIRU@@@"

	db LICKITUNG
	db SILK_SCARF
	db MEGA_PUNCH, IRON_TAIL, FLAMETHROWER, HYPER_BEAM
	dw 0 ; OT ID
	bigdt 1000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 20000
	bigdw 20000
	dn 15, 15, 9, 8 ; DVs
	db 32, 24, 24, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 46 ; HP
	bigdw 46 ; Max HP
	bigdw 23 ; Atk
	bigdw 27 ; Def
	bigdw 16 ; Spd
	bigdw 22 ; SAtk
	bigdw 25 ; SDef
	db "KIRINRIKI@@"

	db SLOWKING
	db LEFTOVERS
	db SURF, THUNDERPUNCH, THUNDER_WAVE, FLASH 
	dw 0 ; OT ID
	bigdt 1000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 10000
	bigdw 30000
	bigdw 20000
	bigdw 30000
	dn 8, 15, 12, 1 ; DVs
	db 24, 24, 32, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 45 ; HP
	bigdw 45 ; Max HP
	bigdw 24 ; Atk
	bigdw 28 ; Def
	bigdw 14 ; Spd
	bigdw 31 ; SAtk
	bigdw 33 ; SDef
	db "HAPINASU@@@"

	db GIRAFARIG
	db TWISTEDSPOON
	db PSYCHIC_M, RETURN, LOW_KICK, SHADOW_BALL
	dw 0 ; OT ID
	bigdt 1000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 20000
	bigdw 40000
	bigdw 30000
	dn 13, 8, 14, 11 ; DVs
	db 16, 24, 32, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 40 ; HP
	bigdw 40 ; Max HP
	bigdw 28 ; Atk
	bigdw 23 ; Def
	bigdw 29 ; Spd
	bigdw 30 ; SAtk
	bigdw 25 ; SDef
	db "KABIGON@@@@"

	db SUDOWOODO
	db HARD_STONE
	db LOW_KICK, FLAIL, HARDEN, ROCK_SLIDE
	dw 0 ; OT ID
	bigdt 1000 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 40000
	bigdw 30000
	bigdw 20000
	bigdw 20000
	dn 15, 15, 9, 9 ; DVs
	db 32, 24, 48, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 37 ; HP
	bigdw 37 ; Max HP
	bigdw 33 ; Atk
	bigdw 34 ; Def
	bigdw 16 ; Spd
	bigdw 17 ; SAtk
	bigdw 24 ; SDef
	db "NAtuSI-@@@@"

	db AIPOM
	db SILK_SCARF
	db RETURN, BATON_PASS, DOUBLE_TEAM, PURSUIT
	dw 0 ; OT ID
	bigdt 800 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 15, 12, 11, 14 ; DVs
	db 24, 61, 24, 32 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 37 ; HP
	bigdw 37 ; Max HP
	bigdw 26 ; Atk
	bigdw 22 ; Def
	bigdw 29 ; Spd
	bigdw 19 ; SAtk
	bigdw 22 ; SDef
	db "HERAKUROSU@"

	db SUNFLORA
	db MIRACLE_SEED
	db MEGA_DRAIN, PSYCHIC_M, GROWTH, HIDDEN_POWER ; HP = FIRE
	dw 0 ; OT ID
	bigdt 560 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 20000
	bigdw 20000
	bigdw 20000
	bigdw 50000
	dn 10, 12, 14, 13 ; DVs
	db 24, 16, 61, 24 ; PP
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
	bigdt 1000 ; Exp
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
	db LEFTOVERS
	db SURF, SHADOW_BALL, MUD_SLAP, TOXIC 
	dw 0 ; OT ID
	bigdt 1000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 20000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	dn 11, 13, 13, 14 ; DVs
	db 24, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 53 ; HP
	bigdw 53 ; Max HP
	bigdw 23 ; Atk
	bigdw 24 ; Def
	bigdw 25 ; Spd
	bigdw 33 ; SAtk
	bigdw 30 ; SDef
	db "BARIYA-DO@@"

	
	; Group 2
	
	db RATICATE
	db FOCUS_BAND
	db FOCUS_ENERGY, RETURN, REVERSAL, BITE 
	dw 0 ; OT ID
	bigdt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 40000
	dn 13, 12, 11, 14 ; DVs
	db 48, 32, 24, 40 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 65 ; HP
	bigdw 65 ; Max HP
	bigdw 53 ; Atk
	bigdw 42 ; Def
	bigdw 58 ; Spd
	bigdw 39 ; SAtk
	bigdw 47 ; SDef
	db "BURAtuKI-@@"

	db FEAROW
	db BRIGHTPOWDER
	db PURSUIT, TRI_ATTACK, MUD_SLAP, DOUBLE_TEAM
	dw 0 ; OT ID
	bigdt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	dn 14, 11, 13, 14 ; DVs
	db 32, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 68 ; HP
	bigdw 68 ; Max HP
	bigdw 55 ; Atk
	bigdw 44 ; Def
	bigdw 60 ; Spd
	bigdw 44 ; SAtk
	bigdw 44 ; SDef
	db "SUTA-MI-@@@"

	db FEAROW
	db LEFTOVERS
	db REST, SLEEP_TALK, RETURN, MUD_SLAP
	dw 0 ; OT ID
	bigdt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	dn 14, 11, 13, 14 ; DVs
	db 16, 16, 32, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 68 ; HP
	bigdw 68 ; Max HP
	bigdw 55 ; Atk
	bigdw 44 ; Def
	bigdw 60 ; Spd
	bigdw 44 ; SAtk
	bigdw 44 ; SDef
	db "GIyaRADOSU@"

	db DUNSPARCE
	db SILK_SCARF
	db FIRE_BLAST, EARTHQUAKE, AGILITY, RETURN
	dw 0 ; OT ID
	bigdt 8000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 40000
	dn 15, 13, 13, 12 ; DVs
	db 8, 16, 48, 32 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 87 ; HP
	bigdw 87 ; Max HP
	bigdw 47 ; Atk
	bigdw 46 ; Def
	bigdw 36 ; Spd
	bigdw 46 ; SAtk
	bigdw 46 ; SDef
	db "HAGANE-RU@@"

	db GLIGAR
	db SOFT_SAND
	db ROCK_SLIDE, WING_ATTACK, EARTHQUAKE, SWORDS_DANCE
	dw 0 ; OT ID
	bigdt 5460 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	bigdw 20000
	dn 14, 14, 11, 13 ; DVs
	db 16, 56, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 68 ; HP
	bigdw 68 ; Max HP
	bigdw 50 ; Atk
	bigdw 61 ; Def
	bigdw 52 ; Spd
	bigdw 30 ; SAtk
	bigdw 42 ; SDef
	db "HU-DEiN@@@@"

	db QWILFISH
	db POISON_BARB
	db SURF, EXPLOSION, THUNDER_WAVE, SLUDGE_BOMB
	dw 0 ; OT ID
	bigdt 8000 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 30000
	bigdw 40000
	bigdw 40000
	bigdw 30000
	dn 12, 14, 14, 12 ; DVs
	db 24, 8, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 63 ; HP
	bigdw 63 ; Max HP
	bigdw 56 ; Atk
	bigdw 50 ; Def
	bigdw 53 ; Spd
	bigdw 41 ; SAtk
	bigdw 41 ; SDef
	db "UINDEi@@@@@"

	db CORSOLA
	db MYSTIC_WATER
	db EXPLOSION, SURF, EARTHQUAKE, RECOVER
	dw 0 ; OT ID
	bigdt 6400 ; Exp
	; Stat exp
	bigdw 20000
	bigdw 40000
	bigdw 40000
	bigdw 20000
	bigdw 30000
	dn 13, 15, 11, 12 ; DVs
	db 8, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 68 ; HP
	bigdw 68 ; Max HP
	bigdw 42 ; Atk
	bigdw 59 ; Def
	bigdw 30 ; Spd
	bigdw 44 ; SAtk
	bigdw 56 ; SDef
	db "HERAKUROSU@"

	db DELIBIRD
	db NO_ITEM
	db PRESENT, ICE_BEAM, THIEF, DESTINY_BOND
	dw 0 ; OT ID
	bigdt 6400 ; Exp
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
	bigdt 10000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	bigdw 30000
	dn 14, 13, 12, 14 ; DVs
	db 32, 24, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 69 ; HP
	bigdw 69 ; Max HP
	bigdw 58 ; Atk
	bigdw 43 ; Def
	bigdw 55 ; Spd
	bigdw 52 ; SAtk
	bigdw 44 ; SDef
	db "PUTERA@@@@@"

	db HITMONLEE
	db BLACKBELT_I
	db HI_JUMP_KICK, ROCK_SLIDE, EARTHQUAKE, SWORDS_DANCE 
	dw 0 ; OT ID
	bigdt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 15, 9, 11, 15 ; DVs
	db 48, 32, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 66 ; HP
	bigdw 66 ; Max HP
	bigdw 70 ; Atk
	bigdw 38 ; Def
	bigdw 54 ; Spd
	bigdw 32 ; SAtk
	bigdw 62 ; SDef
	db "HAPINASU@@@"

	db HITMONCHAN
	db BLACKBELT_I
	db MACH_PUNCH, COUNTER, EARTHQUAKE, ICE_PUNCH
	dw 0 ; OT ID
	bigdt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 15, 9, 11, 15 ; DVs
	db 48, 32, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 66 ; HP
	bigdw 66 ; Max HP
	bigdw 64 ; Atk
	bigdw 48 ; Def
	bigdw 50 ; Spd
	bigdw 32 ; SAtk
	bigdw 62 ; SDef
	db "RAPURASU@@@"

	db LICKITUNG
	db LEFTOVERS
	db FIRE_BLAST, SEISMIC_TOSS, REST, SLEEP_TALK 
	dw 0 ; OT ID
	bigdt 8000 ; Exp
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
	bigdt 8000 ; Exp
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
	bigdt 6400 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	dn 15, 15, 15, 15 ; DVs
	db 32, 8, 32, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 66 ; HP
	bigdw 66 ; Max HP
	bigdw 35 ; Atk
	bigdw 53 ; Def
	bigdw 35 ; Spd
	bigdw 51 ; SAtk
	bigdw 61 ; SDef
	db "EBIWARA-@@@"

	db GYARADOS
	db MYSTIC_WATER
	db DOUBLE_EDGE, ICE_BEAM, EARTHQUAKE, SURF
	dw 0 ; OT ID
	bigdt 10000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 40000
	dn 15, 13, 12, 12 ; DVs
	db 24, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 81 ; HP
	bigdw 81 ; Max HP
	bigdw 72 ; Atk
	bigdw 50 ; Def
	bigdw 50 ; Spd
	bigdw 43 ; SAtk
	bigdw 59 ; SDef
	db "KENTAROSU@@"

	db GYARADOS
	db KINGS_ROCK
	db SUBSTITUTE, RETURN, THUNDER_WAVE, WATERFALL 
	dw 0 ; OT ID
	bigdt 10000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 40000
	dn 15, 11, 15, 13 ; DVs
	db 16, 32, 32, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 81 ; HP
	bigdw 81 ; Max HP
	bigdw 72 ; Atk
	bigdw 50 ; Def
	bigdw 50 ; Spd
	bigdw 43 ; SAtk
	bigdw 59 ; SDef
	db "MARIRURI@@@"

	db LAPRAS
	db LUM_BERRY
	db SURF, SING, BODY_SLAM, ICE_BEAM 
	dw 0 ; OT ID
	bigdt 10000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 40000
	dn 11, 13, 13, 11 ; DVs
	db 24, 24, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 100 ; HP
	bigdw 100 ; Max HP
	bigdw 52 ; Atk
	bigdw 50 ; Def
	bigdw 42 ; Spd
	bigdw 54 ; SAtk
	bigdw 58 ; SDef
	db "MIRUTANKU@@"

	db FURRET
	db SILK_SCARF
	db RETURN, THUNDER, BLIZZARD, QUICK_ATTACK
	dw 0 ; OT ID
	bigdt 8000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 40000
	bigdw 40000
	dn 14, 13, 14, 15 ; DVs
	db 32, 16, 8, 48 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 75 ; HP
	bigdw 75 ; Max HP
	bigdw 51 ; Atk
	bigdw 44 ; Def
	bigdw 57 ; Spd
	bigdw 38 ; SAtk
	bigdw 42 ; SDef
	db "PUKURIN@@@@"

	db NOCTOWL
	db SPELL_TAG
	db RETURN, SHADOW_BALL, REST, SLEEP_TALK 
	dw 0 ; OT ID
	bigdt 8000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 40000
	bigdw 20000
	bigdw 40000
	dn 14, 13, 14, 11 ; DVs
	db 32, 24, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 82 ; HP
	bigdw 82 ; Max HP
	bigdw 39 ; Atk
	bigdw 40 ; Def
	bigdw 46 ; Spd
	bigdw 54 ; SAtk
	bigdw 59 ; SDef
	db "PUKURIN@@@@"

	db PIKACHU
	db LIGHT_BALL
	db THUNDER, IRON_TAIL, DOUBLE_TEAM, HIDDEN_POWER ; HP = ICE
	dw 0 ; OT ID
	bigdt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 14, 14, 14, 14 ; DVs
	db 16, 24, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 55 ; HP
	bigdw 55 ; Max HP
	bigdw 43 ; Atk
	bigdw 37 ; Def
	bigdw 57 ; Spd
	bigdw 41 ; SAtk
	bigdw 41 ; SDef
	db "NIDOKINGU@@"

	db QUAGSIRE
	db LEFTOVERS
	db SURF, EARTHQUAKE, ICY_WIND, RECOVER
	dw 0 ; OT ID
	bigdt 8000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	dn 11, 13, 13, 9 ; DVs
	db 24, 16, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 85 ; HP
	bigdw 85 ; Max HP
	bigdw 52 ; Atk
	bigdw 54 ; Def
	bigdw 31 ; Spd
	bigdw 44 ; SAtk
	bigdw 44 ; SDef
	db "NUO-@@@@@@@"

	
	; Group 3
	
	db CLEFABLE
	db SITRUS_BERRY
	db MOONLIGHT, BELLY_DRUM, RETURN, FLAMETHROWER 
	dw 0 ; OT ID
	bigdt 21600 ; Exp
	; Stat exp
	bigdw 45000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	dn 14, 14, 13, 11 ; DVs
	db 8, 16, 32, 24 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 114 ; HP
	bigdw 114 ; Max HP
	bigdw 68 ; Atk
	bigdw 74 ; Def
	bigdw 62 ; Spd
	bigdw 82 ; SAtk
	bigdw 79 ; SDef
	db "SANDA-SU@@@"

	db BELLOSSOM
	db MIRACLE_SEED
	db SLEEP_POWDER, SYNTHESIS, GIGA_DRAIN, SLUDGE_BOMB
	dw 0 ; OT ID
	bigdt 21760 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	dn 11, 12, 13, 11 ; DVs
	db 24, 8, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 104 ; HP
	bigdw 104 ; Max HP
	bigdw 72 ; Atk
	bigdw 82 ; Def
	bigdw 54 ; Spd
	bigdw 83 ; SAtk
	bigdw 89 ; SDef
	db "NIyoROBON@@"

	db JUMPLUFF
	db LEFTOVERS
	db SUBSTITUTE, LEECH_SEED, SLEEP_POWDER, DOUBLE_TEAM
	dw 0 ; OT ID
	bigdt 21760 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	dn 11, 14, 11, 15 ; DVs
	db 16, 16, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 104 ; HP
	bigdw 104 ; Max HP
	bigdw 57 ; Atk
	bigdw 70 ; Def
	bigdw 96 ; Spd
	bigdw 59 ; SAtk
	bigdw 83 ; SDef
	db "SUTA-MI-@@@"

	db SLOWBRO
	db TWISTEDSPOON
	db SURF, FUTURE_SIGHT, THUNDER_WAVE, FIRE_BLAST
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 10000
	bigdw 30000
	dn 9, 15, 13, 9 ; DVs
	db 24, 24, 32, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 122 ; HP
	bigdw 122 ; Max HP
	bigdw 68 ; Atk
	bigdw 96 ; Def
	bigdw 35 ; Spd
	bigdw 85 ; SAtk
	bigdw 73 ; SDef
	db "RU-ZIyuRA@@"

	db MAGNETON
	db MAGNET
	db THUNDER, SUPERSONIC, TRI_ATTACK, EXPLOSION
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 20000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	dn 13, 12, 14, 11 ; DVs
	db 16, 32, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 91 ; HP
	bigdw 91 ; Max HP
	bigdw 59 ; Atk
	bigdw 82 ; Def
	bigdw 66 ; Spd
	bigdw 102 ; SAtk
	bigdw 72 ; SDef
	db "DAGUTORIO@@"

	db MAGNETON
	db MAGNET
	db THUNDER, RAIN_DANCE, HIDDEN_POWER, EXPLOSION ; HP = WATER
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 20000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	dn 6, 13, 14, 13 ; DVs
	db 16, 8, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 88 ; HP
	bigdw 88 ; Max HP
	bigdw 55 ; Atk
	bigdw 82 ; Def
	bigdw 67 ; Spd
	bigdw 102 ; SAtk
	bigdw 72 ; SDef
	db "KIREIHANA@@"

	db KINGLER
	db LUM_BERRY
	db SWORDS_DANCE, METAL_CLAW, DOUBLE_EDGE, ROCK_SLIDE 
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	dn 13, 13, 14, 12 ; DVs
	db 48, 56, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 93 ; HP
	bigdw 93 ; Max HP
	bigdw 105 ; Atk
	bigdw 96 ; Def
	bigdw 70 ; Spd
	bigdw 60 ; SAtk
	bigdw 60 ; SDef
	db "HAPINASU@@@"

	db ELECTRODE
	db NO_ITEM
	db ZAP_CANNON, EXPLOSION, THIEF, TOXIC 
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 20000
	bigdw 50000
	bigdw 50000
	dn 11, 11, 14, 15 ; DVs
	db 8, 8, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 97 ; HP
	bigdw 97 ; Max HP
	bigdw 54 ; Atk
	bigdw 64 ; Def
	bigdw 120 ; Spd
	bigdw 78 ; SAtk
	bigdw 78 ; SDef
	db "HERUGA-@@@@"

	db MAROWAK
	db THICK_CLUB
	db SWORDS_DANCE, BONE_RUSH, ROCK_SLIDE, LOW_KICK 
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 20000
	dn 15, 13, 13, 11 ; DVs
	db 48, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 97 ; HP
	bigdw 97 ; Max HP
	bigdw 78 ; Atk
	bigdw 95 ; Def
	bigdw 51 ; Spd
	bigdw 53 ; SAtk
	bigdw 71 ; SDef
	db "KAIRIKI-@@@"

	db HITMONTOP
	db BLACKBELT_I
	db HI_JUMP_KICK, PURSUIT, EARTHQUAKE, DOUBLE_TEAM
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 40000
	dn 14, 14, 11, 12 ; DVs
	db 32, 32, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 85 ; HP
	bigdw 85 ; Max HP
	bigdw 87 ; Atk
	bigdw 83 ; Def
	bigdw 67 ; Spd
	bigdw 47 ; SAtk
	bigdw 92 ; SDef
	db "KUROBAtuTO@"

	db MR__MIME
	db TWISTEDSPOON
	db PSYCHIC_M, ENCORE, SHADOW_BALL, FIRE_PUNCH 
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 13, 13, 14, 14 ; DVs
	db 16, 8, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 84 ; HP
	bigdw 84 ; Max HP
	bigdw 52 ; Atk
	bigdw 68 ; Def
	bigdw 80 ; Spd
	bigdw 88 ; SAtk
	bigdw 100 ; SDef
	db "PORIGON2@@@"

	db SCYTHER
	db SILK_SCARF
	db WING_ATTACK, AGILITY, BATON_PASS, QUICK_ATTACK 
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	dn 15, 13, 13, 12 ; DVs
	db 56, 48, 61, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 102 ; HP
	bigdw 102 ; Max HP
	bigdw 96 ; Atk
	bigdw 73 ; Def
	bigdw 90 ; Spd
	bigdw 58 ; SAtk
	bigdw 73 ; SDef
	db "GARAGARA@@@"

	db ARIADOS
	db LUM_BERRY
	db NIGHT_SHADE, TOXIC, GIGA_DRAIN, PSYCHIC_M 
	dw 0 ; OT ID
	bigdt 21600 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	dn 14, 13, 14, 13 ; DVs
	db 24, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 98 ; HP
	bigdw 98 ; Max HP
	bigdw 84 ; Atk
	bigdw 67 ; Def
	bigdw 51 ; Spd
	bigdw 62 ; SAtk
	bigdw 67 ; SDef
	db "MARUMAIN@@@"

	db ARIADOS
	db BLACKGLASSES
	db SWORDS_DANCE, MEGAHORN, RETURN, PURSUIT  
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	dn 14, 13, 14, 13 ; DVs
	db 48, 16, 32, 32 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 98 ; HP
	bigdw 98 ; Max HP
	bigdw 84 ; Atk
	bigdw 67 ; Def
	bigdw 51 ; Spd
	bigdw 62 ; SAtk
	bigdw 67 ; SDef
	db "RAPURASU@@@"

	db ARBOK
	db BRIGHTPOWDER
	db CRUNCH, PURSUIT, IRON_TAIL, SLUDGE_BOMB 
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	dn 14, 14, 13, 14 ; DVs
	db 24, 32, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 81 ; HP
	bigdw 81 ; Max HP
	bigdw 87 ; Atk
	bigdw 61 ; Def
	bigdw 69 ; Spd
	bigdw 58 ; SAtk
	bigdw 66 ; SDef
	db "RANTA-N@@@@"

	db VILEPLUME
	db MIRACLE_SEED
	db SWORDS_DANCE, SLUDGE_BOMB, GIGA_DRAIN, SWAGGER
	dw 0 ; OT ID
	bigdt 21760 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	dn 12, 13, 14, 13 ; DVs
	db 48, 16, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 110 ; HP
	bigdw 110 ; Max HP
	bigdw 72 ; Atk
	bigdw 77 ; Def
	bigdw 57 ; Spd
	bigdw 85 ; SAtk
	bigdw 79 ; SDef
	db "E-HUi@@@@@@"

	db PARASECT
	db MIRACLE_SEED
	db SPORE, LEECH_SEED, GIGA_DRAIN, SLUDGE_BOMB
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	bigdw 30000
	dn 12, 13, 14, 13 ; DVs
	db 24, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 96 ; HP
	bigdw 96 ; Max HP
	bigdw 82 ; Atk
	bigdw 73 ; Def
	bigdw 47 ; Spd
	bigdw 62 ; SAtk
	bigdw 74 ; SDef
	db "DOKUKURAGE@"

	db POLIWRATH
	db BLACKBELT_I
	db DYNAMICPUNCH, SURF, ICY_WIND, HYPNOSIS 
	dw 0 ; OT ID
	bigdt 21760 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 14, 14, 14, 14 ; DVs
	db 8, 24, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 110 ; HP
	bigdw 110 ; Max HP
	bigdw 87 ; Atk
	bigdw 87 ; Def
	bigdw 72 ; Spd
	bigdw 72 ; SAtk
	bigdw 84 ; SDef
	db "GENGA-@@@@@"

	db VICTREEBEL
	db SITRUS_BERRY
	db SLEEP_POWDER, SLUDGE_BOMB, GIGA_DRAIN, REFLECT
	dw 0 ; OT ID
	bigdt 21760 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 11, 14, 13, 14 ; DVs
	db 24, 16, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 106 ; HP
	bigdw 106 ; Max HP
	bigdw 89 ; Atk
	bigdw 69 ; Def
	bigdw 68 ; Spd
	bigdw 87 ; SAtk
	bigdw 69 ; SDef
	db "RINGUMA@@@@"

	db FARFETCH_D
	db STICK
	db RETURN, FEINT_ATTACK, QUICK_ATTACK, SWORDS_DANCE 
	dw 0 ; OT ID
	bigdt 27000 ; Exp
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
	db POISON_BARB
	db EARTHQUAKE, ROCK_SLIDE, BEAT_UP, SLUDGE_BOMB
	dw 0 ; OT ID
	bigdt 27000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	dn 14, 11, 13, 15 ; DVs
	db 16, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 78 ; HP
	bigdw 78 ; Max HP
	bigdw 90 ; Atk
	bigdw 54 ; Def
	bigdw 101 ; Spd
	bigdw 55 ; SAtk
	bigdw 67 ; SDef
	db "OKORIZARU@@"

	
	; Group 4
	
	db MAGMAR
	db SCOPE_LENS
	db FLAMETHROWER, CROSS_CHOP, CONFUSE_RAY, THUNDERPUNCH 
	dw 0 ; OT ID
	bigdt 64000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	bigdw 50000
	dn 13, 12, 15, 9 ; DVs
	db 24, 8, 16, 13 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 128 ; HP
	bigdw 128 ; Max HP
	bigdw 113 ; Atk
	bigdw 77 ; Def
	bigdw 106 ; Spd
	bigdw 119 ; SAtk
	bigdw 107 ; SDef
	db "KENTAROSU@@"

	db DEWGONG
	db SITRUS_BERRY
	db ENCORE, ICE_BEAM, SURF, PERISH_SONG
	dw 0 ; OT ID
	bigdt 64000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 20000
	bigdw 40000
	bigdw 40000
	bigdw 50000
	dn 9, 12, 14, 13 ; DVs
	db 8, 16, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 150 ; HP
	bigdw 150 ; Max HP
	bigdw 82 ; Atk
	bigdw 95 ; Def
	bigdw 88 ; Spd
	bigdw 92 ; SAtk
	bigdw 112 ; SDef
	db "KINGUDORA@@"

	db HYPNO
	db LEFTOVERS
	db SEISMIC_TOSS, PSYCHIC_M, SLEEP_TALK, REST 
	dw 0 ; OT ID
	bigdt 64000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 12, 11, 14, 13 ; DVs
	db 32, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 142 ; HP
	bigdw 142 ; Max HP
	bigdw 90 ; Atk
	bigdw 92 ; Def
	bigdw 86 ; Spd
	bigdw 94 ; SAtk
	bigdw 128 ; SDef
	db "KABIGON@@@@"

	db EXEGGUTOR
	db TWISTEDSPOON
	db GIGA_DRAIN, PSYCHIC_M, SLEEP_POWDER, LOW_KICK
	dw 0 ; OT ID
	bigdt 80000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	dn 14, 11, 15, 13 ; DVs
	db 8, 16, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 151 ; HP
	bigdw 151 ; Max HP
	bigdw 109 ; Atk
	bigdw 104 ; Def
	bigdw 76 ; Spd
	bigdw 137 ; SAtk
	bigdw 97 ; SDef
	db "RAPURASU@@@"

	db WEEZING
	db POISON_BARB
	db SLUDGE_BOMB, FIRE_BLAST, SHADOW_BALL, EXPLOSION 
	dw 0 ; OT ID
	bigdt 64000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	dn 11, 15, 12, 11 ; DVs
	db 16, 8, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 133 ; HP
	bigdw 133 ; Max HP
	bigdw 103 ; Atk
	bigdw 133 ; Def
	bigdw 79 ; Spd
	bigdw 105 ; SAtk
	bigdw 93 ; SDef
	db "HAGANE-RU@@"

	db BUTTERFREE
	db NO_ITEM
	db PSYCHIC_M, SLEEP_POWDER, CHARM, THIEF
	dw 0 ; OT ID
	bigdt 64000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	dn 13, 11, 14, 13 ; DVs
	db 16, 24, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 123 ; HP
	bigdw 123 ; Max HP
	bigdw 68 ; Atk
	bigdw 71 ; Def
	bigdw 88 ; Spd
	bigdw 110 ; SAtk
	bigdw 102 ; SDef
	db "HU-DEiN@@@@"

	db TYPHLOSION
	db MAGNET
	db FIRE_BLAST, SHADOW_BALL, LOW_KICK, THUNDERPUNCH
	dw 0 ; OT ID
	bigdt 56660 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 40000
	bigdw 50000
	dn 12, 13, 15, 13 ; DVs
	db 8, 24, 32, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 135 ; HP
	bigdw 135 ; Max HP
	bigdw 101 ; Atk
	bigdw 95 ; Def
	bigdw 115 ; Spd
	bigdw 126 ; SAtk
	bigdw 107 ; SDef
	db "SUTA-MI-@@@"

	db FERALIGATR
	db KINGS_ROCK
	db HYDRO_PUMP, CRUNCH, EARTHQUAKE, AGILITY 
	dw 0 ; OT ID
	bigdt 56660 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	dn 13, 15, 12, 13 ; DVs
	db 8, 24, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 149 ; HP
	bigdw 149 ; Max HP
	bigdw 119 ; Atk
	bigdw 114 ; Def
	bigdw 100 ; Spd
	bigdw 97 ; SAtk
	bigdw 101 ; SDef
	db "SO-NANSU@@@"

	db FERALIGATR
	db MYSTIC_WATER
	db HYDRO_PUMP, ROCK_SLIDE, EARTHQUAKE, SWORDS_DANCE
	dw 0 ; OT ID
	bigdt 56660 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	dn 13, 15, 12, 13 ; DVs
	db 8, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 149 ; HP
	bigdw 149 ; Max HP
	bigdw 119 ; Atk
	bigdw 114 ; Def
	bigdw 100 ; Spd
	bigdw 97 ; SAtk
	bigdw 101 ; SDef
	db "SO-NANSU@@@"

	db MEGANIUM
	db LUM_BERRY
	db SWORDS_DANCE, RETURN, EARTHQUAKE, SYNTHESIS 
	dw 0 ; OT ID
	bigdt 56660 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 13, 15, 13, 12 ; DVs
	db 48, 24, 16, 8 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 146 ; HP
	bigdw 146 ; Max HP
	bigdw 101 ; Atk
	bigdw 119 ; Def
	bigdw 95 ; Spd
	bigdw 101 ; SAtk
	bigdw 115 ; SDef
	db "HAtuSAMU@@@"

	db MEGANIUM
	db SITRUS_BERRY
	db PETAL_DANCE, SYNTHESIS, BODY_SLAM, REFLECT 
	dw 0 ; OT ID
	bigdt 56660 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 13, 15, 13, 12 ; DVs
	db 10, 8, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 146 ; HP
	bigdw 146 ; Max HP
	bigdw 101 ; Atk
	bigdw 119 ; Def
	bigdw 95 ; Spd
	bigdw 101 ; SAtk
	bigdw 115 ; SDef
	db "DAGUTORIO@@"

	db YANMA
	db SPELL_TAG
	db HYPNOSIS, DOUBLE_EDGE, ANCIENTPOWER, SHADOW_BALL
	dw 0 ; OT ID
	bigdt 64000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	bigdw 40000
	dn 13, 14, 13, 14 ; DVs
	db 24, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 126 ; HP
	bigdw 126 ; Max HP
	bigdw 87 ; Atk
	bigdw 69 ; Def
	bigdw 109 ; Spd
	bigdw 95 ; SAtk
	bigdw 71 ; SDef
	db "YADORAN@@@@"

	db MUK
	db BRIGHTPOWDER
	db MINIMIZE, EXPLOSION, SLUDGE_BOMB, FIRE_BLAST 
	dw 0 ; OT ID
	bigdt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	dn 14, 15, 13, 11 ; DVs
	db 32, 8, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 162 ; HP
	bigdw 162 ; Max HP
	bigdw 117 ; Atk
	bigdw 97 ; Def
	bigdw 71 ; Spd
	bigdw 84 ; SAtk
	bigdw 112 ; SDef
	db "PORIGON2@@@"

	db LANTURN
	db MAGNET
	db THUNDER, SURF, ICE_BEAM, AGILITY 
	dw 0 ; OT ID
	bigdt 80000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 40000
	dn 11, 12, 15, 13 ; DVs
	db 16, 24, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 181 ; HP
	bigdw 181 ; Max HP
	bigdw 77 ; Atk
	bigdw 78 ; Def
	bigdw 86 ; Spd
	bigdw 97 ; SAtk
	bigdw 97 ; SDef
	db "UINDEi@@@@@"

	db PIDGEOT
	db BRIGHTPOWDER
	db RETURN, MUD_SLAP, DOUBLE_TEAM, SUBSTITUTE 
	dw 0 ; OT ID
	bigdt 56660 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	dn 13, 11, 13, 14 ; DVs
	db 24, 16, 24, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 144 ; HP
	bigdw 144 ; Max HP
	bigdw 99 ; Atk
	bigdw 91 ; Def
	bigdw 119 ; Spd
	bigdw 91 ; SAtk
	bigdw 91 ; SDef
	db "HUoRETOSU@@"

	db PIDGEOT
	db BLACKGLASSES
	db DOUBLE_EDGE, STEEL_WING, PURSUIT, FLY 
	dw 0 ; OT ID
	bigdt 56660 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	dn 13, 11, 13, 14 ; DVs
	db 24, 40, 32, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 144 ; HP
	bigdw 144 ; Max HP
	bigdw 99 ; Atk
	bigdw 91 ; Def
	bigdw 119 ; Spd
	bigdw 91 ; SAtk
	bigdw 91 ; SDef
	db "OMUSUTA-@@@"

	db ARBOK
	db LEFTOVERS
	db GLARE, SUBSTITUTE, SLUDGE_BOMB, EARTHQUAKE 
	dw 0 ; OT ID
	bigdt 64000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	bigdw 30000
	dn 11, 13, 13, 13 ; DVs
	db 48, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 132 ; HP
	bigdw 132 ; Max HP
	bigdw 101 ; Atk
	bigdw 87 ; Def
	bigdw 101 ; Spd
	bigdw 84 ; SAtk
	bigdw 95 ; SDef
	db "RIZA-DON@@@"

	db SANDSLASH
	db SOFT_SAND
	db EARTHQUAKE, ROCK_SLIDE, SWORDS_DANCE, RAPID_SPIN
	dw 0 ; OT ID
	bigdt 64000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	dn 14, 11, 12, 15 ; DVs
	db 16, 16, 48, 61 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 134 ; HP
	bigdw 134 ; Max HP
	bigdw 118 ; Atk
	bigdw 124 ; Def
	bigdw 86 ; Spd
	bigdw 67 ; SAtk
	bigdw 75 ; SDef
	db "NAtuSI-@@@@"

	db BEEDRILL
	db SILVERPOWDER
	db SWORDS_DANCE, FEINT_ATTACK, SLUDGE_BOMB, PIN_MISSILE 
	dw 0 ; OT ID
	bigdt 64000 ; Exp
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
	bigdt 64000 ; Exp
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

	db AZUMARILL
	db SITRUS_BERRY
	db RETURN, BELLY_DRUM, SING, SURF 
	dw 0 ; OT ID
	bigdt 51200 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 14, 14, 14, 14 ; DVs
	db 32, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 152 ; HP
	bigdw 152 ; Max HP
	bigdw 78 ; Atk
	bigdw 102 ; Def
	bigdw 78 ; Spd
	bigdw 86 ; SAtk
	bigdw 102 ; SDef
	db "EREBU-@@@@@"

	
	; Group 5
	
	db TENTACRUEL
	db MYSTIC_WATER
	db SLUDGE_BOMB, SURF, BARRIER, GIGA_DRAIN
	dw 0 ; OT ID
	bigdt 156250 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	dn 11, 15, 13, 14 ; DVs
	db 16, 24, 48, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 181 ; HP
	bigdw 181 ; Max HP
	bigdw 111 ; Atk
	bigdw 113 ; Def
	bigdw 144 ; Spd
	bigdw 119 ; SAtk
	bigdw 159 ; SDef
	db "KINGUDORA@@"

	db RAPIDASH
	db CHARCOAL
	db LOW_KICK, FIRE_BLAST, SUNNY_DAY, SOLARBEAM 
	dw 0 ; OT ID
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 40000
	bigdw 40000
	bigdw 50000
	dn 13, 11, 14, 15 ; DVs
	db 32, 8, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 160 ; HP
	bigdw 160 ; Max HP
	bigdw 146 ; Atk
	bigdw 111 ; Def
	bigdw 150 ; Spd
	bigdw 127 ; SAtk
	bigdw 127 ; SDef
	db "HERUGA-@@@@"

	db SLOWBRO
	db LEFTOVERS
	db SURF, PSYCHIC_M, REST, THUNDER_WAVE
	dw 0 ; OT ID
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 60000
	bigdw 30000
	dn 9, 15, 13, 7 ; DVs
	db 24, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 198 ; HP
	bigdw 198 ; Max HP
	bigdw 110 ; Atk
	bigdw 158 ; Def
	bigdw 72 ; Spd
	bigdw 139 ; SAtk
	bigdw 119 ; SDef
	db "TUBOTUBO@@@"

	db MAGNETON
	db MAGNET
	db THUNDER, LIGHT_SCREEN, SCREECH, EXPLOSION 
	dw 0 ; OT ID
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	dn 11, 13, 14, 11 ; DVs
	db 16, 48, 61, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 145 ; HP
	bigdw 145 ; Max HP
	bigdw 104 ; Atk
	bigdw 134 ; Def
	bigdw 107 ; Spd
	bigdw 167 ; SAtk
	bigdw 117 ; SDef
	db "KABIGON@@@@"

	db SKARMORY
	db LEFTOVERS
	db SKY_ATTACK, ROCK_SLIDE, SWORDS_DANCE, STEEL_WING 
	dw 0 ; OT ID
	bigdt 156250 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	dn 14, 15, 13, 12 ; DVs
	db 8, 16, 48, 40 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 151 ; HP
	bigdw 151 ; Max HP
	bigdw 127 ; Atk
	bigdw 188 ; Def
	bigdw 112 ; Spd
	bigdw 79 ; SAtk
	bigdw 109 ; SDef
	db "RAPURASU@@@"

	db DODRIO
	db SILK_SCARF
	db DOUBLE_EDGE, JUMP_KICK, DRILL_PECK, SWORDS_DANCE 
	dw 0 ; OT ID
	bigdt 125000 ; Exp
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
	bigdw 154 ; HP
	bigdw 154 ; Max HP
	bigdw 155 ; Atk
	bigdw 107 ; Def
	bigdw 157 ; Spd
	bigdw 97 ; SAtk
	bigdw 97; SDef
	db "SANDA-SU@@@"

	db MUK
	db CHARCOAL
	db SLUDGE_BOMB, FIRE_BLAST, SHADOW_BALL, EXPLOSION 
	dw 0 ; OT ID
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 50000
	bigdw 20000
	bigdw 40000
	dn 13, 14, 13, 11 ; DVs
	db 16, 8, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 197 ; HP
	bigdw 197 ; Max HP
	bigdw 148 ; Atk
	bigdw 122 ; Def
	bigdw 83 ; Spd
	bigdw 108 ; SAtk
	bigdw 143 ; SDef
	db "HAtuSAMU@@@"

	db MUK
	db LEFTOVERS
	db TOXIC, FLAMETHROWER, MINIMIZE, REST
	dw 0 ; OT ID
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 50000
	bigdw 20000
	bigdw 40000
	dn 13, 14, 13, 11 ; DVs
	db 16, 24, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 197 ; HP
	bigdw 197 ; Max HP
	bigdw 148 ; Atk
	bigdw 122 ; Def
	bigdw 83 ; Spd
	bigdw 108 ; SAtk
	bigdw 143 ; SDef
	db "YADOKINGU@@"

	db CLOYSTER
	db NEVERMELTICE
	db SURF, ICE_BEAM, TOXIC, EXPLOSION 
	dw 0 ; OT ID
	bigdt 156250 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	dn 11, 15, 13, 12 ; DVs
	db 24, 16, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 148 ; HP
	bigdw 148 ; Max HP
	bigdw 136 ; Atk
	bigdw 228 ; Def
	bigdw 112 ; Spd
	bigdw 124 ; SAtk
	bigdw 84 ; SDef
	db "KAIRIKI-@@@"

	db VENOMOTH
	db BRIGHTPOWDER
	db SLEEP_POWDER, PSYCHIC_M, SLUDGE_BOMB, FLASH 
	dw 0 ; OT ID
	bigdt 125000 ; Exp
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
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 20000
	bigdw 40000
	dn 9, 15, 15, 11 ; DVs
	db 16, 48, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 184 ; HP
	bigdw 184 ; Max HP
	bigdw 108 ; Atk
	bigdw 117 ; Def
	bigdw 102 ; Spd
	bigdw 116 ; SAtk
	bigdw 158 ; SDef
	db "DAGUTORIO@@"

	db KINGLER
	db SCOPE_LENS
	db FLAIL, CRABHAMMER, RETURN, TOXIC 
	dw 0 ; OT ID
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 15, 13, 12, 11 ; DVs
	db 24, 16, 32, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 150 ; HP
	bigdw 150 ; Max HP
	bigdw 178 ; Atk
	bigdw 161 ; Def
	bigdw 112 ; Spd
	bigdw 92 ; SAtk
	bigdw 92 ; SDef
	db "MARUMAIN@@@"

	db MAROWAK
	db THICK_CLUB
	db ROCK_SLIDE, EARTHQUAKE, FIRE_BLAST, SWORDS_DANCE 
	dw 0 ; OT ID
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 60000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 13, 13, 13, 12 ; DVs
	db 16, 16, 8, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 154 ; HP
	bigdw 154 ; Max HP
	bigdw 128 ; Atk
	bigdw 156 ; Def
	bigdw 83 ; Spd
	bigdw 93 ; SAtk
	bigdw 123 ; SDef
	db "PUTERA@@@@@"

	db HITMONCHAN
	db BLACKBELT_I
	db MACH_PUNCH, HI_JUMP_KICK, ROCK_SLIDE, SWORDS_DANCE 
	dw 0 ; OT ID
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 60000
	bigdw 40000
	bigdw 30000
	dn 14, 12, 14, 12 ; DVs
	db 48, 8, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 131 ; HP
	bigdw 131 ; Max HP
	bigdw 152 ; Atk
	bigdw 126 ; Def
	bigdw 118 ; Spd
	bigdw 75 ; SAtk
	bigdw 150 ; SDef
	db "KUROBAtuTO@"

	db WEEZING
	db CHESTO_BERRY
	db SLUDGE_BOMB, FLAMETHROWER, EXPLOSION, REST 
	dw 0 ; OT ID
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	dn 13, 15, 14, 13 ; DVs
	db 16, 24, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 164 ; HP
	bigdw 164 ; Max HP
	bigdw 129 ; Atk
	bigdw 168 ; Def
	bigdw 103 ; Spd
	bigdw 125 ; SAtk
	bigdw 110 ; SDef
	db "SANDA-@@@@@"

	db MANTINE
	db LUM_BERRY
	db SURF, TOXIC, REST, HAZE
	dw 0 ; OT ID
	bigdt 156250 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 50000
	dn 13, 13, 15, 14 ; DVs
	db 24, 16, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 183 ; HP
	bigdw 183 ; Max HP
	bigdw 79 ; Atk
	bigdw 109 ; Def
	bigdw 114 ; Spd
	bigdw 128 ; SAtk
	bigdw 188 ; SDef
	db "EA-MUDO@@@@"

	db BLISSEY
	db LEFTOVERS
	db FLAMETHROWER, DEFENSE_CURL, SOFTBOILED, THUNDER_WAVE
	dw 0 ; OT ID
	bigdt 100000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 20000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	dn 13, 14, 12, 13 ; DVs
	db 24, 61, 16, 32 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 353 ; HP
	bigdw 353 ; Max HP
	bigdw 45 ; Atk
	bigdw 57 ; Def
	bigdw 98 ; Spd
	bigdw 120 ; SAtk
	bigdw 180 ; SDef
	db "HUoRETOSU@@"

	db KANGASKHAN
	db KINGS_ROCK
	db CRUNCH, RETURN, CURSE, REST 
	dw 0 ; OT ID
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	dn 13, 14, 15, 11 ; DVs
	db 24, 32, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 201 ; HP
	bigdw 201 ; Max HP
	bigdw 141 ; Atk
	bigdw 127 ; Def
	bigdw 127 ; Spd
	bigdw 81 ; SAtk
	bigdw 121 ; SDef
	db "HAGANE-RU@@"

	db SLOWKING
	db CHESTO_BERRY
	db SURF, PSYCHIC_M, THUNDER_WAVE, REST 
	dw 0 ; OT ID
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 20000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	dn 9, 15, 13, 11 ; DVs
	db 24, 16, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 195 ; HP
	bigdw 195 ; Max HP
	bigdw 106 ; Atk
	bigdw 128 ; Def
	bigdw 67 ; Spd
	bigdw 146 ; SAtk
	bigdw 156 ; SDef
	db "KIRINRIKI@@"

	db SCYTHER
	db SILVERPOWDER
	db SLASH, WING_ATTACK, STEEL_WING, SWORDS_DANCE 
	dw 0 ; OT ID
	bigdt 125000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 30000
	dn 15, 10, 13, 15 ; DVs
	db 32, 56, 40, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 166 ; HP
	bigdw 166 ; Max HP
	bigdw 158 ; Atk
	bigdw 116 ; Def
	bigdw 153 ; Spd
	bigdw 94 ; SAtk
	bigdw 119 ; SDef
	db "GIyaRADOSU@"

	db MURKROW
	db BLACKGLASSES
	db FEINT_ATTACK, DRILL_PECK, CONFUSE_RAY, THUNDER_WAVE
	dw 0 ; OT ID
	bigdt 117360 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 50000
	dn 14, 11, 14, 13 ; DVs
	db 32, 32, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 147 ; HP
	bigdw 147 ; Max HP
	bigdw 132 ; Atk
	bigdw 79 ; Def
	bigdw 137 ; Spd
	bigdw 132 ; SAtk
	bigdw 89 ; SDef
	db "HURI-ZA-@@@"

	
	; Group 6
	
	db LAPRAS
	db MYSTIC_WATER
	db SURF, ICE_BEAM, CONFUSE_RAY, PERISH_SONG  
	dw 0 ; OT ID
	bigdt 270000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	dn 13, 11, 13, 11 ; DVs
	db 24, 16, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 277 ; HP
	bigdw 277 ; Max HP
	bigdw 148 ; Atk
	bigdw 144 ; Def
	bigdw 116 ; Spd
	bigdw 156 ; SAtk
	bigdw 168 ; SDef
	db "KINGUDORA@@"

	db FLAREON
	db CHARCOAL
	db FIRE_BLAST, SHADOW_BALL, DOUBLE_EDGE, MUD_SLAP  
	dw 0 ; OT ID
	bigdt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	dn 14, 13, 14, 13 ; DVs
	db 8, 24, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 181 ; HP
	bigdw 181 ; Max HP
	bigdw 211 ; Atk
	bigdw 118 ; Def
	bigdw 124 ; Spd
	bigdw 169 ; SAtk
	bigdw 187 ; SDef
	db "BANGIRASU@@"

	db PORYGON2
	db LEFTOVERS
	db RETURN, ICE_BEAM, RECOVER, CURSE 
	dw 0 ; OT ID
	bigdt 216000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 40000
	dn 13, 14, 11, 13 ; DVs
	db 32, 16, 16, 16 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 218 ; HP
	bigdw 218 ; Max HP
	bigdw 150 ; Atk
	bigdw 155 ; Def
	bigdw 118 ; Spd
	bigdw 174 ; SAtk
	bigdw 162 ; SDef
	db "HERUGA-@@@@"

	db KABUTOPS
	db KINGS_ROCK
	db WATERFALL, ROCK_SLIDE, LOW_KICK, SWORDS_DANCE
	dw 0 ; OT ID
	bigdt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	dn 15, 13, 11, 15 ; DVs
	db 24, 16, 32, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 185 ; HP
	bigdw 185 ; Max HP
	bigdw 194 ; Atk
	bigdw 176 ; Def
	bigdw 152 ; Spd
	bigdw 122 ; SAtk
	bigdw 128 ; SDef
	db "PORIGON2@@@"

	db OMASTAR
	db CHESTO_BERRY
	db HYDRO_PUMP, RAIN_DANCE, REST, ROCK_SLIDE 
	dw 0 ; OT ID
	bigdt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	dn 12, 14, 15, 9 ; DVs
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
	db LUM_BERRY
	db ROCK_SLIDE, EARTHQUAKE, WING_ATTACK, CRUNCH  
	dw 0 ; OT ID
	bigdt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	dn 14, 14, 11, 15 ; DVs
	db 16, 16, 56, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 195 ; HP
	bigdw 195 ; Max HP
	bigdw 181 ; Atk
	bigdw 133 ; Def
	bigdw 212 ; Spd
	bigdw 116 ; SAtk
	bigdw 134 ; SDef
	db "SANDA-@@@@@"

	db CHARIZARD
	db CHARCOAL
	db FIRE_BLAST, THUNDERPUNCH, SUNNY_DAY, SOLARBEAM 
	dw 0 ; OT ID
	bigdt 211060 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 40000
	bigdw 60000
	dn 14, 12, 15, 13 ; DVs
	db 8, 24, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 193 ; HP
	bigdw 193 ; Max HP
	bigdw 152 ; Atk
	bigdw 138 ; Def
	bigdw 170 ; Spd
	bigdw 190 ; SAtk
	bigdw 161 ; SDef
	db "SO-NANSU@@@"

	db CHARIZARD
	db FOCUS_BAND
	db FIRE_BLAST, EARTHQUAKE, ROCK_SLIDE, BELLY_DRUM 
	dw 0 ; OT ID
	bigdt 211060 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 40000
	bigdw 60000
	dn 14, 12, 15, 13 ; DVs
	db 8, 24, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 193 ; HP
	bigdw 193 ; Max HP
	bigdw 152 ; Atk
	bigdw 138 ; Def
	bigdw 170 ; Spd
	bigdw 190 ; SAtk
	bigdw 161 ; SDef
	db "PUTERA@@@@@"

	db VENUSAUR
	db FOCUS_BAND
	db GIGA_DRAIN, SLUDGE_BOMB, HIDDEN_POWER, SLEEP_POWDER ; HP = FIRE
	dw 0 ; OT ID
	bigdt 211060 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	bigdw 60000
	dn 10, 12, 15, 13 ; DVs
	db 8, 16, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 195 ; HP
	bigdw 195 ; Max HP
	bigdw 141 ; Atk
	bigdw 152 ; Def
	bigdw 146 ; Spd
	bigdw 179 ; SAtk
	bigdw 179 ; SDef
	db "KAIRIyu-@@@"

	db VENUSAUR
	db SITRUS_BERRY
	db SWORDS_DANCE, SLUDGE_BOMB, EARTHQUAKE, SLEEP_POWDER
	dw 0 ; OT ID
	bigdt 211060 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	dn 11, 14, 15, 11 ; DVs
	db 48, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 205 ; HP
	bigdw 205 ; Max HP
	bigdw 150 ; Atk
	bigdw 155 ; Def
	bigdw 144 ; Spd
	bigdw 168 ; SAtk
	bigdw 168 ; SDef
	db "BURAtuKI-@@"

	db BLASTOISE
	db LEFTOVERS
	db SURF, SEISMIC_TOSS, REST, SLEEP_TALK
	dw 0 ; OT ID
	bigdt 211060 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	dn 11, 15, 12, 13 ; DVs
	db 24, 32, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 215 ; HP
	bigdw 215 ; Max HP
	bigdw 143 ; Atk
	bigdw 176 ; Def
	bigdw 144 ; Spd
	bigdw 147 ; SAtk
	bigdw 171 ; SDef
	db "UINDEi@@@@@"

	db MURKROW
	db BLACKGLASSES
	db FEINT_ATTACK, DRILL_PECK, THUNDER_WAVE, PERISH_SONG 
	dw 0 ; OT ID
	bigdt 211060 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 30000
	dn 14, 12, 13, 14 ; DVs
	db 32, 32, 32, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 169 ; HP
	bigdw 169 ; Max HP
	bigdw 157 ; Atk
	bigdw 95 ; Def
	bigdw 164 ; Spd
	bigdw 148 ; SAtk
	bigdw 96 ; SDef
	db "EA-MUDO@@@@"

	db XATU
	db TWISTEDSPOON
	db PSYCHIC_M, DRILL_PECK, GIGA_DRAIN, SHADOW_BALL
	dw 0 ; OT ID
	bigdt 216000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 30000
	bigdw 20000
	bigdw 50000
	dn 13, 14, 14, 13 ; DVs
	db 16, 32, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 190 ; HP
	bigdw 190 ; Max HP
	bigdw 136 ; Atk
	bigdw 131 ; Def
	bigdw 155 ; Spd
	bigdw 169 ; SAtk
	bigdw 139 ; SDef
	db "HAPINASU@@@"

	db AMPHAROS
	db MAGNET
	db THUNDER, CONFUSE_RAY, ICE_PUNCH, SEISMIC_TOSS 
	dw 0 ; OT ID
	bigdt 211060 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 60000
	dn 14, 14, 15, 12 ; DVs
	db 16, 16, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 205 ; HP
	bigdw 205 ; Max HP
	bigdw 137 ; Atk
	bigdw 153 ; Def
	bigdw 111 ; Spd
	bigdw 194 ; SAtk
	bigdw 164 ; SDef
	db "KABIGON@@@@"

	db AMPHAROS
	db MAGNET
	db THUNDER, DYNAMICPUNCH, ICE_PUNCH, AGILITY 
	dw 0 ; OT ID
	bigdt 211060 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 60000
	dn 14, 14, 15, 12 ; DVs
	db 16, 8, 24, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 205 ; HP
	bigdw 205 ; Max HP
	bigdw 137 ; Atk
	bigdw 153 ; Def
	bigdw 111 ; Spd
	bigdw 194 ; SAtk
	bigdw 164 ; SDef
	db "HERAKUROSU@"

	db ELECTRODE
	db SILK_SCARF
	db THUNDER, LIGHT_SCREEN, EXPLOSION, MIRROR_COAT 
	dw 0 ; OT ID
	bigdt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 40000
	bigdw 40000
	bigdw 50000
	dn 15, 11, 14, 14 ; DVs
	db 16, 48, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 182 ; HP
	bigdw 182 ; Max HP
	bigdw 108 ; Atk
	bigdw 132 ; Def
	bigdw 238 ; Spd
	bigdw 151 ; SAtk
	bigdw 151 ; SDef
	db "RU-ZIyuRA@@"

	db SUDOWOODO
	db HARD_STONE
	db ROCK_SLIDE, CURSE, EXPLOSION, EARTHQUAKE
	dw 0 ; OT ID
	bigdt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	bigdw 30000
	dn 14, 15, 11, 13 ; DVs
	db 16, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 188 ; HP
	bigdw 188 ; Max HP
	bigdw 175 ; Atk
	bigdw 191 ; Def
	bigdw 82 ; Spd
	bigdw 80 ; SAtk
	bigdw 122 ; SDef
	db "KAMEtuKUSU@"

	db POLITOED 
	db LUM_BERRY
	db SURF, ICE_BEAM, PERISH_SONG, HYPNOSIS 
	dw 0 ; OT ID
	bigdt 211060 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	dn 13, 12, 12, 13 ; DVs
	db 24, 16, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 215 ; HP
	bigdw 215 ; Max HP
	bigdw 136 ; Atk
	bigdw 143 ; Def
	bigdw 130 ; Spd
	bigdw 157 ; SAtk
	bigdw 169 ; SDef
	db "SAIDON@@@@@"

	db ESPEON
	db LUM_BERRY
	db PSYCHIC_M, SHADOW_BALL, MORNING_SUN, THUNDER_WAVE 
	dw 0 ; OT ID
	bigdt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 60000
	bigdw 60000
	dn 12, 11, 15, 14 ; DVs
	db 16, 24, 8, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 179 ; HP
	bigdw 179 ; Max HP
	bigdw 123 ; Atk
	bigdw 116 ; Def
	bigdw 187 ; Spd
	bigdw 212 ; SAtk
	bigdw 170 ; SDef
	db "SANDOPAN@@@"

	db UMBREON
	db LEFTOVERS
	db CRUNCH, CURSE, REST, SLEEP_TALK 
	dw 0 ; OT ID
	bigdt 216000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	dn 11, 15, 12, 14 ; DVs
	db 24, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 224 ; HP
	bigdw 224 ; Max HP
	bigdw 129 ; Atk
	bigdw 188 ; Def
	bigdw 125 ; Spd
	bigdw 117 ; SAtk
	bigdw 201 ; SDef
	db "PARASEKUTO@"

	db PINSIR
	db BLACKBELT_I
	db SWORDS_DANCE, EARTHQUAKE, SUBMISSION, FEINT_ATTACK 
	dw 0 ; OT ID
	bigdt 270000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	dn 14, 14, 11, 13 ; DVs
	db 48, 16, 40, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 181 ; HP
	bigdw 181 ; Max HP
	bigdw 205 ; Atk
	bigdw 175 ; Def
	bigdw 152 ; Spd
	bigdw 110 ; SAtk
	bigdw 128 ; SDef
	db "GORO-NIya@@"

	
	; Group 7
	
	db NIDOQUEEN
	db NEVERMELTICE
	db EARTHQUAKE, ICE_PUNCH, THUNDERBOLT, CHARM
	dw 0 ; OT ID
	bigdt 344960 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 30000
	dn 12, 15, 13, 14 ; DVs
	db 16, 24, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 248 ; HP
	bigdw 248 ; Max HP
	bigdw 189 ; Atk
	bigdw 187 ; Def
	bigdw 166 ; Spd
	bigdw 168 ; SAtk
	bigdw 172 ; SDef
	db "SANDA-SU@@@"

	db SNEASEL
	db LUM_BERRY
	db FEINT_ATTACK, DOUBLE_EDGE, LOW_KICK, SWORDS_DANCE
	dw 0 ; OT ID
	bigdt 344960 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 30000
	dn 14, 9, 13, 14 ; DVs
	db 16, 24, 32, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 199 ; HP
	bigdw 199 ; Max HP
	bigdw 196 ; Atk
	bigdw 124 ; Def
	bigdw 224 ; Spd
	bigdw 102 ; SAtk
	bigdw 158 ; SDef
	db "SIyaWA-ZU@@"

	db GRANBULL
	db SCOPE_LENS
	db OUTRAGE, FRUSTRATION, CRUNCH, FIRE_BLAST
	dw 0 ; OT ID
	bigdt 274400 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	dn 13, 14, 12, 15 ; DVs
	db 16, 32, 24, 8 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 250 ; HP
	bigdw 250 ; Max HP
	bigdw 230 ; Atk
	bigdw 159 ; Def
	bigdw 119 ; Spd
	bigdw 145 ; SAtk
	bigdw 145 ; SDef
	db "HAPINASU@@@"

	db SCIZOR
	db METAL_COAT
	db STEEL_WING, FURY_CUTTER, SWORDS_DANCE, DOUBLE_EDGE
	dw 0 ; OT ID
	bigdt 343000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 50000
	bigdw 40000
	bigdw 20000
	dn 15, 14, 13, 13 ; DVs
	db 40, 32, 48, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 223 ; HP
	bigdw 223 ; Max HP
	bigdw 247 ; Atk
	bigdw 203 ; Def
	bigdw 149 ; Spd
	bigdw 124 ; SAtk
	bigdw 159 ; SDef
	db "KABIGON@@@@"

	db URSARING
	db SILK_SCARF
	db DOUBLE_EDGE, EARTHQUAKE, CROSS_CHOP, SWORDS_DANCE
	dw 0 ; OT ID
	bigdt 343000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 60000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	dn 15, 14, 13, 14 ; DVs
	db 24, 16, 8, 48 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 248 ; HP
	bigdw 248 ; Max HP
	bigdw 250 ; Atk
	bigdw 159 ; Def
	bigdw 136 ; Spd
	bigdw 158 ; SAtk
	bigdw 158 ; SDef
	db "HERUGA-@@@@"

	db DONPHAN
	db CHESTO_BERRY
	db REST, EARTHQUAKE, TOXIC, ROAR 
	dw 0 ; OT ID
	bigdt 343000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	dn 15, 14, 13, 14 ; DVs
	db 16, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 253 ; HP
	bigdw 253 ; Max HP
	bigdw 233 ; Atk
	bigdw 231 ; Def
	bigdw 124 ; Spd
	bigdw 137 ; SAtk
	bigdw 137 ; SDef
	db "BANGIRASU@@"

	db MILTANK
	db LEFTOVERS
	db MILK_DRINK, BODY_SLAM, SURF, CHARM 
	dw 0 ; OT ID
	bigdt 428750 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 13, 15, 11, 12 ; DVs
	db 16, 24, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 270 ; HP
	bigdw 270 ; Max HP
	bigdw 165 ; Atk
	bigdw 212 ; Def
	bigdw 191 ; Spd
	bigdw 122 ; SAtk
	bigdw 153 ; SDef
	db "SANDA-@@@@@"

	db OCTILLERY
	db MYSTIC_WATER
	db OCTAZOOKA, ICE_BEAM, THUNDER_WAVE, FIRE_BLAST 
	dw 0 ; OT ID
	bigdt 343000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 30000
	bigdw 30000
	bigdw 30000
	bigdw 50000
	dn 11, 13, 14, 11 ; DVs
	db 16, 16, 32, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 239 ; HP
	bigdw 239 ; Max HP
	bigdw 197 ; Atk
	bigdw 158 ; Def
	bigdw 113 ; Spd
	bigdw 210 ; SAtk
	bigdw 168 ; SDef
	db "NAtuSI-@@@@"

	db PILOSWINE
	db NEVERMELTICE
	db ICY_WIND, ROCK_SLIDE, EARTHQUAKE, ROAR 
	dw 0 ; OT ID
	bigdt 428750 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 20000
	dn 15, 12, 13, 13 ; DVs
	db 24, 16, 16, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 274 ; HP
	bigdw 274 ; Max HP
	bigdw 205 ; Atk
	bigdw 173 ; Def
	bigdw 123 ; Spd
	bigdw 131 ; SAtk
	bigdw 131 ; SDef
	db "BURAtuKI-@@"

	db MAGCARGO
	db FOCUS_BAND
	db FIRE_BLAST, ROCK_SLIDE, EXPLOSION, TOXIC
	dw 0 ; OT ID
	bigdt 343000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 13, 15, 14, 13 ; DVs
	db 8, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 241 ; HP
	bigdw 241 ; Max HP
	bigdw 128 ; Atk
	bigdw 233 ; Def
	bigdw 95 ; Spd
	bigdw 185 ; SAtk
	bigdw 180 ; SDef
	db "GIyaRADOSU@"

	db SHUCKLE
	db LEFTOVERS
	db DEFENSE_CURL, TOXIC, FLASH, REST
	dw 0 ; OT ID
	bigdt 344960 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 20000
	bigdw 50000
	bigdw 20000
	bigdw 50000
	dn 11, 15, 15, 11 ; DVs
	db 61, 16, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 164 ; HP
	bigdw 164 ; Max HP
	bigdw 58 ; Atk
	bigdw 387 ; Def
	bigdw 51 ; Spd
	bigdw 79 ; SAtk
	bigdw 387 ; SDef
	db "NUO-@@@@@@@"

	db STEELIX
	db LEFTOVERS
	db EARTHQUAKE, IRON_TAIL, CURSE, REST 
	dw 0 ; OT ID
	bigdt 343000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 30000
	dn 13, 15, 14, 13 ; DVs
	db 16, 24, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 243 ; HP
	bigdw 243 ; Max HP
	bigdw 177 ; Atk
	bigdw 345 ; Def
	bigdw 89 ; Spd
	bigdw 131 ; SAtk
	bigdw 145 ; SDef
	db "RINGUMA@@@@"

	db MISDREAVUS
	db SPELL_TAG
	db SHADOW_BALL, PAIN_SPLIT, ICY_WIND, THUNDER 
	dw 0 ; OT ID
	bigdt 274400 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 40000
	bigdw 40000
	bigdw 20000
	bigdw 50000
	dn 13, 15, 14, 13 ; DVs
	db 24, 32, 24, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 226 ; HP
	bigdw 226 ; Max HP
	bigdw 142 ; Atk
	bigdw 145 ; Def
	bigdw 166 ; Spd
	bigdw 182 ; SAtk
	bigdw 182 ; SDef
	db "BARIYA-DO@@"

	db XATU
	db SHARP_BEAK
	db PSYCHIC_M, DRILL_PECK, SHADOW_BALL, THUNDER_WAVE 
	dw 0 ; OT ID
	bigdt 343000 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 50000
	bigdw 20000
	bigdw 50000
	dn 13, 15, 14, 11 ; DVs
	db 16, 32, 24, 32 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 225 ; HP
	bigdw 225 ; Max HP
	bigdw 163 ; Atk
	bigdw 163 ; Def
	bigdw 177 ; Spd
	bigdw 196 ; SAtk
	bigdw 161 ; SDef
	db "OKORIZARU@@"

	db TYPHLOSION
	db CHARCOAL
	db FIRE_BLAST, THUNDERPUNCH, MUD_SLAP, SLEEP_TALK 
	dw 0 ; OT ID
	bigdt 344960 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	dn 14, 13, 15, 14 ; DVs
	db 8, 24, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 231 ; HP
	bigdw 231 ; Max HP
	bigdw 177 ; Atk
	bigdw 171 ; Def
	bigdw 199 ; Spd
	bigdw 217 ; SAtk
	bigdw 184 ; SDef
	db "KIRINRIKI@@"

	db FERALIGATR
	db KINGS_ROCK
	db WATERFALL, ROCK_SLIDE, EARTHQUAKE, SWORDS_DANCE 
	dw 0 ; OT ID
	bigdt 344960 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 50000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 15, 14, 11, 13 ; DVs
	db 24, 16, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 249 ; HP
	bigdw 249 ; Max HP
	bigdw 212 ; Atk
	bigdw 203 ; Def
	bigdw 162 ; Spd
	bigdw 166 ; SAtk
	bigdw 171 ; SDef
	db "SAWAMURA-@@"

	db MEGANIUM
	db MIRACLE_SEED
	db PETAL_DANCE, EARTHQUAKE, SYNTHESIS, TOXIC 
	dw 0 ; OT ID
	bigdt 344960 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 40000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	dn 14, 15, 13, 11 ; DVs
	db 16, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 241 ; HP
	bigdw 241 ; Max HP
	bigdw 174 ; Atk
	bigdw 201 ; Def
	bigdw 162 ; Spd
	bigdw 178 ; SAtk
	bigdw 202 ; SDef
	db "HERAKUROSU@"

	db POLITOED
	db LUM_BERRY
	db SURF, ICE_BEAM, HYPNOSIS, TOXIC 
	dw 0 ; OT ID
	bigdt 344960 ; Exp
	; Stat exp
	bigdw 40000
	bigdw 40000
	bigdw 50000
	bigdw 30000
	bigdw 40000
	dn 15, 15, 13, 14 ; DVs
	db 24, 16, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 259 ; HP
	bigdw 259 ; Max HP
	bigdw 166 ; Atk
	bigdw 170 ; Def
	bigdw 152 ; Spd
	bigdw 184 ; SAtk
	bigdw 198 ; SDef
	db "HUSIGIBANA@"

	db LANTURN
	db MAGNET
	db SURF, THUNDERBOLT, THUNDER_WAVE, ICE_BEAM 
	dw 0 ; OT ID
	bigdt 428750 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 30000
	bigdw 40000
	bigdw 30000
	bigdw 50000
	dn 13, 13, 15, 11 ; DVs
	db 24, 24, 32, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 315 ; HP
	bigdw 315 ; Max HP
	bigdw 134 ; Atk
	bigdw 139 ; Def
	bigdw 144 ; Spd
	bigdw 171 ; SAtk
	bigdw 171 ; SDef
	db "RIZA-DON@@@"

	db CROBAT
	db LUM_BERRY
	db SLUDGE_BOMB, CRUNCH, TOXIC, DOUBLE_TEAM 
	dw 0 ; OT ID
	bigdt 343000 ; Exp
	; Stat exp
	bigdw 30000
	bigdw 50000
	bigdw 40000
	bigdw 50000
	bigdw 40000
	dn 15, 15, 11, 15 ; DVs
	db 16, 24, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 250 ; HP
	bigdw 250 ; Max HP
	bigdw 188 ; Atk
	bigdw 170 ; Def
	bigdw 241 ; Spd
	bigdw 159 ; SAtk
	bigdw 173 ; SDef
	db "KAMEtuKUSU@"

	db RHYDON
	db SITRUS_BERRY
	db ROCK_SLIDE, EARTHQUAKE, ZAP_CANNON, MEGAHORN 
	dw 0 ; OT ID
	bigdt 428750 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 287 ; HP
	bigdw 287 ; Max HP
	bigdw 247 ; Atk
	bigdw 233 ; Def
	bigdw 121 ; Spd
	bigdw 128 ; SAtk
	bigdw 128 ; SDef
	db "KAMEtuKUSU@"

	
	; Group 8
	
	db ZAPDOS
	db MAGNET
	db THUNDERBOLT, DRILL_PECK, THUNDER_WAVE, AGILITY
	dw 0 ; OT ID
	bigdt 640000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 16, 32, 32, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 302 ; HP
	bigdw 302 ; Max HP
	bigdw 217 ; Atk
	bigdw 209 ; Def
	bigdw 233 ; Spd
	bigdw 273 ; SAtk
	bigdw 217 ; SDef
	db "SANDA-SU@@@"

	db MOLTRES
	db CHARCOAL
	db FIRE_BLAST, SUNNY_DAY, SOLARBEAM, ANCIENTPOWER 
	dw 0 ; OT ID
	bigdt 640000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 8, 8, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 302 ; HP
	bigdw 302 ; Max HP
	bigdw 233 ; Atk
	bigdw 217 ; Def
	bigdw 217 ; Spd
	bigdw 273 ; SAtk
	bigdw 209 ; SDef
	db "KABIGON@@@@"

	db ARTICUNO
	db NEVERMELTICE
	db BLIZZARD, SKY_ATTACK, TOXIC, REST 
	dw 0 ; OT ID
	bigdt 640000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 8, 8, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 302 ; HP
	bigdw 302 ; Max HP
	bigdw 209 ; Atk
	bigdw 233 ; Def
	bigdw 209 ; Spd
	bigdw 225 ; SAtk
	bigdw 273 ; SDef
	db "HERUGA-@@@@"

	db SNORLAX
	db LUM_BERRY
	db DOUBLE_EDGE, CRUNCH, FIRE_BLAST, SELFDESTRUCT
	dw 0 ; OT ID
	bigdt 640000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 24, 24, 8, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 414 ; HP
	bigdw 414 ; Max HP
	bigdw 249 ; Atk
	bigdw 177 ; Def
	bigdw 121 ; Spd
	bigdw 177 ; SAtk
	bigdw 177 ; SDef
	db "KENTAROSU@@"

	db ARCANINE
	db CHARCOAL
	db TOXIC, FIRE_BLAST, EXTREMESPEED, CRUNCH
	dw 0 ; OT ID
	bigdt 640000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 16, 8, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 302 ; HP
	bigdw 302 ; Max HP
	bigdw 249 ; Atk
	bigdw 201 ; Def
	bigdw 225 ; Spd
	bigdw 233 ; SAtk
	bigdw 201 ; SDef
	db "RAPURASU@@@"

	db EXEGGUTOR
	db TWISTEDSPOON
	db GIGA_DRAIN, SLEEP_POWDER, PSYCHIC_M, EXPLOSION 
	dw 0 ; OT ID
	bigdt 640000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 8, 24, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 310 ; HP
	bigdw 310 ; Max HP
	bigdw 225 ; Atk
	bigdw 209 ; Def
	bigdw 161 ; Spd
	bigdw 273 ; SAtk
	bigdw 193 ; SDef
	db "BANGIRASU@@"

	db GYARADOS
	db FOCUS_BAND
	db HYDRO_PUMP, THUNDER, EARTHQUAKE, ICY_WIND 
	dw 0 ; OT ID
	bigdt 640 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 8, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 310 ; HP
	bigdw 310 ; Max HP
	bigdw 273 ; Atk
	bigdw 199 ; Def
	bigdw 203 ; Spd
	bigdw 169 ; SAtk
	bigdw 233 ; SDef
	db "GENGA-@@@@@"

	db VAPOREON
	db CHESTO_BERRY
	db SURF, ICE_BEAM, TOXIC, REST 
	dw 0 ; OT ID
	bigdt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 24, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 366 ; HP
	bigdw 366 ; Max HP
	bigdw 177 ; Atk
	bigdw 169 ; Def
	bigdw 177 ; Spd
	bigdw 249 ; SAtk
	bigdw 225 ; SDef
	db "HUoRETOSU@@"

	db JOLTEON
	db MAGNET
	db THUNDERBOLT, THUNDER_WAVE, SHADOW_BALL, HIDDEN_POWER ; ICE 
	dw 0 ; OT ID
	bigdt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 13, 15, 15 ; DVs
	db 24, 32, 24, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 262 ; HP
	bigdw 262 ; Max HP
	bigdw 177 ; Atk
	bigdw 169 ; Def
	bigdw 281 ; Spd
	bigdw 249 ; SAtk
	bigdw 225 ; SDef
	db "KINGUDORA@@"

	db RHYDON
	db HARD_STONE
	db ROCK_SLIDE, EARTHQUAKE, MEGAHORN, SWORDS_DANCE 
	dw 0 ; OT ID
	bigdt 640000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 16, 48 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 326 ; HP
	bigdw 326 ; Max HP
	bigdw 281 ; Atk
	bigdw 265 ; Def
	bigdw 137 ; Spd
	bigdw 145 ; SAtk
	bigdw 145 ; SDef
	db "KAIRIyu-@@@"

	db AERODACTYL
	db LUM_BERRY
	db ROCK_SLIDE, EARTHQUAKE, FIRE_BLAST, CRUNCH
	dw 0 ; OT ID
	bigdt 640000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 8, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 286 ; HP
	bigdw 286 ; Max HP
	bigdw 241 ; Atk
	bigdw 177 ; Def
	bigdw 281 ; Spd
	bigdw 169 ; SAtk
	bigdw 193 ; SDef
	db "PORIGON2@@@"

	db TAUROS
	db SILK_SCARF
	db DOUBLE_EDGE, EARTHQUAKE, FIRE_BLAST, THUNDER
	dw 0 ; OT ID
	bigdt 640000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 24, 16, 8, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 278 ; HP
	bigdw 278 ; Max HP
	bigdw 233 ; Atk
	bigdw 225 ; Def
	bigdw 249 ; Spd
	bigdw 137 ; SAtk
	bigdw 185 ; SDef
	db "RU-ZIyuRA@@"

	db NIDOKING
	db SITRUS_BERRY
	db SLUDGE_BOMB, EARTHQUAKE, THUNDER, ICE_BEAM 
	dw 0 ; OT ID
	bigdt 526260 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 16, 16 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 288 ; HP
	bigdw 288 ; Max HP
	bigdw 240 ; Atk
	bigdw 197 ; Def
	bigdw 209 ; Spd
	bigdw 209 ; SAtk
	bigdw 193 ; SDef
	db "MANTAIN@@@@"

	db JYNX
	db FOCUS_BAND
	db PSYCHIC_M, ICE_BEAM, LOVELY_KISS, NIGHTMARE 
	dw 0 ; OT ID
	bigdt 512000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 262 ; HP
	bigdw 262 ; Max HP
	bigdw 153 ; Atk
	bigdw 129 ; Def
	bigdw 225 ; Spd
	bigdw 257 ; SAtk
	bigdw 225 ; SDef
	db "EA-MUDO@@@@"

	db STARMIE
	db CHERI_BERRY
	db PSYCHIC_M, SURF, ICE_BEAM, THUNDERBOLT 
	dw 0 ; OT ID
	bigdt 640000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 16, 24, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 254 ; HP
	bigdw 254 ; Max HP
	bigdw 193 ; Atk
	bigdw 209 ; Def
	bigdw 257 ; Spd
	bigdw 233 ; SAtk
	bigdw 209 ; SDef
	db "HUaIYA-@@@@"

	db CLOYSTER
	db PERSIM_BERRY
	db SURF, ICY_WIND, TOXIC, EXPLOSION
	dw 0 ; OT ID
	bigdt 640000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 24, 24, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 238 ; HP
	bigdw 238 ; Max HP
	bigdw 225 ; Atk
	bigdw 361 ; Def
	bigdw 185 ; Spd
	bigdw 209 ; SAtk
	bigdw 145 ; SDef
	db "PUTERA@@@@@"

	db GOLEM
	db SOFT_SAND
	db ROCK_SLIDE, EARTHQUAKE, EXPLOSION, FIRE_BLAST 
	dw 0 ; OT ID
	bigdt 526260 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 8, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 286 ; HP
	bigdw 286 ; Max HP
	bigdw 265 ; Atk
	bigdw 281 ; Def
	bigdw 145 ; Spd
	bigdw 161 ; SAtk
	bigdw 177 ; SDef
	db "MARUMAIN@@@"

	db GENGAR
	db SPELL_TAG
	db SHADOW_BALL, THUNDERBOLT, ICE_PUNCH, EXPLOSION 
	dw 0 ; OT ID
	bigdt 526260 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 24, 24, 24, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 254 ; HP
	bigdw 254 ; Max HP
	bigdw 177 ; Atk
	bigdw 169 ; Def
	bigdw 249 ; Spd
	bigdw 281 ; SAtk
	bigdw 193 ; SDef
	db "DAGUTORIO@@"

	db MACHAMP
	db BLACKBELT_I
	db CROSS_CHOP, ROCK_SLIDE, EARTHQUAKE, FIRE_BLAST 
	dw 0 ; OT ID
	bigdt 526260 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 8, 16, 16, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 302 ; HP
	bigdw 302 ; Max HP
	bigdw 281 ; Atk
	bigdw 201 ; Def
	bigdw 161 ; Spd
	bigdw 177 ; SAtk
	bigdw 209 ; SDef
	db "UTUBOtuTO@@"

	db ALAKAZAM
	db LUM_BERRY
	db PSYCHIC_M, DYNAMICPUNCH, RECOVER, FIRE_PUNCH 
	dw 0 ; OT ID
	bigdt 526260 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 16, 8, 16, 24 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 246 ; HP
	bigdw 246 ; Max HP
	bigdw 153 ; Atk
	bigdw 145 ; Def
	bigdw 265 ; Spd
	bigdw 289 ; SAtk
	bigdw 225 ; SDef
	db "UTUBOtuTO@@"

	db DRAGONITE
	db DRAGON_FANG
	db OUTRAGE, LOW_KICK, EXTREMESPEED, FIRE_BLAST 
	dw 0 ; OT ID
	bigdt 640000 ; Exp
	; Stat exp
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	bigdw 50000
	dn 15, 15, 15, 15 ; DVs
	db 16, 32, 8, 8 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 304 ; HP
	bigdw 304 ; Max HP
	bigdw 288 ; Atk
	bigdw 225 ; Def
	bigdw 201 ; Spd
	bigdw 233 ; SAtk
	bigdw 233 ; SDef
	db "GURANBURU@@"

	
	; Group 9
	
	db SUICUNE
	db LEFTOVERS
	db SURF, TOXIC, REST, SLEEP_TALK 
	dw 0 ; OT ID
	bigdt 911250 ; Exp
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
	bigdt 911250 ; Exp
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
	bigdt 911250 ; Exp
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
	bigdt 729000 ; Exp
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
	db SILVERPOWDER
	db PIN_MISSILE, ZAP_CANNON, EXPLOSION, TOXIC 
	dw 0 ; OT ID
	bigdt 729000 ; Exp
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
	bigdt 729000 ; Exp
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
	bigdw 352 ; HP
	bigdw 352 ; Max HP
	bigdw 239 ; Atk
	bigdw 239 ; Def
	bigdw 149 ; Spd
	bigdw 203 ; SAtk
	bigdw 203 ; SDef
	db "PORIGON2@@@"

	db ESPEON
	db FOCUS_BAND
	db PSYCHIC_M, SHADOW_BALL, MORNING_SUN, FUTURE_SIGHT 
	dw 0 ; OT ID
	bigdt 729000 ; Exp
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
	db SITRUS_BERRY
	db CONFUSE_RAY, TOXIC, CRUNCH, MOONLIGHT 
	dw 0 ; OT ID
	bigdt 729000 ; Exp
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
	bigdt 911250 ; Exp
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
	bigdt 911250 ; Exp
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
	bigdt 583200 ; Exp
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
	db IRON_TAIL, EXPLOSION, REST, CURSE 
	dw 0 ; OT ID
	bigdt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 24, 8, 16, 16 ; PP
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
	db PIN_MISSILE, ROCK_SLIDE, LOW_KICK, SWORDS_DANCE 
	dw 0 ; OT ID
	bigdt 911250 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 32, 16, 32, 48 ; PP
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
	db AGILITY, SWORDS_DANCE, METAL_CLAW, BATON_PASS 
	dw 0 ; OT ID
	bigdt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 48, 48, 56, 61 ; PP
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
	bigdt 911250 ; Exp
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
	db CHESTO_BERRY
	db HYDRO_PUMP, OUTRAGE, ICE_BEAM, REST 
	dw 0 ; OT ID
	bigdt 729000 ; Exp
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
	bigdt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 32, 16, 16 ; PP
	db 255 ; Happiness
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
	bigdt 729000 ; Exp
	; Stat exp
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	bigdw 60000
	dn 15, 15, 15, 15 ; DVs
	db 16, 32, 16, 16 ; PP
	db 255 ; Happiness
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
	bigdt 729000 ; Exp
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
	bigdt 911250 ; Exp
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
	db LUM_BERRY
	db ROCK_SLIDE, CRUNCH, THUNDER, EARTHQUAKE 
	dw 0 ; OT ID
	bigdt 911250 ; Exp
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
	bigdt 1250000 ; Exp
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
	bigdt 1250000 ; Exp
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
	bigdt 1250000 ; Exp
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
	bigdt 1250000 ; Exp
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
	db CURSE, AEROBLAST, RECOVER, SURF 
	dw 0 ; OT ID
	bigdt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 8, 16, 24 ; PP
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
	bigdt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 8, 16, 16, 16 ; PP
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
	bigdt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 8, 16, 16, 32 ; PP
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
	bigdt 1250000 ; Exp
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
	bigdt 1250000 ; Exp
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
	bigdt 1250000 ; Exp
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
	db REST, SLEEP_TALK, CURSE, RETURN 
	dw 0 ; OT ID
	bigdt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 16, 32 ; PP
	db 255 ; Happiness
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
	bigdt 1250000 ; Exp
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
	db FOCUS_BAND
	db MEGAHORN, ROCK_SLIDE, EARTHQUAKE, SWORDS_DANCE  
	dw 0 ; OT ID
	bigdt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 16, 16, 48 ; PP
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
	db LUM_BERRY
	db SHADOW_BALL, GIGA_DRAIN, THUNDER, EXPLOSION 
	dw 0 ; OT ID
	bigdt 1250000 ; Exp
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
	bigdt 1250000 ; Exp
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
	db SITRUS_BERRY
	db TOXIC, SURF, EARTHQUAKE, RECOVER 
	dw 0 ; OT ID
	bigdt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 24, 16, 16 ; PP
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
	db LUM_BERRY
	db THUNDER, SHADOW_BALL, SUBSTITUTE, HIDDEN_POWER ; HP = ICE 
	dw 0 ; OT ID
	bigdt 1250000 ; Exp
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
	db ICE_BEAM, THUNDERBOLT, DYNAMICPUNCH, SELFDESTRUCT 
	dw 0 ; OT ID
	bigdt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 16, 24, 8, 8 ; PP
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
	bigdt 1250000 ; Exp
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

	db SNORLAX
	db RAWST_BERRY
	db SELFDESTRUCT, EARTHQUAKE, THUNDER, DOUBLE_EDGE 
	dw 0 ; OT ID
	bigdt 1250000 ; Exp
	; Stat exp
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	bigdw 65535
	dn 15, 15, 15, 15 ; DVs
	db 8, 16, 16, 24 ; PP
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
	db "EBIWARA-@@@"

	db ENTEI
	db SITRUS_BERRY
	db FIRE_BLAST, SUNNY_DAY, SOLARBEAM, DOUBLE_EDGE
	dw 0 ; OT ID
	bigdt 1250000 ; Exp
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
