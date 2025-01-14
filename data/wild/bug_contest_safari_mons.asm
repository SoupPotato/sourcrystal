ContestSafariMonsNormal:
	;   %, species,   min, max

	map_id NATIONAL_PARK_BUG_CONTEST
.NationalPark
	table_width 4
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
	table_width 4
; morning
	db 20, SENTRET,       19, 19
	db 20, JIGGLYPUFF,    21, 21
	db 15, PIKACHU,       17, 17
	db 10, GIRAFARIG,     20, 20
	db 10, JIGGLYPUFF,    23, 23
	db 10, DODUO,         18, 18
	db  5, FURRET,        21, 21
	db  5, SMEARGLE,      20, 20
	db  4, MR__MIME,      22, 22
	db  1, CHANSEY,       24, 24
; day/eve
	db 20, SENTRET,       19, 19
	db 20, JIGGLYPUFF,    21, 21
	db 15, PIKACHU,       17, 17
	db 10, GIRAFARIG,     20, 20
	db 10, SUNKERN,       23, 23
	db 10, DODUO,         18, 18
	db  5, FURRET,        21, 21
	db  5, SMEARGLE,      20, 20
	db  4, MR__MIME,      22, 22
	db  1, CHANSEY,       24, 24
; nite
	db 20, PSYDUCK,       19, 19
	db 20, MURKROW,       21, 21
	db 15, PIKACHU,       17, 17
	db 10, STANTLER,      20, 20
	db 10, DROWZEE,       23, 23
	db 10, CLEFAIRY,      18, 18
	db  5, GOLDUCK,       21, 21
	db  5, GIRAFARIG,     20, 20
	db  4, MR__MIME,      22, 22
	db  1, CHANSEY,       24, 24
	assert_table_length 30
	
	map_id SAFARI_ZONE_AREA_2
.Safari2
	table_width 4
; morning
	db 20, NIDORAN_M,      19, 19
	db 20, NIDORAN_F,      19, 19
	db 15, SANDSHREW,      20, 20
	db 10, PONYTA,         18, 18
	db 10, CUBONE,         20, 20
	db 10, SLUGMA,         23, 23
	db  5, SANDSLASH,      21, 21
	db  5, NATU,           20, 20
	db  4, MAROWAK,        23, 23
	db  1, RAPIDASH,       24, 24
; day/eve  
	db 20, NIDORAN_M,      19, 19
	db 20, NIDORAN_F,      19, 19
	db 15, SANDSHREW,      20, 20
	db 10, PONYTA,         18, 18
	db 10, CUBONE,         20, 20
	db 10, SLUGMA,         23, 23
	db  5, SANDSLASH,      21, 21
	db  5, NATU,           20, 20
	db  4, MAROWAK,        23, 23
	db  1, RAPIDASH,       24, 24
; nite     
	db 20, NIDORINO,       19, 19
	db 20, NIDORINA,       19, 19
	db 15, SANDSHREW,      20, 20
	db 10, HOUNDOUR,       20, 20
	db 10, NOCTOWL,        20, 20
	db 10, SLUGMA,         23, 23
	db  5, SANDSLASH,      21, 21
	db  5, NATU,           20, 20
	db  4, CUBONE,         23, 23
	db  1, HOUNDOOM,       24, 24
	assert_table_length 30
	
	map_id SAFARI_ZONE_AREA_3
.Safari3
	table_width 4
; morning
	db 20, EKANS,         18, 18
	db 20, BELLSPROUT,    21, 21
	db 15, MARILL,        19, 19
	db 10, GRIMER,        21, 21
	db 10, YANMA,         19, 19
	db 10, TANGELA,       20, 20
	db  5, ARBOK,         22, 22
	db  5, WEEPINBELL,    23, 23
	db  4, FARFETCH_D,    22, 22
	db  1, MUK,           25, 25
; day/eve
	db 20, EKANS,         18, 18
	db 20, BELLSPROUT,    21, 21
	db 15, MARILL,        19, 19
	db 10, GRIMER,        21, 21
	db 10, YANMA,         19, 19
	db 10, TANGELA,       20, 20
	db  5, ARBOK,         22, 22
	db  5, WEEPINBELL,    23, 23
	db  4, FARFETCH_D,    22, 22
	db  1, MUK,           25, 25
; nite
	db 20, WOOPER,        18, 18
	db 20, ODDISH,        21, 21
	db 15, MARILL,        19, 19
	db 10, GRIMER,        21, 21
	db 10, YANMA,         19, 19
	db 10, MISDREAVUS,    20, 20
	db  5, QUAGSIRE,      22, 22
	db  5, GLOOM,         23, 23
	db  4, HAUNTER,       22, 22
	db  1, MUK,           25, 25
	assert_table_length 30
	
	map_id SAFARI_ZONE_AREA_4
.Safari4
	table_width 4
; morning
	db 20, MACHOP,      19, 19
	db 20, PARAS,       18, 18
	db 15, VOLTORB,     21, 21
	db 10, GLIGAR,      18, 18
	db 10, RHYHORN,     19, 19
	db 10, MACHOKE,     24, 24
	db  5, PARASECT,    21, 21
	db  5, LICKITUNG,   20, 20
	db  4, KANGASKHAN,  22, 22
	db  1, LARVITAR,    17, 17
; day/eve
	db 20, MACHOP,      19, 19
	db 20, PARAS,       18, 18
	db 15, VOLTORB,     21, 21
	db 10, GLIGAR,      18, 18
	db 10, RHYHORN,     19, 19
	db 10, MACHOKE,     24, 24
	db  5, PARASECT,    21, 21
	db  5, LICKITUNG,   20, 20
	db  4, KANGASKHAN,  22, 22
	db  1, LARVITAR,    17, 17
; nite
	db 20, MAGNEMITE,   19, 19
	db 20, PARAS,       18, 18
	db 15, VOLTORB,     21, 21
	db 10, GLIGAR,      18, 18
	db 10, RHYHORN,     19, 19
	db 10, MAGNETON,    24, 24
	db  5, PARASECT,    21, 21
	db  5, WOBBUFFET,   20, 20
	db  4, KANGASKHAN,  22, 22
	db  1, LARVITAR,    17, 17
	assert_table_length 30
	
	db -1 ; terminator
	