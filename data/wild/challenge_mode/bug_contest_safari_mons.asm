ContestSafariMonsChallenge:
	;   %, species,   min, max

	map_id NATIONAL_PARK_BUG_CONTEST
.NationalPark ; TODO: change this?
	table_width 4, .NationalPark
; morning
	db 20, CATERPIE,    7, 18
	db 20, WEEDLE,      7, 18
	db 10, METAPOD,     9, 18
	db 10, KAKUNA,      9, 18
	db  5, BUTTERFREE, 12, 15
	db  5, BEEDRILL,   12, 15
	db 10, VENONAT,    10, 16
	db 10, PARAS,      10, 17
	db  5, SCYTHER,    13, 14
	db  5, PINSIR,     13, 14
; day/eve
	db 20, CATERPIE,    7, 18
	db 20, WEEDLE,      7, 18
	db 10, METAPOD,     9, 18
	db 10, KAKUNA,      9, 18
	db  5, BUTTERFREE, 12, 15
	db  5, BEEDRILL,   12, 15
	db 10, VENONAT,    10, 16
	db 10, PARAS,      10, 17
	db  5, SCYTHER,    13, 14
	db  5, PINSIR,     13, 14
; nite
	db 20, CATERPIE,    7, 18
	db 20, WEEDLE,      7, 18
	db 10, METAPOD,     9, 18
	db 10, KAKUNA,      9, 18
	db  5, BUTTERFREE, 12, 15
	db  5, BEEDRILL,   12, 15
	db 10, VENONAT,    10, 16
	db 10, PARAS,      10, 17
	db  5, SCYTHER,    13, 14
	db  5, PINSIR,     13, 14
	assert_table_length 30
	
	map_id SAFARI_ZONE_AREA_1
.Safari1
	table_width 4, .Safari1
; morning
	db 20, SENTRET,       22, 22
	db 20, JIGGLYPUFF,    24, 24
	db 15, PIKACHU,       20, 20
	db 10, GIRAFARIG,     23, 23
	db 10, JIGGLYPUFF,    26, 26
	db 10, DODUO,         21, 21
	db  5, FURRET,        24, 24
	db  5, SMEARGLE,      23, 23
	db  4, MR__MIME,      25, 25
	db  1, CHANSEY,       27, 27
; day/eve
	db 20, SENTRET,       22, 22
	db 20, JIGGLYPUFF,    24, 24
	db 15, PIKACHU,       20, 20
	db 10, GIRAFARIG,     23, 23
	db 10, SUNKERN,       26, 26
	db 10, DODUO,         21, 21
	db  5, FURRET,        24, 24
	db  5, SMEARGLE,      23, 23
	db  4, MR__MIME,      25, 25
	db  1, CHANSEY,       27, 27
; nite
	db 20, PSYDUCK,       22, 22
	db 20, MURKROW,       24, 24
	db 15, PIKACHU,       20, 20
	db 10, STANTLER,      23, 23
	db 10, DROWZEE,       26, 26
	db 10, CLEFAIRY,      21, 21
	db  5, GOLDUCK,       24, 24
	db  5, GIRAFARIG,     23, 23
	db  4, MR__MIME,      25, 25
	db  1, CHANSEY,       27, 27
	assert_table_length 30
	
	map_id SAFARI_ZONE_AREA_2
.Safari2
	table_width 4, .Safari2
; morning
	db 20, NIDORAN_M,      22, 22
	db 20, NIDORAN_F,      22, 22
	db 15, SANDSHREW,      23, 23
	db 10, CUBONE,         21, 21
	db 10, PONYTA,         23, 23
	db 10, SANDSLASH,      26, 26
	db  5, GLIGAR,         24, 24
	db  5, NATU,           23, 23
	db  4, MAROWAK,        26, 26
	db  1, RAPIDASH,       27, 27
; day/eve
	db 20, NIDORAN_M,      22, 22
	db 20, NIDORAN_F,      22, 22
	db 15, SANDSHREW,      23, 23
	db 10, CUBONE,         21, 21
	db 10, PONYTA,         23, 23
	db 10, SANDSLASH,      26, 26
	db  5, GLIGAR,         24, 24
	db  5, NATU,           23, 23
	db  4, MAROWAK,        26, 26
	db  1, RAPIDASH,       27, 27
; nite
	db 20, NIDORINO,       22, 22
	db 20, NIDORINA,       22, 22
	db 15, SANDSHREW,      23, 23
	db 10, NOCTOWL,        23, 23
	db 10, HOUNDOUR,       23, 23
	db 10, SANDSLASH,      26, 26
	db  5, GLIGAR,         24, 24
	db  5, NATU,           23, 23
	db  4, CUBONE,         26, 26
	db  1, HOUNDOOM,       27, 27
	assert_table_length 30
	
	map_id SAFARI_ZONE_AREA_3
.Safari3
	table_width 4, .Safari3
; morning
	db 20, EKANS,         21, 21
	db 20, BELLSPROUT,    24, 24
	db 15, MARILL,        22, 22
	db 10, GRIMER,        24, 24
	db 10, TANGELA,       25, 25
	db 10, ARBOK,         23, 23
	db  5, YANMA,         22, 22
	db  5, WEEPINBELL,    26, 26
	db  4, FARFETCH_D,    25, 25
	db  1, MUK,           28, 28
; day/eve
	db 20, EKANS,         21, 21
	db 20, BELLSPROUT,    24, 24
	db 15, MARILL,        22, 22
	db 10, GRIMER,        24, 24
	db 10, TANGELA,       25, 25
	db 10, ARBOK,         23, 23
	db  5, YANMA,         22, 22
	db  5, WEEPINBELL,    26, 26
	db  4, FARFETCH_D,    25, 25
	db  1, MUK,           28, 28
; nite
	db 20, WOOPER,        21, 21
	db 20, ODDISH,        24, 24
	db 15, MARILL,        22, 22
	db 10, GRIMER,        24, 24
	db 10, HAUNTER,       25, 25
	db 10, QUAGSIRE,      23, 23
	db  5, YANMA,         22, 22
	db  5, GLOOM,         26, 26
	db  4, MISDREAVUS,    25, 25
	db  1, MUK,           28, 28
	assert_table_length 30
	
	map_id SAFARI_ZONE_AREA_4
.Safari4
	table_width 4, .Safari4
; morning
	db 20, MACHOP,      22, 22
	db 20, GEODUDE,     21, 21
	db 15, VOLTORB,     24, 24
	db 10, ONIX,        21, 21
	db 10, RHYHORN,     22, 22
	db 10, MACHOKE,     27, 27
	db  5, GRAVELER,    24, 24
	db  5, LICKITUNG,   23, 23
	db  4, KANGASKHAN,  25, 25
	db  1, LARVITAR,    20, 20
; day/eve
	db 20, MACHOP,      22, 22
	db 20, GEODUDE,     21, 21
	db 15, VOLTORB,     24, 24
	db 10, ONIX,        21, 21
	db 10, RHYHORN,     22, 22
	db 10, MACHOKE,     27, 27
	db  5, GRAVELER,    24, 24
	db  5, LICKITUNG,   23, 23
	db  4, KANGASKHAN,  25, 25
	db  1, LARVITAR,    20, 20
; nite
	db 20, ZUBAT,       22, 22
	db 20, MAGNEMITE,   21, 21
	db 15, VOLTORB,     24, 24
	db 10, ONIX,        21, 21
	db 10, RHYHORN,     22, 22
	db 10, GOLBAT,      27, 27
	db  5, MAGNETON,    24, 24
	db  5, WOBBUFFET,   23, 23
	db  4, ONIX,        25, 25
	db  1, LARVITAR,    20, 20
	assert_table_length 30
	
	db -1 ; terminator
	