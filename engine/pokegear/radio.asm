PlayRadioShow:
; If we're already in the radio program proper, we don't need to be here.
	ld a, [wCurrentRadioLine]
	cp POKE_FLUTE_RADIO
	jr nc, .ok
; If Team Rocket is not occupying the radio tower, we don't need to be here.
	ld a, [wStatusFlags2]
	bit STATUSFLAGS2_ROCKETS_IN_RADIO_TOWER_F, a
	jr z, .ok
; If we're in Kanto, we don't need to be here.
	call IsInJohto
	and a
	jr nz, .ok
; Team Rocket broadcasts on all stations.
	ld a, ROCKET_RADIO
	ld [wCurrentRadioLine], a
.ok
; Jump to the currently loaded station.  The index to which we need to jump is in wCurrentRadioLine.
	ld a, [wCurrentRadioLine]
	ld e, a
	ld d, 0
	ld hl, RadioJumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

RadioJumptable:
; entries correspond to constants/radio_constants.asm
	dw OaksPKMNTalk1  ; $00
	dw BenMonMusic1  ; $02
	dw LuckyNumberShow1 ; $03
	dw BuenasPassword1 ; $04
	dw PeoplePlaces1 ; $05
	dw FernMonMusic1 ; $06
	dw RocketRadio1 ; $07
	dw PokeFluteRadio ; $08
	dw UnownRadio ; $09
	dw EvolutionRadio ; $0a
; OaksPKMNTalk
	dw OaksPKMNTalk2  ; $0b
	dw OaksPKMNTalk3  ; $0c
	dw OaksPKMNTalk4  ; $0d
	dw OaksPKMNTalk5  ; $0e
	dw OaksPKMNTalk6  ; $0f
	dw OaksPKMNTalk7  ; $10
	dw OaksPKMNTalk8  ; $11
	dw OaksPKMNTalk9  ; $12
; Ben Music
	dw BenMonMusic2  ; $17
	dw BenMonMusic3  ; $18
	dw BenFernMusic4 ; $19
	dw BenFernMusic5 ; $1a
	dw BenFernMusic6 ; $1b
	dw BenFernMusic7 ; $1c
	dw FernMonMusic2 ; $1d
; Lucky Number Show
	dw LuckyNumberShow2 ; $1e
	dw LuckyNumberShow3 ; $1f
	dw LuckyNumberShow4 ; $20
	dw LuckyNumberShow5 ; $21
	dw LuckyNumberShow6 ; $22
	dw LuckyNumberShow7 ; $23
	dw LuckyNumberShow8 ; $24
	dw LuckyNumberShow9 ; $25
	dw LuckyNumberShow10 ; $26
	dw LuckyNumberShow11 ; $27
	dw LuckyNumberShow12 ; $28
	dw LuckyNumberShow13 ; $29
	dw LuckyNumberShow14 ; $2a
	dw LuckyNumberShow15 ; $2b
; People & Places
	dw PeoplePlaces2 ; $2c
	dw PeoplePlaces3 ; $2d
	dw PeoplePlaces4 ; $2e
	dw PeoplePlaces5 ; $2f
	dw PeoplePlaces6 ; $30
	dw PeoplePlaces7 ; $31
; Rocket Radio
	dw RocketRadio2 ; $32
	dw RocketRadio3 ; $33
	dw RocketRadio4 ; $34
	dw RocketRadio5 ; $35
	dw RocketRadio6 ; $36
	dw RocketRadio7 ; $37
	dw RocketRadio8 ; $38
	dw RocketRadio9 ; $39
	dw RocketRadio10 ; $3a
; More Pokemon Channel stuff
	dw OaksPKMNTalk10 ; $3b
	dw OaksPKMNTalk11 ; $3c
	dw OaksPKMNTalk12 ; $3d
	dw OaksPKMNTalk13 ; $3e
	dw OaksPKMNTalk14 ; $3f
; Buenas Password
	dw BuenasPassword2 ; $40
	dw BuenasPassword3 ; $41
	dw BuenasPassword4 ; $42
	dw BuenasPassword5 ; $43
	dw BuenasPassword6 ; $44
	dw BuenasPassword7 ; $45
	dw BuenasPassword8 ; $46
	dw BuenasPassword9 ; $47
	dw BuenasPassword10 ; $48
	dw BuenasPassword11 ; $49
	dw BuenasPassword12 ; $4a
	dw BuenasPassword13 ; $4b
	dw BuenasPassword14 ; $4c
	dw BuenasPassword15 ; $4d
	dw BuenasPassword16 ; $4e
	dw BuenasPassword17 ; $4f
	dw BuenasPassword18 ; $50
	dw BuenasPassword19 ; $51
	dw BuenasPassword20 ; $52
	dw BuenasPassword21 ; $53
	dw RadioScroll ; $54
; More Pokemon Channel stuff
	dw OaksPKMNTalkSwarm1  ; $58
	dw OaksPKMNTalkSwarm2  ; $59
	dw OaksPKMNTalkSwarm3  ; $5a
	dw OaksPKMNTalkSwarm4  ; $5b
	dw OaksPKMNTalkSwarm5  ; $5c
	dw OaksPKMNTalkSwarm6  ; $5d
	dw OaksPKMNTalkSwarm7  ; $5e
	dw OaksPKMNTalkSwarm8  ; $5f
	dw OaksPKMNTalkSwarm9  ; $60
	dw OaksPKMNTalkSwarm10 ; $61
	dw OaksPKMNTalkSwarm11 ; $62
	dw OaksPKMNTalkSwarm12 ; $63


PrintRadioLine:
	ld [wNextRadioLine], a
	ld hl, wRadioText
	ld a, [wNumRadioLinesPrinted]
	cp 2
	jr nc, .print
	inc hl
	ld [hl], TX_START
	inc a
	ld [wNumRadioLinesPrinted], a
	cp 2
	jr nz, .print
	bccoord 1, 16
	call PlaceHLTextAtBC
	jr .skip
.print
	call PrintTextBoxText
.skip
	ld a, RADIO_SCROLL
	ld [wCurrentRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	ret

ReplacePeriodsWithSpaces:
	push hl
	ld b, SCREEN_WIDTH * 2
.loop
	ld a, [hl]
	cp "."
	jr nz, .next
	ld [hl], " "

.next
	inc hl
	dec b
	jr nz, .loop
	pop hl
	ret

RadioScroll:
	ld hl, wRadioTextDelay
	ld a, [hl]
	and a
	jr z, .proceed
	dec [hl]
	ret
.proceed
	ld a, [wNextRadioLine]
	ld [wCurrentRadioLine], a
	ld a, [wNumRadioLinesPrinted]
	cp 1
	call nz, CopyBottomLineToTopLine
	jp ClearBottomLine

OaksPKMNTalk1:
	ld a, 5
	ld [wOaksPKMNTalkSegmentCounter], a
	call StartRadioStation
	ld hl, OPT_IntroText1
	ld a, OAKS_POKEMON_TALK_2
	jp NextRadioLine

OaksPKMNTalk2:
	ld hl, OPT_IntroText2
	ld a, OAKS_POKEMON_TALK_3
	jp NextRadioLine

OaksPKMNTalk3:
	ld hl, OPT_IntroText3
	ld a, OAKS_POKEMON_TALK_SWARM_1
	jp NextRadioLine


OaksPKMNTalkSwarm1:
	ld hl, wDailyFlags
	bit DAILYFLAGS_SWARM_F, [hl]
	jr nz, .check_alt_swarm
	jp .generate_flag

.check_alt_swarm
	ld hl, wSwarmFlags
	bit SWARMFLAGS_ALT_SWARM_F, [hl]
	jr nz, .done

.generate_flag
	call Random ; generate a random number below 8
	and %11 ; '3' in bit  (increase bit number with each new added swarm)
	cp 0
	jr z, .normal_swarm
	cp 1
	jr z, .alternate_swarm
	jp .generate_flag

.normal_swarm
	ld hl, wDailyFlags
	bit DAILYFLAGS_SWARM_F, [hl]
	jr z, .generate_number
	jp .done
	
.alternate_swarm
	ld hl, wSwarmFlags
	bit SWARMFLAGS_ALT_SWARM_F, [hl]
	jr z, .generate_alt_number
	jp .done
	
.done
	jp OaksPKMNTalk4

.generate_number
	call Random ; generate a random number below 32
	and %11111 ; '31' in bit  (increase bit number with each new added swarm)
	cp 0
	jp z, .yanma
	cp 1
	jp z, .dunsparce
	cp 2
	jp z, .qwilfish
	cp 3
	jp z, .marill
	cp 4
	jp z, .magnemite
	cp 5
	jp z, .chinchou
	cp 6
	jp z, .remoraid
	cp 7
	jp z, .phanpy
	cp 8
	jp z, .caterpie
	cp 9
	jp z, .spinarak
	cp 10
	jp z, .paras
	cp 11
	jp z, .hoppip
	cp 12
	jp z, .ditto
	cp 13
	jp z, .sunkern
	cp 14
	jp z, .vulpix
	cp 15
	jp z, .miltank
	cp 16
	jp z, .sandshrew
	cp 17
	jp z, .ekans
	cp 18
	jp z, .smeargle
	cp 19
	jp z, .horsea
	jp .generate_number

.generate_alt_number
	call Random ; generate a random number below 32
	and %11111 ; '31' in bit  (increase bit number with each new added swarm)
	cp 0
	jp z, .psyduck
	cp 1
	jp z, .teddiursa
	cp 2
	jp z, .bellsprout
	cp 3
	jp z, .machop
	cp 4
	jp z, .tauros
	cp 5
	jp z, .lickitung
	cp 6
	jp z, .corsola
	cp 7
	jp z, .slowpoke
	cp 8
	jp z, .weedle
	cp 9
	jp z, .ledyba
	cp 10
	jp z, .oddish
	cp 11
	jp z, .pineco
	cp 12
	jp z, .drowzee
	cp 13
	jp z, .venonat
	cp 14
	jp z, .growlithe
	cp 15
	jp z, .stantler
	cp 16
	jp z, .wooper
	cp 17
	jp z, .aipom
	cp 18
	jp z, .koffing
	cp 19
	jp z, .mantine
	jp .generate_alt_number

.yanma
	ld a, YANMA
	call .store_mon_name
	ld d, GROUP_ROUTE_35
	ld e, MAP_ROUTE_35
	farcall StoreSwarmMapIndices
	ld e, ROUTE_35
	jp .finish
.psyduck
	ld a, PSYDUCK
	call .store_mon_name
	ld d, GROUP_ROUTE_35
	ld e, MAP_ROUTE_35
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_35
	jp .finish

.dunsparce
	ld a, DUNSPARCE
	call .store_mon_name
	ld d, GROUP_DARK_CAVE_VIOLET_ENTRANCE
	ld e, MAP_DARK_CAVE_VIOLET_ENTRANCE
	farcall StoreSwarmMapIndices
	ld e, DARK_CAVE
	jp .finish
.teddiursa
	ld a, TEDDIURSA
	call .store_mon_name
	ld d, GROUP_DARK_CAVE_VIOLET_ENTRANCE
	ld e, MAP_DARK_CAVE_VIOLET_ENTRANCE
	farcall StoreSwarmMapIndicesAlternate
	ld e, DARK_CAVE
	jp .finish

.qwilfish
	ld a, QWILFISH
	call .store_mon_name
	ld d, GROUP_ROUTE_32
	ld e, MAP_ROUTE_32
	ld a, 1 ; FISHSWARM_QWILFISH (script_constants.asm)
	ld [wFishingSwarmFlag], a
	farcall StoreSwarmMapIndices
	ld e, ROUTE_32
	jp .finish
.bellsprout
	ld a, BELLSPROUT
	call .store_mon_name
	ld d, GROUP_ROUTE_32
	ld e, MAP_ROUTE_32
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_32
	jp .finish

.marill
	ld a, MARILL
	call .store_mon_name
	ld d, GROUP_MOUNT_MORTAR_1F_OUTSIDE
	ld e, MAP_MOUNT_MORTAR_1F_OUTSIDE
	farcall StoreSwarmMapIndices
	ld e, MT_MORTAR
	jp .finish
.machop
	ld a, MACHOP
	call .store_mon_name
	ld d, GROUP_MOUNT_MORTAR_1F_OUTSIDE
	ld e, MAP_MOUNT_MORTAR_1F_OUTSIDE
	farcall StoreSwarmMapIndicesAlternate
	ld e, MT_MORTAR
	jp .finish

.magnemite
	ld a, MAGNEMITE
	call .store_mon_name
	ld d, GROUP_ROUTE_38
	ld e, MAP_ROUTE_38
	farcall StoreSwarmMapIndices
	ld e, ROUTE_38
	jp .finish
.tauros
	ld a, TAUROS
	call .store_mon_name
	ld d, GROUP_ROUTE_38
	ld e, MAP_ROUTE_38
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_38
	jp .finish

.remoraid
	ld a, REMORAID
	call .store_mon_name
	ld d, GROUP_ROUTE_44
	ld e, MAP_ROUTE_44
	ld a, 2  ; FISHSWARM_REMORAID (script_constants.asm)
	ld [wFishingSwarmFlag], a
	farcall StoreSwarmMapIndices
	ld e, ROUTE_44
	jp .finish
.lickitung
	ld a, LICKITUNG
	call .store_mon_name
	ld d, GROUP_ROUTE_44
	ld e, MAP_ROUTE_44
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_44
	jp .finish

.chinchou
	ld a, CHINCHOU
	call .store_mon_name
	ld d, GROUP_OLIVINE_CITY
	ld e, MAP_OLIVINE_CITY
	ld a, 3  ; FISHSWARM_CHINCHOU (script_constants.asm)
	ld [wFishingSwarmFlag], a
	farcall StoreSwarmMapIndices
	ld e, OLIVINE_CITY
	jp .finish
.corsola
	ld a, CORSOLA
	call .store_mon_name
	ld d, GROUP_OLIVINE_CITY
	ld e, MAP_OLIVINE_CITY
	ld a, 4  ; FISHSWARM_CORSOLA (script_constants.asm)
	ld [wFishingSwarmFlag], a
	farcall StoreSwarmMapIndicesAlternate
	ld e, OLIVINE_CITY
	jp .finish

.phanpy
	ld a, PHANPY
	call .store_mon_name
	ld d, GROUP_ROUTE_46
	ld e, MAP_ROUTE_46
	farcall StoreSwarmMapIndices
	ld e, ROUTE_46
	jp .finish
.slowpoke
	ld a, SLOWPOKE
	call .store_mon_name
	ld d, GROUP_SLOWPOKE_WELL_B1F
	ld e, MAP_SLOWPOKE_WELL_B1F
	farcall StoreSwarmMapIndicesAlternate
	ld e, SLOWPOKE_WELL
	jp .finish

.caterpie
	ld a, CATERPIE
	call .store_mon_name
	ld d, GROUP_ROUTE_30
	ld e, MAP_ROUTE_30
	farcall StoreSwarmMapIndices
	ld e, ROUTE_30
	jp .finish
.weedle
	ld a, WEEDLE
	call .store_mon_name
	ld d, GROUP_ROUTE_30
	ld e, MAP_ROUTE_30
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_30
	jp .finish

.spinarak
	ld a, SPINARAK
	call .store_mon_name
	ld d, GROUP_ROUTE_31
	ld e, MAP_ROUTE_31
	farcall StoreSwarmMapIndices
	ld e, ROUTE_31
	jp .finish
.ledyba
	ld a, LEDYBA
	call .store_mon_name
	ld d, GROUP_ROUTE_31
	ld e, MAP_ROUTE_31
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_31
	jp .finish

.paras
	ld a, PARAS
	call .store_mon_name
	ld d, GROUP_ILEX_FOREST
	ld e, MAP_ILEX_FOREST
	farcall StoreSwarmMapIndices
	ld e, ILEX_FOREST
	jp .finish
.oddish
	ld a, ODDISH
	call .store_mon_name
	ld d, GROUP_ILEX_FOREST
	ld e, MAP_ILEX_FOREST
	farcall StoreSwarmMapIndicesAlternate
	ld e, ILEX_FOREST
	jp .finish

.hoppip
	ld a, HOPPIP
	call .store_mon_name
	ld d, GROUP_ROUTE_29
	ld e, MAP_ROUTE_29
	farcall StoreSwarmMapIndices
	ld e, ROUTE_29
	jp .finish
.pineco
	ld a, PINECO
	call .store_mon_name
	ld d, GROUP_ROUTE_29
	ld e, MAP_ROUTE_29
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_29
	jp .finish

.ditto
	ld a, DITTO
	call .store_mon_name
	ld d, GROUP_ROUTE_34
	ld e, MAP_ROUTE_34
	farcall StoreSwarmMapIndices
	ld e, ROUTE_34
	jp .finish
.drowzee
	ld a, DROWZEE
	call .store_mon_name
	ld d, GROUP_ROUTE_34
	ld e, MAP_ROUTE_34
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_34
	jp .finish

.miltank
	ld a, MILTANK
	call .store_mon_name
	ld d, GROUP_ROUTE_39
	ld e, MAP_ROUTE_39
	farcall StoreSwarmMapIndices
	ld e, ROUTE_39
	jp .finish

.stantler
	ld a, STANTLER
	call .store_mon_name
	ld d, GROUP_ROUTE_37
	ld e, MAP_ROUTE_37
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_37
	jp .finish

.sunkern
	ld a, SUNKERN
	call .store_mon_name
	ld d, GROUP_NATIONAL_PARK
	ld e, MAP_NATIONAL_PARK
	farcall StoreSwarmMapIndices
	ld e, NATIONAL_PARK
	jp .finish
.venonat
	ld a, VENONAT
	call .store_mon_name
	ld d, GROUP_NATIONAL_PARK
	ld e, MAP_NATIONAL_PARK
	farcall StoreSwarmMapIndicesAlternate
	ld e, NATIONAL_PARK
	jp .finish

.vulpix
	ld a, VULPIX
	call .store_mon_name
	ld d, GROUP_ROUTE_36
	ld e, MAP_ROUTE_36
	farcall StoreSwarmMapIndices
	ld e, ROUTE_36
	jp .finish
.growlithe
	ld a, GROWLITHE
	call .store_mon_name
	ld d, GROUP_ROUTE_36
	ld e, MAP_ROUTE_36
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_36
	jp .finish

.sandshrew
	ld a, SANDSHREW
	call .store_mon_name
	ld d, GROUP_UNION_CAVE_1F
	ld e, MAP_UNION_CAVE_1F
	farcall StoreSwarmMapIndices
	ld e, UNION_CAVE
	jp .finish
.wooper
	ld a, WOOPER
	call .store_mon_name
	ld d, GROUP_UNION_CAVE_1F
	ld e, MAP_UNION_CAVE_1F
	farcall StoreSwarmMapIndicesAlternate
	ld e, UNION_CAVE
	jp .finish

.ekans
	ld a, EKANS
	call .store_mon_name
	ld d, GROUP_ROUTE_33
	ld e, MAP_ROUTE_33
	farcall StoreSwarmMapIndices
	ld e, ROUTE_33
	jp .finish
.aipom
	ld a, AIPOM
	call .store_mon_name
	ld d, GROUP_ROUTE_33
	ld e, MAP_ROUTE_33
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_33
	jp .finish

.smeargle
	ld a, SMEARGLE
	call .store_mon_name
	ld d, GROUP_RUINS_OF_ALPH_OUTSIDE
	ld e, MAP_RUINS_OF_ALPH_OUTSIDE
	farcall StoreSwarmMapIndices
	ld e, RUINS_OF_ALPH
	jp .finish
.koffing
	ld a, KOFFING
	call .store_mon_name
	ld d, GROUP_BURNED_TOWER_1F
	ld e, MAP_BURNED_TOWER_1F
	farcall StoreSwarmMapIndicesAlternate
	ld e, BURNED_TOWER
	jp .finish

.horsea
	ld a, HORSEA
	call .store_mon_name
	ld d, GROUP_ROUTE_41
	ld e, MAP_ROUTE_41
	ld a, 5  ; FISHSWARM_HORSEA (script_constants.asm)
	ld [wFishingSwarmFlag], a
	farcall StoreSwarmMapIndices
	ld e, ROUTE_41
	jp .finish
.mantine
	ld a, MANTINE
	call .store_mon_name
	ld d, GROUP_ROUTE_41
	ld e, MAP_ROUTE_41
	ld a, 6  ; FISHSWARM_MANTINE (script_constants.asm)
	ld [wFishingSwarmFlag], a
	farcall StoreSwarmMapIndicesAlternate
	ld e, ROUTE_41
	jp .finish

.store_mon_name
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ret


.finish
	farcall GetLandmarkName
	ld hl, OPT_SwarmText1
	ld a, OAKS_POKEMON_TALK_SWARM_2
	jp NextRadioLine

OaksPKMNTalkSwarm2:
	ld hl, OPT_SwarmText2
	ld a, OAKS_POKEMON_TALK_SWARM_3
	jp NextRadioLine

OaksPKMNTalkSwarm3:
	ld hl, OPT_SwarmText3
	ld a, OAKS_POKEMON_TALK_SWARM_4
	jp NextRadioLine

OaksPKMNTalkSwarm4:
	ld hl, OPT_SwarmText4
	ld a, OAKS_POKEMON_TALK_SWARM_5
	jp NextRadioLine

OaksPKMNTalkSwarm5:
	ld hl, OPT_SwarmText5
	ld a, OAKS_POKEMON_TALK_SWARM_6
	jp NextRadioLine

OaksPKMNTalkSwarm6:
	ld hl, OPT_SwarmText6
	ld a, OAKS_POKEMON_TALK_SWARM_7
	jp NextRadioLine

OaksPKMNTalkSwarm7:
	ld hl, OPT_SwarmText7
	ld a, OAKS_POKEMON_TALK_SWARM_8
	jp NextRadioLine
	
OaksPKMNTalkSwarm8:
	ld hl, OPT_SwarmText8
	ld a, OAKS_POKEMON_TALK_SWARM_9
	jp NextRadioLine

OaksPKMNTalkSwarm9:
	ld hl, OPT_SwarmText9
	ld a, OAKS_POKEMON_TALK_SWARM_10
	jp NextRadioLine

OaksPKMNTalkSwarm10:
	ld hl, OPT_SwarmText10
	ld a, OAKS_POKEMON_TALK_SWARM_11
	jp NextRadioLine

OaksPKMNTalkSwarm11:
	ld hl, OPT_SwarmText11
	ld a, OAKS_POKEMON_TALK_SWARM_12
	jp NextRadioLine

OaksPKMNTalkSwarm12:
	ld hl, OPT_SwarmText12
	ld a, OAKS_POKEMON_TALK_4
	jp NextRadioLine

OaksPKMNTalk4:
; Choose a random route, and a random Pokemon from that route.
.sample
	call Random
	and %11111
	cp (OaksPKMNTalkRoutes.End - OaksPKMNTalkRoutes) / 2
	jr nc, .sample
	; We now have a number between 0 and 14.
	ld hl, OaksPKMNTalkRoutes
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	; bc now contains the chosen map's group and number indices.
	push bc

	; Search the JohtoGrassWildMons array for the chosen map.
	ld hl, JohtoGrassWildMons
.loop
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	cp -1
	jr z, .overflow
	inc hl
	cp b
	jr nz, .next
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	cp c
	jr z, .done
.next
	dec hl
	ld de, GRASS_WILDDATA_LENGTH
	add hl, de
	jr .loop

.done
	; Point hl to the list of morning Pokémon., skipping percentages
rept 4
	inc hl
endr
	; Generate a number, either 0, 1, or 2, to choose a time of day.
	; Can't pick 3 since evening does not have wild data.
.loop2
	call Random
	maskbits NUM_DAYTIMES
	cp EVE_F
	jr z, .loop2

	ld bc, 2 * NUM_GRASSMON
	call AddNTimes
.loop3
	; Choose one of the middle three Pokemon.
	call Random
	and NUM_GRASSMON
	cp 2
	jr c, .loop3
	cp 5
	jr nc, .loop3
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	inc hl ; skip level
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	ld [wNamedObjectIndexBuffer], a
	ld [wCurPartySpecies], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes

	; Now that we've chosen our wild Pokemon,
	; let's recover the map index info and get its name.
	pop bc
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	ld hl, OPT_OakText1
	call CopyRadioTextToRAM
	ld a, OAKS_POKEMON_TALK_5
	jp PrintRadioLine

.overflow
	pop bc
	ld a, OAKS_POKEMON_TALK
	jp PrintRadioLine

INCLUDE "data/radio/oaks_pkmn_talk_routes.asm"

OaksPKMNTalk5:
	ld hl, OPT_OakText2
	ld a, OAKS_POKEMON_TALK_6
	jp NextRadioLine

OaksPKMNTalk6:
	ld hl, OPT_OakText3
	ld a, OAKS_POKEMON_TALK_7
	jp NextRadioLine

OPT_IntroText1:
	; MARY: PROF.OAK'S
	text_jump _OPT_IntroText1
	db "@"

OPT_IntroText2:
	; #MON TALK!
	text_jump _OPT_IntroText2
	db "@"

OPT_IntroText3:
	; With me, MARY!
	text_jump _OPT_IntroText3
	db "@"

OPT_SwarmText1:
	; Breaking news!
	text_jump _OPT_SwarmText1
	db "@"

OPT_SwarmText2:
	; A group of
	text_jump _OPT_SwarmText2
	db "@"

OPT_SwarmText3:
	; @ 
	text_jump _OPT_SwarmText3
	db "@"

OPT_SwarmText4:
	; have be seen at
	text_jump _OPT_SwarmText4
	db "@"

OPT_SwarmText5:
	; @ .
	text_jump _OPT_SwarmText5
	db "@"

OPT_SwarmText6:
	; If any trainers
	text_jump _OPT_SwarmText6
	db "@"

OPT_SwarmText7:
	; want to catch a
	text_jump _OPT_SwarmText7
	db "@"

OPT_SwarmText8:
	; @ ,
	text_jump _OPT_SwarmText8
	db "@"

OPT_SwarmText9:
	; then head over to
	text_jump _OPT_SwarmText9
	db "@"

OPT_SwarmText10:
	; @ .
	text_jump _OPT_SwarmText5
	db "@"

OPT_SwarmText11:
	; Now, let's start
	text_jump _OPT_SwarmText10
	db "@"

OPT_SwarmText12:
	; the show!
	text_jump _OPT_SwarmText11
	db "@"

OPT_OakText1:
	; OAK: @ @
	text_jump _OPT_OakText1
	db "@"

OPT_OakText2:
	; may be seen around
	text_jump _OPT_OakText2
	db "@"

OPT_OakText3:
	; @ .
	text_jump _OPT_OakText3
	db "@"

OaksPKMNTalk7:
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, OPT_MaryText1
	ld a, OAKS_POKEMON_TALK_8
	jp NextRadioLine

OPT_MaryText1:
	; MARY: @ 's
	text_jump _OPT_MaryText1
	db "@"

OaksPKMNTalk8:
	; 0-15 are all valid indexes into .Adverbs,
	; so no need for a retry loop
	call Random
	maskbits NUM_OAKS_POKEMON_TALK_ADVERBS
	ld e, a
	ld d, 0
	ld hl, .Adverbs
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, OAKS_POKEMON_TALK_9
	jp NextRadioLine

.Adverbs:
; there are NUM_OAKS_POKEMON_TALK_ADVERBS entries
	dw .sweetadorably
	dw .wigglyslickly
	dw .aptlynamed
	dw .undeniablykindof
	dw .unbearably
	dw .wowimpressively
	dw .almostpoisonously
	dw .sensually
	dw .mischievously
	dw .topically
	dw .addictively
	dw .looksinwater
	dw .evolutionmustbe
	dw .provocatively
	dw .flippedout
	dw .heartmeltingly

.sweetadorably
	; sweet and adorably
	text_jump OPT_SweetAdorably
	db "@"

.wigglyslickly
	; wiggly and slickly
	text_jump OPT_WigglySlickly
	db "@"

.aptlynamed
	; aptly named and
	text_jump OPT_AptlyNamed
	db "@"

.undeniablykindof
	; undeniably kind of
	text_jump OPT_UndeniablyKindOf
	db "@"

.unbearably
	; so, so unbearably
	text_jump OPT_Unbearably
	db "@"

.wowimpressively
	; wow, impressively
	text_jump OPT_WowImpressively
	db "@"

.almostpoisonously
	; almost poisonously
	text_jump OPT_AlmostPoisonously
	db "@"

.sensually
	; ooh, so sensually
	text_jump OPT_Sensually
	db "@"

.mischievously
	; so mischievously
	text_jump OPT_Mischievously
	db "@"

.topically
	; so very topically
	text_jump OPT_Topically
	db "@"

.addictively
	; sure addictively
	text_jump OPT_Addictively
	db "@"

.looksinwater
	; looks in water is
	text_jump OPT_LooksInWater
	db "@"

.evolutionmustbe
	; evolution must be
	text_jump OPT_EvolutionMustBe
	db "@"

.provocatively
	; provocatively
	text_jump OPT_Provocatively
	db "@"

.flippedout
	; so flipped out and
	text_jump OPT_FlippedOut
	db "@"

.heartmeltingly
	; heart-meltingly
	text_jump OPT_HeartMeltingly
	db "@"

OaksPKMNTalk9:
	; 0-15 are all valid indexes into .Adjectives,
	; so no need for a retry loop
	call Random
	maskbits NUM_OAKS_POKEMON_TALK_ADJECTIVES
	ld e, a
	ld d, 0
	ld hl, .Adjectives
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wOaksPKMNTalkSegmentCounter]
	dec a
	ld [wOaksPKMNTalkSegmentCounter], a
	ld a, OAKS_POKEMON_TALK_4
	jr nz, .ok
	ld a, 5
	ld [wOaksPKMNTalkSegmentCounter], a
	ld a, OAKS_POKEMON_TALK_10
.ok
	jp NextRadioLine

.Adjectives:
; there are NUM_OAKS_POKEMON_TALK_ADJECTIVES entries
	dw .cute
	dw .weird
	dw .pleasant
	dw .boldsortof
	dw .frightening
	dw .suavedebonair
	dw .powerful
	dw .exciting
	dw .groovy
	dw .inspiring
	dw .friendly
	dw .hothothot
	dw .stimulating
	dw .guarded
	dw .lovely
	dw .speedy

.cute
	; cute.
	text_jump OPT_Cute
	db "@"

.weird
	; weird.
	text_jump OPT_Weird
	db "@"

.pleasant
	; pleasant.
	text_jump OPT_Pleasant
	db "@"

.boldsortof
	; bold, sort of.
	text_jump OPT_BoldSortOf
	db "@"

.frightening
	; frightening.
	text_jump OPT_Frightening
	db "@"

.suavedebonair
	; suave & debonair!
	text_jump OPT_SuaveDebonair
	db "@"

.powerful
	; powerful.
	text_jump OPT_Powerful
	db "@"

.exciting
	; exciting.
	text_jump OPT_Exciting
	db "@"

.groovy
	; groovy!
	text_jump OPT_Groovy
	db "@"

.inspiring
	; inspiring.
	text_jump OPT_Inspiring
	db "@"

.friendly
	; friendly.
	text_jump OPT_Friendly
	db "@"

.hothothot
	; hot, hot, hot!
	text_jump OPT_HotHotHot
	db "@"

.stimulating
	; stimulating.
	text_jump OPT_Stimulating
	db "@"

.guarded
	; guarded.
	text_jump OPT_Guarded
	db "@"

.lovely
	; lovely.
	text_jump OPT_Lovely
	db "@"

.speedy
	; speedy.
	text_jump OPT_Speedy
	db "@"

OaksPKMNTalk10:
	farcall RadioMusicRestartPokemonChannel
	ld hl, OPT_RestartText
	call PrintText
	call WaitBGMap
	ld hl, OPT_PokemonChannelText
	call PrintText
	ld a, OAKS_POKEMON_TALK_11
	ld [wCurrentRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	ret

OPT_PokemonChannelText:
	; #MON
	text_jump _OPT_PokemonChannelText
	db "@"

OPT_RestartText:
	db "@"

OaksPKMNTalk11:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 9, 14
	ld de, .pokemon_string
	ld a, OAKS_POKEMON_TALK_12
	jp PlaceRadioString

.pokemon_string
	db "#MON@"

OaksPKMNTalk12:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 1, 16
	ld de, .pokemon_channel_string
	ld a, OAKS_POKEMON_TALK_13
	jp PlaceRadioString

.pokemon_channel_string
	db "#MON Channel@"

OaksPKMNTalk13:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	hlcoord 12, 16
	ld de, .terminator
	ld a, OAKS_POKEMON_TALK_14
	jp PlaceRadioString

.terminator
	db "@"

OaksPKMNTalk14:
	ld hl, wRadioTextDelay
	dec [hl]
	ret nz
	ld de, MUSIC_POKEMON_TALK
	callfar RadioMusicRestartDE
	ld hl, .terminator
	call PrintText
	ld a, OAKS_POKEMON_TALK_4
	ld [wNextRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, RADIO_SCROLL
	ld [wCurrentRadioLine], a
	ld a, 10
	ld [wRadioTextDelay], a
	ret

.terminator
	db "@"

PlaceRadioString:
	ld [wCurrentRadioLine], a
	ld a, 100
	ld [wRadioTextDelay], a
	jp PlaceString

CopyBottomLineToTopLine:
	hlcoord 0, 15
	decoord 0, 13
	ld bc, SCREEN_WIDTH * 2
	jp CopyBytes

ClearBottomLine:
	hlcoord 1, 15
	ld bc, SCREEN_WIDTH - 2
	ld a, " "
	call ByteFill
	hlcoord 1, 16
	ld bc, SCREEN_WIDTH - 2
	ld a, " "
	jp ByteFill 

BenMonMusic1:
	call StartPokemonMusicChannel
	ld hl, BenIntroText1
	ld a, POKEMON_MUSIC_2
	jp NextRadioLine

BenMonMusic2:
	ld hl, BenIntroText2
	ld a, POKEMON_MUSIC_3
	jp NextRadioLine

BenMonMusic3:
	ld hl, BenIntroText3
	ld a, POKEMON_MUSIC_4
	jp NextRadioLine

FernMonMusic1:
	call StartPokemonMusicChannel
	ld hl, FernIntroText1
	ld a, LETS_ALL_SING_2
	jp NextRadioLine

FernMonMusic2:
	ld hl, FernIntroMusic2
	ld a, POKEMON_MUSIC_4
	jp NextRadioLine

BenFernMusic4:
	ld hl, BenFernText1
	ld a, POKEMON_MUSIC_5
	jp NextRadioLine

BenFernMusic5:
	call GetWeekday
	and 1
	ld hl, BenFernText2A
	jr z, .SunTueThurSun
	ld hl, BenFernText2B
.SunTueThurSun:
	ld a, POKEMON_MUSIC_6
	jp NextRadioLine

BenFernMusic6:
	call GetWeekday
	and 1
	ld hl, BenFernText3A
	jr z, .SunTueThurSun
	ld hl, BenFernText3B
.SunTueThurSun:
	ld a, POKEMON_MUSIC_7
	jp NextRadioLine

BenFernMusic7:
	ret

StartPokemonMusicChannel:
	call RadioTerminator
	call PrintText
	ld de, MUSIC_POKEMON_MARCH
	call GetWeekday
	and 1
	jr z, .SunTueThurSun
	ld de, MUSIC_POKEMON_LULLABY
.SunTueThurSun:
	callfar RadioMusicRestartDE
	ret

BenIntroText1:
	; BEN: #MON MUSIC
	text_jump _BenIntroText1
	db "@"

BenIntroText2:
	; CHANNEL!
	text_jump _BenIntroText2
	db "@"

BenIntroText3:
	; It's me, DJ BEN!
	text_jump _BenIntroText3
	db "@"

FernIntroText1:
	; FERN: #MUSIC!
	text_jump _FernIntroText1
	db "@"

FernIntroMusic2:
	; With DJ FERN!
	text_jump _FernIntroText2
	db "@"

BenFernText1:
	; Today's @ ,
	text_jump _BenFernText1
	db "@"

BenFernText2A:
	; so let us jam to
	text_jump _BenFernText2A
	db "@"

BenFernText2B:
	; so chill out to
	text_jump _BenFernText2B
	db "@"

BenFernText3A:
	; #MON March!
	text_jump _BenFernText3A
	db "@"

BenFernText3B:
	; #MON Lullaby!
	text_jump _BenFernText3B
	db "@"

LuckyNumberShow1:
	call StartRadioStation
	callfar CheckLuckyNumberShowFlag
	jr nz, .dontreset
	callfar ResetLuckyNumberShowFlag
.dontreset
	ld hl, LC_Text1
	ld a, LUCKY_NUMBER_SHOW_2
	jp NextRadioLine

LuckyNumberShow2:
	ld hl, LC_Text2
	ld a, LUCKY_NUMBER_SHOW_3
	jp NextRadioLine

LuckyNumberShow3:
	ld hl, LC_Text3
	ld a, LUCKY_NUMBER_SHOW_4
	jp NextRadioLine

LuckyNumberShow4:
	ld hl, LC_Text4
	ld a, LUCKY_NUMBER_SHOW_5
	jp NextRadioLine

LuckyNumberShow5:
	ld hl, LC_Text5
	ld a, LUCKY_NUMBER_SHOW_6
	jp NextRadioLine

LuckyNumberShow6:
	ld hl, LC_Text6
	ld a, LUCKY_NUMBER_SHOW_7
	jp NextRadioLine

LuckyNumberShow7:
	ld hl, LC_Text7
	ld a, LUCKY_NUMBER_SHOW_8
	jp NextRadioLine

LuckyNumberShow8:
	ld hl, wStringBuffer1
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, "@"
	ld [wStringBuffer1 + 5], a
	ld hl, LC_Text8
	ld a, LUCKY_NUMBER_SHOW_9
	jp NextRadioLine

LuckyNumberShow9:
	ld hl, LC_Text9
	ld a, LUCKY_NUMBER_SHOW_10
	jp NextRadioLine

LuckyNumberShow10:
	ld hl, LC_Text7
	ld a, LUCKY_NUMBER_SHOW_11
	jp NextRadioLine

LuckyNumberShow11:
	ld hl, LC_Text8
	ld a, LUCKY_NUMBER_SHOW_12
	jp NextRadioLine

LuckyNumberShow12:
	ld hl, LC_Text10
	ld a, LUCKY_NUMBER_SHOW_13
	jp NextRadioLine

LuckyNumberShow13:
	ld hl, LC_Text11
	call Random
	and a
	ld a, LUCKY_CHANNEL
	jr nz, .okay
	ld a, LUCKY_NUMBER_SHOW_14
.okay
	jp NextRadioLine

LuckyNumberShow14:
	ld hl, LC_DragText1
	ld a, LUCKY_NUMBER_SHOW_15
	jp NextRadioLine

LuckyNumberShow15:
	ld hl, LC_DragText2
	ld a, LUCKY_CHANNEL
	jp NextRadioLine

LC_Text1:
	; REED: Yeehaw! How
	text_jump _LC_Text1
	db "@"

LC_Text2:
	; y'all doin' now?
	text_jump _LC_Text2
	db "@"

LC_Text3:
	; Whether you're up
	text_jump _LC_Text3
	db "@"

LC_Text4:
	; or way down low,
	text_jump _LC_Text4
	db "@"

LC_Text5:
	; don't you miss the
	text_jump _LC_Text5
	db "@"

LC_Text6:
	; LUCKY NUMBER SHOW!
	text_jump _LC_Text6
	db "@"

LC_Text7:
	; This week's Lucky
	text_jump _LC_Text7
	db "@"

LC_Text8:
	; Number is @ !
	text_jump _LC_Text8
	db "@"

LC_Text9:
	; I'll repeat that!
	text_jump _LC_Text9
	db "@"

LC_Text10:
	; Match it and go to
	text_jump _LC_Text10
	db "@"

LC_Text11:
	; the RADIO TOWER!
	text_jump _LC_Text11
	db "@"

LC_DragText1:
	; …Repeating myself
	text_jump _LC_DragText1
	db "@"

LC_DragText2:
	; gets to be a drag…
	text_jump _LC_DragText2
	db "@"

PeoplePlaces1:
	call StartRadioStation
	ld hl, PnP_Text1
	ld a, PLACES_AND_PEOPLE_2
	jp NextRadioLine

PeoplePlaces2:
	ld hl, PnP_Text2
	ld a, PLACES_AND_PEOPLE_3
	jp NextRadioLine

PeoplePlaces3:
	ld hl, PnP_Text3
	call Random
	cp 49 percent - 1
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp NextRadioLine

PnP_Text1:
	; PLACES AND PEOPLE!
	text_jump _PnP_Text1
	db "@"

PnP_Text2:
	; Brought to you by
	text_jump _PnP_Text2
	db "@"

PnP_Text3:
	; me, DJ LILY!
	text_jump _PnP_Text3
	db "@"

PeoplePlaces4: ; People
	call Random
	maskbits NUM_TRAINER_CLASSES
	inc a
	cp NUM_TRAINER_CLASSES - 1
	jr nc, PeoplePlaces4
	push af
	ld hl, PnP_HiddenPeople
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	jr z, .ok
	ld hl, PnP_HiddenPeople_BeatE4
	ld a, [wKantoBadges]
	cp %11111111 ; all badges
	jr nz, .ok
	ld hl, PnP_HiddenPeople_BeatKanto
.ok
	pop af
	ld c, a
	ld de, 1
	push bc
	call IsInArray
	pop bc
	jr c, PeoplePlaces4
	push bc
	callfar GetTrainerClassName
	ld de, wStringBuffer1
	call CopyName1
	pop bc
	ld b, 1
	callfar GetTrainerName
	ld hl, PnP_Text4
	ld a, PLACES_AND_PEOPLE_5
	jp NextRadioLine

INCLUDE "data/radio/pnp_hidden_people.asm"

PnP_Text4:
	; @  @ @
	text_jump _PnP_Text4
	db "@"

PeoplePlaces5:
	; 0-15 are all valid indexes into .Adjectives,
	; so no need for a retry loop
	call Random
	maskbits NUM_PNP_PEOPLE_ADJECTIVES
	ld e, a
	ld d, 0
	ld hl, .Adjectives
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	cp 4 percent
	ld a, PLACES_AND_PEOPLE
	jr c, .ok
	call Random
	cp 49 percent - 1
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp NextRadioLine

.Adjectives:
; there are NUM_PNP_PEOPLE_ADJECTIVES entries
	dw PnP_cute
	dw PnP_lazy
	dw PnP_happy
	dw PnP_noisy
	dw PnP_precocious
	dw PnP_bold
	dw PnP_picky
	dw PnP_sortofok
	dw PnP_soso
	dw PnP_great
	dw PnP_mytype
	dw PnP_cool
	dw PnP_inspiring
	dw PnP_weird
	dw PnP_rightforme
	dw PnP_odd

PnP_cute:
	; is cute.
	text_jump _PnP_cute
	db "@"

PnP_lazy:
	; is sort of lazy.
	text_jump _PnP_lazy
	db "@"

PnP_happy:
	; is always happy.
	text_jump _PnP_happy
	db "@"

PnP_noisy:
	; is quite noisy.
	text_jump _PnP_noisy
	db "@"

PnP_precocious:
	; is precocious.
	text_jump _PnP_precocious
	db "@"

PnP_bold:
	; is somewhat bold.
	text_jump _PnP_bold
	db "@"

PnP_picky:
	; is too picky!
	text_jump _PnP_picky
	db "@"

PnP_sortofok:
	; is sort of OK.
	text_jump _PnP_sortofok
	db "@"

PnP_soso:
	; is just so-so.
	text_jump _PnP_soso
	db "@"

PnP_great:
	; is actually great.
	text_jump _PnP_great
	db "@"

PnP_mytype:
	; is just my type.
	text_jump _PnP_mytype
	db "@"

PnP_cool:
	; is so cool, no?
	text_jump _PnP_cool
	db "@"

PnP_inspiring:
	; is inspiring!
	text_jump _PnP_inspiring
	db "@"

PnP_weird:
	; is kind of weird.
	text_jump _PnP_weird
	db "@"

PnP_rightforme:
	; is right for me?
	text_jump _PnP_rightforme
	db "@"

PnP_odd:
	; is definitely odd!
	text_jump _PnP_odd
	db "@"

PeoplePlaces6: ; Places
	call Random
	cp (PnP_HiddenPlaces.End - PnP_HiddenPlaces) / 2
	jr nc, PeoplePlaces6
	ld hl, PnP_HiddenPlaces
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld b, [hl]
	inc hl
	ld c, [hl]
	call GetWorldMapLocation
	ld e, a
	farcall GetLandmarkName
	ld hl, PnP_Text5
	ld a, PLACES_AND_PEOPLE_7
	jp NextRadioLine

INCLUDE "data/radio/pnp_hidden_places.asm"

PnP_Text5:
	; @ @
	text_jump _PnP_Text5
	db "@"

PeoplePlaces7:
	; 0-15 are all valid indexes into .Adjectives,
	; so no need for a retry loop
	call Random
	maskbits NUM_PNP_PLACES_ADJECTIVES
	ld e, a
	ld d, 0
	ld hl, .Adjectives
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyRadioTextToRAM
	call Random
	cp 4 percent
	ld a, PLACES_AND_PEOPLE
	jr c, .ok
	call Random
	cp 49 percent - 1
	ld a, PLACES_AND_PEOPLE_4 ; People
	jr c, .ok
	ld a, PLACES_AND_PEOPLE_6 ; Places
.ok
	jp PrintRadioLine

.Adjectives:
; there are NUM_PNP_PLACES_ADJECTIVES entries
	dw PnP_cute
	dw PnP_lazy
	dw PnP_happy
	dw PnP_noisy
	dw PnP_precocious
	dw PnP_bold
	dw PnP_picky
	dw PnP_sortofok
	dw PnP_soso
	dw PnP_great
	dw PnP_mytype
	dw PnP_cool
	dw PnP_inspiring
	dw PnP_weird
	dw PnP_rightforme
	dw PnP_odd

RocketRadio1:
	call StartRadioStation
	ld hl, RocketRadioText1
	ld a, ROCKET_RADIO_2
	jp NextRadioLine

RocketRadio2:
	ld hl, RocketRadioText2
	ld a, ROCKET_RADIO_3
	jp NextRadioLine

RocketRadio3:
	ld hl, RocketRadioText3
	ld a, ROCKET_RADIO_4
	jp NextRadioLine

RocketRadio4:
	ld hl, RocketRadioText4
	ld a, ROCKET_RADIO_5
	jp NextRadioLine

RocketRadio5:
	ld hl, RocketRadioText5
	ld a, ROCKET_RADIO_6
	jp NextRadioLine

RocketRadio6:
	ld hl, RocketRadioText6
	ld a, ROCKET_RADIO_7
	jp NextRadioLine

RocketRadio7:
	ld hl, RocketRadioText7
	ld a, ROCKET_RADIO_8
	jp NextRadioLine

RocketRadio8:
	ld hl, RocketRadioText8
	ld a, ROCKET_RADIO_9
	jp NextRadioLine

RocketRadio9:
	ld hl, RocketRadioText9
	ld a, ROCKET_RADIO_10
	jp NextRadioLine

RocketRadio10:
	ld hl, RocketRadioText10
	ld a, ROCKET_RADIO
	jp NextRadioLine

RocketRadioText1:
	; … …Ahem, we are
	text_jump _RocketRadioText1
	db "@"

RocketRadioText2:
	; TEAM ROCKET!
	text_jump _RocketRadioText2
	db "@"

RocketRadioText3:
	; After three years
	text_jump _RocketRadioText3
	db "@"

RocketRadioText4:
	; of preparation, we
	text_jump _RocketRadioText4
	db "@"

RocketRadioText5:
	; have risen again
	text_jump _RocketRadioText5
	db "@"

RocketRadioText6:
	; from the ashes!
	text_jump _RocketRadioText6
	db "@"

RocketRadioText7:
	; GIOVANNI! @ Can you
	text_jump _RocketRadioText7
	db "@"

RocketRadioText8:
	; hear?@  We did it!
	text_jump _RocketRadioText8
	db "@"

RocketRadioText9:
	; @ Where is our boss?
	text_jump _RocketRadioText9
	db "@"

RocketRadioText10:
	; @ Is he listening?
	text_jump _RocketRadioText10
	db "@"

PokeFluteRadio:
	call StartRadioStation
	ld a, 1
	ld [wNumRadioLinesPrinted], a
	ret

UnownRadio:
	call StartRadioStation
	ld a, 1
	ld [wNumRadioLinesPrinted], a
	ret

EvolutionRadio:
	call StartRadioStation
	ld a, 1
	ld [wNumRadioLinesPrinted], a
	ret

BuenasPassword1:
; Determine if we need to be here
	call BuenasPasswordCheckTime
	jp nc, .PlayPassword
	ld a, [wNumRadioLinesPrinted]
	and a
	jp z, BuenasPassword20
	jp BuenasPassword8

.PlayPassword:
	call StartRadioStation
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld de, BuenasPasswordChannelName
	hlcoord 2, 9
	call PlaceString
	pop af
	ld [hBGMapMode], a
	ld hl, BuenaRadioText1
	ld a, BUENAS_PASSWORD_2
	jp NextRadioLine

BuenasPassword2:
	ld hl, BuenaRadioText2
	ld a, BUENAS_PASSWORD_3
	jp NextRadioLine

BuenasPassword3:
	call BuenasPasswordCheckTime
	ld hl, BuenaRadioText3
	jp c, BuenasPasswordAfterMidnight
	ld a, BUENAS_PASSWORD_4
	jp NextRadioLine

BuenasPassword4:
	call BuenasPasswordCheckTime
	jp c, BuenasPassword8
	ld a, [wBuenasPassword]
; If we already generated the password today, we don't need to generate a new one.
	ld hl, wWeeklyFlags
	bit WEEKLYFLAGS_BUENAS_PASSWORD_F, [hl]
	jr nz, .AlreadyGotIt
; There are only 11 groups to choose from.
.greater_than_11
	call Random
	maskbits NUM_PASSWORD_CATEGORIES
	cp NUM_PASSWORD_CATEGORIES
	jr nc, .greater_than_11
; Store it in the high nybble of e.
	swap a
	ld e, a
; For each group, choose one of the three passwords.
.greater_than_three
	call Random
	maskbits NUM_PASSWORDS_PER_CATEGORY
	cp NUM_PASSWORDS_PER_CATEGORY
	jr nc, .greater_than_three
; The high nybble of wBuenasPassword will now contain the password group index, and the low nybble contains the actual password.
	add e
	ld [wBuenasPassword], a
; Set the flag so that we don't generate a new password this week.
	ld hl, wWeeklyFlags
	set WEEKLYFLAGS_BUENAS_PASSWORD_F, [hl]
.AlreadyGotIt:
	ld c, a
	call GetBuenasPassword
	ld hl, BuenaRadioText4
	ld a, BUENAS_PASSWORD_5
	jp NextRadioLine

GetBuenasPassword:
; The password indices are held in c.  High nybble contains the group index, low nybble contains the word index.
; Load the password group pointer in hl.
	ld a, c
	swap a
	and $f
	ld hl, BuenasPasswordTable
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
; Get the password type and store it in b.
	ld a, [hli]
	ld b, a
	push hl
	inc hl
; Get the password index.
	ld a, c
	and $f
	ld c, a
	push hl
	ld hl, .StringFunctionJumpTable
	ld e, b
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de ; de now contains the pointer to the value of this week's password, in Blue Card Points.
	call _hl_
	pop hl
	ld c, [hl]
	ret

.StringFunctionJumpTable:
; entries correspond to BUENA_* constants
	dw .Mon       ; BUENA_MON
	dw .Item      ; BUENA_ITEM
	dw .Move      ; BUENA_MOVE
	dw .RawString ; BUENA_STRING

.Mon:
	call .GetTheIndex
	call GetPokemonName
	ret

.Item:
	call .GetTheIndex
	call GetItemName
	ret

.Move:
	call .GetTheIndex
	call GetMoveName
	ret

.GetTheIndex:
	ld h, 0
	ld l, c
	add hl, de
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	ret

.RawString:
; Get the string from the table...
	ld a, c
	and a
	jr z, .skip
.read_loop
	ld a, [de]
	inc de
	cp "@"
	jr nz, .read_loop
	dec c
	jr nz, .read_loop
; ... and copy it into wStringBuffer1.
.skip
	ld hl, wStringBuffer1
.copy_loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .copy_loop
	ld de, wStringBuffer1
	ret

INCLUDE "data/radio/buenas_passwords.asm"

BuenasPassword5:
	ld hl, BuenaRadioText5
	ld a, BUENAS_PASSWORD_6
	jp NextRadioLine

BuenasPassword6:
	ld hl, BuenaRadioText6
	ld a, BUENAS_PASSWORD_7
	jp NextRadioLine

BuenasPassword7:
	call BuenasPasswordCheckTime
	ld hl, BuenaRadioText7
	jr c, BuenasPasswordAfterMidnight
	ld a, BUENAS_PASSWORD
	jp NextRadioLine

BuenasPasswordAfterMidnight:
	push hl
	ld hl, wWeeklyFlags
	res WEEKLYFLAGS_BUENAS_PASSWORD_F, [hl]
	pop hl
	ld a, BUENAS_PASSWORD_8
	jp NextRadioLine

BuenasPassword8:
	ld hl, wWeeklyFlags
	res WEEKLYFLAGS_BUENAS_PASSWORD_F, [hl]
	ld hl, BuenaRadioMidnightText10
	ld a, BUENAS_PASSWORD_9
	jp NextRadioLine

BuenasPassword9:
	ld hl, BuenaRadioMidnightText1
	ld a, BUENAS_PASSWORD_10
	jp NextRadioLine

BuenasPassword10:
	ld hl, BuenaRadioMidnightText2
	ld a, BUENAS_PASSWORD_11
	jp NextRadioLine

BuenasPassword11:
	ld hl, BuenaRadioMidnightText3
	ld a, BUENAS_PASSWORD_12
	jp NextRadioLine

BuenasPassword12:
	ld hl, BuenaRadioMidnightText4
	ld a, BUENAS_PASSWORD_13
	jp NextRadioLine

BuenasPassword13:
	ld hl, BuenaRadioMidnightText5
	ld a, BUENAS_PASSWORD_14
	jp NextRadioLine

BuenasPassword14:
	ld hl, BuenaRadioMidnightText6
	ld a, BUENAS_PASSWORD_15
	jp NextRadioLine

BuenasPassword15:
	ld hl, BuenaRadioMidnightText7
	ld a, BUENAS_PASSWORD_16
	jp NextRadioLine

BuenasPassword16:
	ld hl, BuenaRadioMidnightText8
	ld a, BUENAS_PASSWORD_17
	jp NextRadioLine

BuenasPassword17:
	ld hl, BuenaRadioMidnightText9
	ld a, BUENAS_PASSWORD_18
	jp NextRadioLine

BuenasPassword18:
	ld hl, BuenaRadioMidnightText10
	ld a, BUENAS_PASSWORD_19
	jp NextRadioLine

BuenasPassword19:
	ld hl, BuenaRadioMidnightText10
	ld a, BUENAS_PASSWORD_20
	jp NextRadioLine

BuenasPassword20:
	ld a, [hBGMapMode]
	push af
	farcall NoRadioMusic
	farcall NoRadioName
	pop af
	ld [hBGMapMode], a
	ld hl, wWeeklyFlags
	res WEEKLYFLAGS_BUENAS_PASSWORD_F, [hl]
	ld a, BUENAS_PASSWORD
	ld [wCurrentRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld hl, BuenaOffTheAirText
	ld a, BUENAS_PASSWORD_21
	jp NextRadioLine

BuenasPassword21:
	ld a, BUENAS_PASSWORD
	ld [wCurrentRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	call BuenasPasswordCheckTime
	jp nc, BuenasPassword1
	ld hl, BuenaOffTheAirText
	ld a, BUENAS_PASSWORD_21
	jp NextRadioLine

BuenasPasswordCheckTime:
	call UpdateTime
	ld a, [hHours]
	cp NITE_HOUR
	ret

BuenasPasswordChannelName:
	db "BUENA'S PASSWORD@"

BuenaRadioText1:
	; BUENA: BUENA here!
	text_jump _BuenaRadioText1
	db "@"

BuenaRadioText2:
	; Today's password!
	text_jump _BuenaRadioText2
	db "@"

BuenaRadioText3:
	; Let me think… It's
	text_jump _BuenaRadioText3
	db "@"

BuenaRadioText4:
	; @ !
	text_jump _BuenaRadioText4
	db "@"

BuenaRadioText5:
	; Don't forget it!
	text_jump _BuenaRadioText5
	db "@"

BuenaRadioText6:
	; I'm in GOLDENROD's
	text_jump _BuenaRadioText6
	db "@"

BuenaRadioText7:
	; RADIO TOWER!
	text_jump _BuenaRadioText7
	db "@"

BuenaRadioMidnightText1:
	; BUENA: Oh my…
	text_jump _BuenaRadioMidnightText1
	db "@"

BuenaRadioMidnightText2:
	; It's midnight! I
	text_jump _BuenaRadioMidnightText2
	db "@"

BuenaRadioMidnightText3:
	; have to shut down!
	text_jump _BuenaRadioMidnightText3
	db "@"

BuenaRadioMidnightText4:
	; Thanks for tuning
	text_jump _BuenaRadioMidnightText4
	db "@"

BuenaRadioMidnightText5:
	; in to the end! But
	text_jump _BuenaRadioMidnightText5
	db "@"

BuenaRadioMidnightText6:
	; don't stay up too
	text_jump _BuenaRadioMidnightText6
	db "@"

BuenaRadioMidnightText7:
	; late! Presented to
	text_jump _BuenaRadioMidnightText7
	db "@"

BuenaRadioMidnightText8:
	; you by DJ BUENA!
	text_jump _BuenaRadioMidnightText8
	db "@"

BuenaRadioMidnightText9:
	; I'm outta here!
	text_jump _BuenaRadioMidnightText9
	db "@"

BuenaRadioMidnightText10:
	; …
	text_jump _BuenaRadioMidnightText10
	db "@"

BuenaOffTheAirText:
	;
	text_jump _BuenaOffTheAirText
	db "@"

CopyRadioTextToRAM:
	ld a, [hl]
	cp TX_FAR
	jp z, FarCopyRadioText
	ld de, wRadioText
	ld bc, SCREEN_WIDTH * 2
	jp CopyBytes

StartRadioStation:
	ld a, [wNumRadioLinesPrinted]
	and a
	ret nz
	call RadioTerminator
	call PrintText
	ld hl, RadioChannelSongs
	ld a, [wCurrentRadioLine]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	callfar RadioMusicRestartDE
	ret

INCLUDE "data/radio/channel_music.asm"

NextRadioLine:
	push af
	call CopyRadioTextToRAM
	pop af
	jp PrintRadioLine
