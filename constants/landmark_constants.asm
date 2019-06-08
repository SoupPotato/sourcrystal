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
	const PEWTER_CITY       ; 38
	const ROUTE_3           ; 39
	const MT_MOON           ; 3a
	const ROUTE_4           ; 3b
	const CERULEAN_CITY     ; 3c
	const ROUTE_24          ; 3d
	const ROUTE_25          ; 3e
	const ROUTE_5           ; 3f
	const UNDERGROUND_PATH  ; 40
	const ROUTE_6           ; 41
	const VERMILION_CITY    ; 42
	const DIGLETTS_CAVE     ; 43
	const ROUTE_7           ; 44
	const ROUTE_8           ; 45
	const ROUTE_9           ; 46
	const ROCK_TUNNEL       ; 47
	const ROUTE_10          ; 48
	const POWER_PLANT       ; 49
	const LAVENDER_TOWN     ; 4a
	const LAV_RADIO_TOWER   ; 4b
	const CELADON_CITY      ; 4c
	const SAFFRON_CITY      ; 4d
	const ROUTE_11          ; 4e
	const ROUTE_12          ; 4f
	const ROUTE_13          ; 50
	const ROUTE_14          ; 51
	const ROUTE_15          ; 52
	const ROUTE_16          ; 53
	const ROUTE_17          ; 54
	const ROUTE_18          ; 55
	const FUCHSIA_CITY      ; 56
	const ROUTE_19          ; 57
	const ROUTE_20          ; 58
	const SEAFOAM_ISLANDS   ; 59
	const CINNABAR_ISLAND   ; 5a
	const ROUTE_21          ; 5b
	const ROUTE_22          ; 5c
	const VICTORY_ROAD      ; 5d
	const ROUTE_23          ; 5e
	const INDIGO_PLATEAU    ; 5f
	const ROUTE_26          ; 60
	const ROUTE_27          ; 61
	const TOHJO_FALLS       ; 62
	const ROUTE_28          ; 63
	const FAST_SHIP         ; 64

; used in CaughtData
GIFT_LOCATION  EQU $7e
EVENT_LOCATION EQU $7f


; Regions
	const_def
	const JOHTO_REGION ; 0
	const KANTO_REGION ; 1
NUM_REGIONS EQU const_value
