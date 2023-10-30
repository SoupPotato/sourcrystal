GenerateSwarmShiny:
	ld a, [wSwarmMapGroup]
	ld b, a
	ld a, [wSwarmMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp LANDMARK_ROUTE_35
	jp z, .yanma
	cp LANDMARK_DARK_CAVE
	jp z, .dunsparce
	cp LANDMARK_ROUTE_32
	jp z, .qwilfish
	cp LANDMARK_MT_MORTAR
	jp z, .marill
	cp LANDMARK_ROUTE_38
	jp z, .magnemite
	cp LANDMARK_OLIVINE_CITY
	jp z, .chinchou
	cp LANDMARK_ROUTE_44
	jp z, .remoraid
	cp LANDMARK_ROUTE_46
	jp z, .phanpy
	cp LANDMARK_ROUTE_30
	jp z, .caterpie
	cp LANDMARK_ROUTE_31
	jp z, .spinarak
	cp LANDMARK_ILEX_FOREST
	jp z, .paras
	cp LANDMARK_ROUTE_29
	jp z, .hoppip
	cp LANDMARK_ROUTE_34
	jp z, .ditto
	cp LANDMARK_NATIONAL_PARK
	jp z, .sunkern
	cp LANDMARK_ROUTE_36
	jp z, .vulpix
	cp LANDMARK_ROUTE_39
	jp z, .miltank
	cp LANDMARK_UNION_CAVE
	jp z, .sandshrew
	cp LANDMARK_ROUTE_33
	jp z, .ekans
	cp LANDMARK_RUINS_OF_ALPH
	jp z, .smeargle
	cp LANDMARK_ROUTE_41
	jp z, .horsea
	cp LANDMARK_ROUTE_42
	jp z, .mankey
	cp LANDMARK_ROUTE_47
	jp z, .ponyta
	cp LANDMARK_ROUTE_48
	jp z, .diglett
	cp LANDMARK_DRAGONS_DEN
	jp z, .dratini
	cp LANDMARK_ICE_PATH
	jp z, .swinub
	cp LANDMARK_ROUTE_45
	jp z, .gligar
	cp LANDMARK_VICTORY_ROAD
	jp z, .golbat
	cp LANDMARK_ROUTE_26
	jp z, .doduo
	cp LANDMARK_ROUTE_1
	jp z, .furret
	cp LANDMARK_VIRIDIAN_FOREST
	jp z, .pikachu
	cp LANDMARK_POKEMON_MANSION
	jp z, .magmar
	cp LANDMARK_MT_MOON
	jp z, .geodude
	cp LANDMARK_ROUTE_5
	jp z, .jigglypuff
	cp LANDMARK_ROUTE_6
	jp z, .poliwag
	cp LANDMARK_ROUTE_11
	jp z, .meowth
	cp LANDMARK_ROUTE_9
	jp z, .fearow
	cp LANDMARK_ROCK_TUNNEL
	jp z, .cubone
	cp LANDMARK_ROUTE_7
	jp z, .murkrow
	cp LANDMARK_ROUTE_8
	jp z, .haunter
	cp LANDMARK_ROUTE_16
	jp z, .slugma
	cp LANDMARK_ROUTE_10
	jp z, .voltorb
	cp LANDMARK_ROUTE_14
	jp z, .nidorino
	cp LANDMARK_ROUTE_13
	jp z, .farfetch_d
	cp LANDMARK_ROUTE_19
	jp z, .staryu
	cp LANDMARK_SEAFOAM_ISLANDS
	jp z, .seel
	jp .skipshine

.yanma
	ld a, [wCurPartySpecies]
	cp YANMA
	jp .next
.dunsparce
	ld a, [wCurPartySpecies]
	cp DUNSPARCE
	jp .next
.qwilfish
	ld a, [wCurPartySpecies]
	cp QWILFISH
	jp .next
.marill
	ld a, [wCurPartySpecies]
	cp MARILL
	jp .next
.magnemite
	ld a, [wCurPartySpecies]
	cp MAGNEMITE
	jp .next
.chinchou
	ld a, [wCurPartySpecies]
	cp CHINCHOU
	jp .next
.remoraid
	ld a, [wCurPartySpecies]
	cp REMORAID
	jp .next
.phanpy
	ld a, [wCurPartySpecies]
	cp PHANPY
	jp .next
.caterpie
	ld a, [wCurPartySpecies]
	cp CATERPIE
	jp .next
.spinarak
	ld a, [wCurPartySpecies]
	cp SPINARAK
	jp .next
.paras
	ld a, [wCurPartySpecies]
	cp PARAS
	jp .next
.hoppip
	ld a, [wCurPartySpecies]
	cp HOPPIP
	jp .next
.ditto
	ld a, [wCurPartySpecies]
	cp DITTO
	jp .next
.sunkern
	ld a, [wCurPartySpecies]
	cp SUNKERN
	jp .next
.vulpix
	ld a, [wCurPartySpecies]
	cp VULPIX
	jp .next
.miltank
	ld a, [wCurPartySpecies]
	cp MILTANK
	jp .next
.sandshrew
	ld a, [wCurPartySpecies]
	cp SANDSHREW
	jp .next
.ekans
	ld a, [wCurPartySpecies]
	cp EKANS
	jp .next
.smeargle
	ld a, [wCurPartySpecies]
	cp SMEARGLE
	jp .next
.horsea
	ld a, [wCurPartySpecies]
	cp HORSEA
	jp .next
.mankey
	ld a, [wCurPartySpecies]
	cp MANKEY
	jp .next
.ponyta
	ld a, [wCurPartySpecies]
	cp PONYTA
	jp .next
.diglett
	ld a, [wCurPartySpecies]
	cp DIGLETT
	jp .next
.dratini
	ld a, [wCurPartySpecies]
	cp DRATINI
	jp .next
.swinub
	ld a, [wCurPartySpecies]
	cp SWINUB
	jp .next
.gligar
	ld a, [wCurPartySpecies]
	cp GLIGAR
	jp .next
.golbat
	ld a, [wCurPartySpecies]
	cp GOLBAT
	jp .next
.doduo
	ld a, [wCurPartySpecies]
	cp DODUO
	jp .next
.furret
	ld a, [wCurPartySpecies]
	cp FURRET
	jp .next
.pikachu
	ld a, [wCurPartySpecies]
	cp PIKACHU
	jp .next
.magmar
	ld a, [wCurPartySpecies]
	cp MAGMAR
	jp .next
.geodude
	ld a, [wCurPartySpecies]
	cp GEODUDE
	jp .next
.jigglypuff
	ld a, [wCurPartySpecies]
	cp JIGGLYPUFF
	jp .next
.poliwag
	ld a, [wCurPartySpecies]
	cp POLIWAG
	jp .next
.meowth
	ld a, [wCurPartySpecies]
	cp MEOWTH
	jp .next
.fearow
	ld a, [wCurPartySpecies]
	cp FEAROW
	jp .next
.cubone
	ld a, [wCurPartySpecies]
	cp CUBONE
	jp .next
.murkrow
	ld a, [wCurPartySpecies]
	cp MURKROW
	jp .next
.haunter
	ld a, [wCurPartySpecies]
	cp HAUNTER
	jp .next
.slugma
	ld a, [wCurPartySpecies]
	cp SLUGMA
	jp .next
.voltorb
	ld a, [wCurPartySpecies]
	cp VOLTORB
	jp .next
.nidorino
	ld a, [wCurPartySpecies]
	cp NIDORINO
	jp .next
.farfetch_d
	ld a, [wCurPartySpecies]
	cp FARFETCH_D
	jp .next
.staryu
	ld a, [wCurPartySpecies]
	cp STARYU
	jp .next
.seel
	ld a, [wCurPartySpecies]
	cp SEEL
.next
	jr nz, .skipshine
	;fallthrough
.rollshiny
	call Random
	cp 2 ; adjust to desired percentage
	jr nc, .trynext
	ld b, ATKDEFDV_SHINY
	ld c, SPDSPCDV_SHINY
	jr .UpdateDVs
.trynext:
	call Random
	cp 2 ; adjust to desired percentage
	jr nc, .skipshine
	ld b, ATKDEFDV_SHINYF
	ld c, SPDSPCDV_SHINY
	jr .UpdateDVs

.skipshine:
; Generate new random DVs
	call BattleRandom
	ld b, a
	call BattleRandom
	ld c, a

.UpdateDVs:
; Input DVs in register bc
	ld hl, wEnemyMonDVs
	ld a, b
	ld [hli], a
	ld [hl], c
	ret