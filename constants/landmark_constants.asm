; Landmarks indexes (see data/maps/landmarks.asm)
	const_def

; Johto landmarks
	const SPECIAL_MAP       ; 00
	const NEW_BARK_TOWN     ; 01
	const ROUTE_29          ; 02
	const CHERRYGROVE_CITY  ; 03
	const ROUTE_30          ; 04
	const ROUTE_31          ; 05
	const VIOLET_CITY       ; 06
	const SPROUT_TOWER      ; 07
	const ROUTE_32          ; 08
	const RUINS_OF_ALPH     ; 09
	const UNION_CAVE        ; 0a
	const ROUTE_33          ; 0b
	const AZALEA_TOWN       ; 0c
	const SLOWPOKE_WELL     ; 0d
	const ILEX_FOREST       ; 0e
	const ROUTE_34          ; 0f
	const GOLDENROD_CITY    ; 10
	const RADIO_TOWER       ; 11
	const ROUTE_35          ; 12
	const NATIONAL_PARK     ; 13
	const ROUTE_36          ; 14
	const ROUTE_37          ; 15
	const ECRUTEAK_CITY     ; 16
	const TIN_TOWER         ; 17
	const BURNED_TOWER      ; 18
	const ROUTE_38          ; 19
	const ROUTE_39          ; 1a
	const OLIVINE_CITY      ; 1b
	const LIGHTHOUSE        ; 1c
	const BATTLE_TOWER      ; 1d
	const ROUTE_40          ; 1e
	const WHIRL_ISLANDS     ; 1f
	const ROUTE_41          ; 20
	const CIANWOOD_CITY     ; 21
	const CLIFF_EDGE_GATE   ; 22
	const ROUTE_47          ; 23
	const CLIFF_CAVE        ; 24
	const ROUTE_48          ; 25
	const YELLOW_FOREST_GATE; 26
	const YELLOW_FOREST     ; 27
	const ROUTE_42          ; 28
	const MT_MORTAR         ; 29
	const MAHOGANY_TOWN     ; 2a
	const ROUTE_43          ; 2b
	const LAKE_OF_RAGE      ; 2c
	const ROUTE_44          ; 2d
	const ICE_PATH          ; 2e
	const BLACKTHORN_CITY   ; 2f
	const DRAGONS_DEN       ; 30
	const ROUTE_45          ; 31
	const DARK_CAVE         ; 32
	const ROUTE_46          ; 33
	const SILVER_CAVE       ; 34

KANTO_LANDMARK EQU const_value
	const PALLET_TOWN       ; 35
	const ROUTE_1           ; 36
	const VIRIDIAN_CITY     ; 37
	const ROUTE_2           ; 38
	const VIRIDIAN_FOREST   ; 39
	const PEWTER_CITY       ; 3a
	const ROUTE_3           ; 3b
	const MT_MOON           ; 3c
	const ROUTE_4           ; 3d
	const CERULEAN_CITY     ; 3e
	const CERULEAN_CAVE     ; 3f
	const ROUTE_24          ; 40
	const ROUTE_25          ; 41
	const ROUTE_5           ; 42
	const UNDERGROUND_PATH  ; 43
	const ROUTE_6           ; 44
	const VERMILION_CITY    ; 45
	const DIGLETTS_CAVE     ; 46
	const ROUTE_7           ; 47
	const ROUTE_8           ; 48
	const ROUTE_9           ; 49
	const ROCK_TUNNEL       ; 4a
	const ROUTE_10          ; 4b
	const POWER_PLANT       ; 4c
	const LAVENDER_TOWN     ; 4d
	const LAV_RADIO_TOWER   ; 4e
	const CELADON_CITY      ; 4f
	const SAFFRON_CITY      ; 50
	const ROUTE_11          ; 51
	const ROUTE_12          ; 52
	const ROUTE_13          ; 53
	const ROUTE_14          ; 54
	const ROUTE_15          ; 55
	const ROUTE_16          ; 56
	const ROUTE_17          ; 57
	const ROUTE_18          ; 58
	const FUCHSIA_CITY      ; 59
	const ROUTE_19          ; 5a
	const ROUTE_20          ; 5b
	const SEAFOAM_ISLANDS   ; 5c
	const CINNABAR_ISLAND   ; 5d
	const POKEMON_MANSION   ; 5e
	const ROUTE_21          ; 5f
	const ROUTE_22          ; 60
	const VICTORY_ROAD      ; 61
	const ROUTE_23          ; 62
	const INDIGO_PLATEAU    ; 63
	const ROUTE_26          ; 64
	const ROUTE_27          ; 65
	const TOHJO_FALLS       ; 66
	const ROUTE_28          ; 67
	const FAST_SHIP         ; 68

; used in CaughtData
GIFT_LOCATION  EQU $7e
EVENT_LOCATION EQU $7f


; Regions
	const_def
	const JOHTO_REGION ; 0
	const KANTO_REGION ; 1
NUM_REGIONS EQU const_value
