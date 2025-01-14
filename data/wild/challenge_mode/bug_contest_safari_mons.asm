ContestSafariMonsChallenge:
	;   %, species,   min, max

	map_id NATIONAL_PARK_BUG_CONTEST
.NationalPark
	table_width 4
; morning
	db 20, CATERPIE,    9, 20
	db 20, WEEDLE,      9, 20
	db 10, METAPOD,    11, 20
	db 10, KAKUNA,     11, 20
	db  5, BUTTERFREE, 14, 17
	db  5, BEEDRILL,   14, 17
	db 10, VENONAT,    12, 18
	db 10, PARAS,      12, 19
	db  5, SCYTHER,    15, 16
	db  5, PINSIR,     15, 16
; day/eve
	db 20, CATERPIE,    9, 20
	db 20, WEEDLE,      9, 20
	db 10, METAPOD,    11, 20
	db 10, KAKUNA,     11, 20
	db  5, BUTTERFREE, 14, 17
	db  5, BEEDRILL,   14, 17
	db 10, VENONAT,    12, 18
	db 10, PARAS,      12, 19
	db  5, SCYTHER,    15, 16
	db  5, PINSIR,     15, 16
; nite
	db 20, CATERPIE,    9, 20
	db 20, WEEDLE,      9, 20
	db 10, METAPOD,    11, 20
	db 10, KAKUNA,     11, 20
	db  5, BUTTERFREE, 14, 17
	db  5, BEEDRILL,   14, 17
	db 10, VENONAT,    12, 18
	db 10, PARAS,      12, 19
	db  5, SCYTHER,    15, 16
	db  5, PINSIR,     15, 16
	assert_table_length 30
	
	map_id SAFARI_ZONE_AREA_1
.Safari1
	table_width 4
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
	table_width 4
; morning
	db 20, NIDORAN_M,      22, 22
	db 20, NIDORAN_F,      22, 22
	db 15, SANDSHREW,      23, 23
	db 10, PONYTA,         23, 23
	db 10, CUBONE,         21, 21
	db 10, SLUGMA,         24, 24
	db  5, SANDSLASH,      26, 26
	db  5, NATU,           23, 23
	db  4, MAROWAK,        26, 26
	db  1, RAPIDASH,       27, 27
; day/eve  
	db 20, NIDORAN_M,      22, 22
	db 20, NIDORAN_F,      22, 22
	db 15, SANDSHREW,      23, 23
	db 10, PONYTA,         23, 23
	db 10, CUBONE,         21, 21
	db 10, SLUGMA,         24, 24
	db  5, SANDSLASH,      26, 26
	db  5, NATU,           23, 23
	db  4, MAROWAK,        26, 26
	db  1, RAPIDASH,       27, 27
; nite     
	db 20, NIDORINO,       22, 22
	db 20, NIDORINA,       22, 22
	db 15, SANDSHREW,      23, 23
	db 10, HOUNDOUR,       23, 23
	db 10, NOCTOWL,        23, 23
	db 10, SLUGMA,         24, 24
	db  5, SANDSLASH,      26, 26
	db  5, NATU,           23, 23
	db  4, CUBONE,         26, 26
	db  1, HOUNDOOM,       27, 27
	assert_table_length 30
	
	map_id SAFARI_ZONE_AREA_3
.Safari3
	table_width 4
; morning
	db 20, EKANS,         21, 21
	db 20, BELLSPROUT,    24, 24
	db 15, MARILL,        22, 22
	db 10, GRIMER,        24, 24
	db 10, YANMA,         25, 25
	db 10, TANGELA,       22, 22
	db  5, ARBOK,         23, 23
	db  5, WEEPINBELL,    26, 26
	db  4, FARFETCH_D,    25, 25
	db  1, MUK,           28, 28
; day/eve  
	db 20, EKANS,         21, 21
	db 20, BELLSPROUT,    24, 24
	db 15, MARILL,        22, 22
	db 10, GRIMER,        24, 24
	db 10, YANMA,         25, 25
	db 10, TANGELA,       22, 22
	db  5, ARBOK,         23, 23
	db  5, WEEPINBELL,    26, 26
	db  4, FARFETCH_D,    25, 25
	db  1, MUK,           28, 28
; nite     
	db 20, WOOPER,        21, 21
	db 20, ODDISH,        24, 24
	db 15, MARILL,        22, 22
	db 10, GRIMER,        24, 24
	db 10, YANMA,         25, 25
	db 10, MISDREAVUS,    22, 22
	db  5, QUAGSIRE,      23, 23
	db  5, GLOOM,         26, 26
	db  4, HAUNTER,       25, 25
	db  1, MUK,           28, 28
	assert_table_length 30
	
	map_id SAFARI_ZONE_AREA_4
.Safari4
	table_width 4
; morning
	db 20, MACHOP,      22, 22
	db 20, PARAS,       21, 21
	db 15, VOLTORB,     24, 24
	db 10, GLIGAR,      21, 21
	db 10, RHYHORN,     22, 22
	db 10, MACHOKE,     27, 27
	db  5, PARASECT,    24, 24
	db  5, LICKITUNG,   23, 23
	db  4, KANGASKHAN,  25, 25
	db  1, LARVITAR,    20, 20
; day/eve  
	db 20, MACHOP,      22, 22
	db 20, PARAS,       21, 21
	db 15, VOLTORB,     24, 24
	db 10, GLIGAR,      21, 21
	db 10, RHYHORN,     22, 22
	db 10, MACHOKE,     27, 27
	db  5, PARASECT,    24, 24
	db  5, LICKITUNG,   23, 23
	db  4, KANGASKHAN,  25, 25
	db  1, LARVITAR,    20, 20
; nite     
	db 20, MAGNEMITE,   22, 22
	db 20, PARAS,       21, 21
	db 15, VOLTORB,     24, 24
	db 10, GLIGAR,      21, 21
	db 10, RHYHORN,     22, 22
	db 10, MAGNETON,    27, 27
	db  5, PARASECT,    24, 24
	db  5, WOBBUFFET,   23, 23
	db  4, KANGASKHAN,  25, 25
	db  1, LARVITAR,    20, 20
	assert_table_length 30
	
	db -1 ; terminator
	