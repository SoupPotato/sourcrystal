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
	const YELLOW_FOREST     ; 26
	const ROUTE_42          ; 27
	const MT_MORTAR         ; 28
	const MAHOGANY_TOWN     ; 29
	const ROUTE_43          ; 2a
	const LAKE_OF_RAGE      ; 2b
	const ROUTE_44          ; 2c
	const ICE_PATH          ; 2d
	const BLACKTHORN_CITY   ; 2e
	const DRAGONS_DEN       ; 2f
	const ROUTE_45          ; 30
	const DARK_CAVE         ; 31
	const ROUTE_46          ; 32
	const SILVER_CAVE       ; 33

KANTO_LANDMARK EQU const_value
	const PALLET_TOWN       ; 34
	const ROUTE_1           ; 35
	const VIRIDIAN_CITY     ; 36
	const ROUTE_2           ; 37
	const VIRIDIAN_FOREST   ; 38
	const PEWTER_CITY       ; 39
	const ROUTE_3           ; 3a
	const MT_MOON           ; 3b
	const ROUTE_4           ; 3c
	const CERULEAN_CITY     ; 3d
	const ROUTE_24          ; 3e
	const ROUTE_25          ; 3f
	const ROUTE_5           ; 40
	const UNDERGROUND_PATH  ; 41
	const ROUTE_6           ; 42
	const VERMILION_CITY    ; 43
	const DIGLETTS_CAVE     ; 44
	const ROUTE_7           ; 45
	const ROUTE_8           ; 46
	const ROUTE_9           ; 47
	const ROCK_TUNNEL       ; 48
	const ROUTE_10          ; 49
	const POWER_PLANT       ; 4a
	const LAVENDER_TOWN     ; 4b
	const LAV_RADIO_TOWER   ; 4c
	const CELADON_CITY      ; 4d
	const SAFFRON_CITY      ; 4e
	const ROUTE_11          ; 4f
	const ROUTE_12          ; 50
	const ROUTE_13          ; 51
	const ROUTE_14          ; 52
	const ROUTE_15          ; 53
	const ROUTE_16          ; 54
	const ROUTE_17          ; 55
	const ROUTE_18          ; 56
	const FUCHSIA_CITY      ; 57
	const ROUTE_19          ; 58
	const ROUTE_20          ; 59
	const SEAFOAM_ISLANDS   ; 5a
	const CINNABAR_ISLAND   ; 5b
	const ROUTE_21          ; 5c
	const ROUTE_22          ; 5d
	const VICTORY_ROAD      ; 5e
	const ROUTE_23          ; 5f
	const INDIGO_PLATEAU    ; 60
	const ROUTE_26          ; 61
	const ROUTE_27          ; 62
	const TOHJO_FALLS       ; 63
	const ROUTE_28          ; 64
	const FAST_SHIP         ; 65

; used in CaughtData
GIFT_LOCATION  EQU $7e
EVENT_LOCATION EQU $7f


; Regions
	const_def
	const JOHTO_REGION ; 0
	const KANTO_REGION ; 1
NUM_REGIONS EQU const_value
