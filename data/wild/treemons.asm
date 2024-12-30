TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2
	dw TreeMonSet_City
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Plains
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	dw TreeMonSet_BurnedTower
	dw TreeMonSet_Safari
	dw TreeMonSet_Central_Kanto
	dw TreeMonSet_Western_Kanto
	dw TreeMonSet_Southern_Kanto
	dw TreeMonSet_Northern_Kanto
	dw TreeMonSet_Medows_Kanto
	dw TreeMonSet_Mt_Silver
	assert_table_length NUM_TREEMON_SETS
	dw TreeMonSet_City ; unused

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	db 50, SPEAROW,    10
	db 15, SPEAROW,    10
	db 15, SPEAROW,    10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1
; rare
	db 50, SPEAROW,    10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

TreeMonSet_Town:
; common
	db 50, SPEAROW,    10
	db 15, EKANS,      10
	db 15, SPEAROW,    10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1
; rare
	db 50, SPEAROW,    10
	db 15, HERACROSS,  10
	db 15, HERACROSS,  10
	db 10, AIPOM,      10
	db  5, AIPOM,      10
	db  5, AIPOM,      10
	db -1

TreeMonSet_Route:
; common
	db 50, HOOTHOOT,   10
	db 15, SPINARAK,   10
	db 15, LEDYBA,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Plains:
; common
	db 50, HOOTHOOT,   10
	db 15, EKANS,      10
	db 15, HOOTHOOT,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Lake:
; common
	db 50, HOOTHOOT,   10
	db 15, VENONAT,    10
	db 15, HOOTHOOT,   10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db  5, EXEGGCUTE,  10
	db -1

TreeMonSet_Forest:
; common
	db 50, HOOTHOOT,   10
	db 15, PINECO,     10
	db 15, PINECO,     10
	db 10, NOCTOWL,    10
	db  5, BUTTERFREE, 10
	db  5, BEEDRILL,   10
	db -1
; rare
	db 50, HOOTHOOT,   10
	db 15, CATERPIE,   10
	db 15, WEEDLE,     10
	db 10, HOOTHOOT,   10
	db  5, METAPOD,    10
	db  5, KAKUNA,     10
	db -1

TreeMonSet_Safari:
; common
	db 50, HOOTHOOT,   15
	db 15, PINECO,     15
	db 15, PINECO,     15
	db 10, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db -1
; rare
	db 50, HOOTHOOT,   15
	db 15, PINECO,     15
	db 15, AIPOM,      15
	db 10, AIPOM,      15
	db  5, SKARMORY,   15
	db  5, SKARMORY,   15
	db -1

TreeMonSet_Central_Kanto:
; common
	db 50, HOOTHOOT,   20
	db 15, LEDYBA,     20
	db 15, SPINARAK,   20
	db 10, HOOTHOOT,   20
	db  5, HOOTHOOT,   20
	db  5, HOOTHOOT,   20
	db -1
; rare
	db 50, HOOTHOOT,   20
	db 15, PINECO,     20
	db 15, PINECO,     20
	db 10, HOOTHOOT,   20
	db  5, LEDIAN,     20
	db  5, ARIADOS,    20
	db -1

TreeMonSet_Western_Kanto:
; common
	db 50, HOOTHOOT,   20
	db 15, CATERPIE,   20
	db 15, WEEDLE,     20
	db 10, HOOTHOOT,   20
	db  5, HOOTHOOT,   20
	db  5, HOOTHOOT,   20
	db -1
; rare
	db 50, HOOTHOOT,   20
	db 15, PINECO,     20
	db 15, PINECO,     20
	db 10, HOOTHOOT,   20
	db  5, MANKEY,     20
	db  5, MANKEY,     20
	db -1

TreeMonSet_Southern_Kanto:
; common
	db 50, HOOTHOOT,   20
	db 15, LEDYBA,     20
	db 15, SPINARAK,   20
	db 10, HOOTHOOT,   20
	db  5, HOOTHOOT,   20
	db  5, HOOTHOOT,   20
	db -1
; rare
	db 50, HOOTHOOT,   20
	db 15, PINECO,     20
	db 15, PINECO,     20
	db 10, TANGELA,    20
	db  5, TANGELA,    20
	db  5, TANGELA,    20
	db -1

TreeMonSet_Northern_Kanto:
; common
	db 50, HOOTHOOT,   20
	db 15, CATERPIE,   20
	db 15, WEEDLE,     20
	db 10, HOOTHOOT,   20
	db  5, HOOTHOOT,   20
	db  5, HOOTHOOT,   20
	db -1
; rare
	db 50, HOOTHOOT,   20
	db 15, PINECO,     20
	db 15, PINECO,     20
	db 10, VENONAT,    20
	db  5, VENONAT,    20
	db  5, VENONAT,    20
	db -1

TreeMonSet_Medows_Kanto:
; common
	db 50, SPEAROW,    20
	db 15, SPEAROW,    20
	db 15, SPEAROW,    20
	db 10, VENONAT,    20
	db  5, VENONAT,    20
	db  5, VENONAT,    20
	db -1
; rare
	db 50, SPEAROW,    20
	db 15, HERACROSS,  20
	db 15, HERACROSS,  20
	db 10, VENONAT,    20
	db  5, VENONAT,    20
	db  5, VENONAT,    20
	db -1

TreeMonSet_Mt_Silver:
; common
	db 50, HERACROSS,  30
	db 15, AIPOM,      30
	db 15, AIPOM,      30
	db 10, NATU,       30
	db  5, NATU,       30
	db  5, NATU,       30
	db -1
; rare
	db 50, HERACROSS,  30
	db 15, AIPOM,      30
	db 15, AIPOM,      30
	db 10, NATU,       30
	db  5, NATU,       30
	db  5, NATU,       30
	db -1

TreeMonSet_Rock:
	db 90, KRABBY,     15
	db 10, SHUCKLE,    15
	db -1

TreeMonSet_BurnedTower:
	db 90, GEODUDE,     15
	db 10, SLUGMA,      15
	db -1
