GenerateSwarmShiny:
	ld a, [wSwarmMapGroup]
	ld b, a
	ld a, [wSwarmMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp ROUTE_35
	jp z, .yanma
	cp DARK_CAVE
	jp z, .dunsparce
	cp ROUTE_32
	jp z, .qwilfish
	cp MT_MORTAR
	jp z, .marill
	cp ROUTE_38
	jp z, .magnemite
	cp OLIVINE_CITY
	jp z, .chinchou
	cp ROUTE_44
	jp z, .remoraid
	cp ROUTE_46
	jp z, .phanpy
	cp ROUTE_30
	jp z, .caterpie
	cp ROUTE_31
	jp z, .spinarak
	cp ILEX_FOREST
	jp z, .paras
	cp ROUTE_29
	jp z, .hoppip
	cp ROUTE_34
	jp z, .ditto
	cp NATIONAL_PARK
	jp z, .sunkern
	cp ROUTE_36
	jp z, .vulpix
	cp ROUTE_39
	jp z, .miltank
	cp UNION_CAVE
	jp z, .sandshrew
	cp ROUTE_33
	jp z, .ekans
	cp RUINS_OF_ALPH
	jp z, .smeargle
	cp ROUTE_41
	jp z, .horsea
	cp ROUTE_42
	jp z, .mankey
	cp ROUTE_47
	jp z, .ponyta
	cp ROUTE_48
	jp z, .diglett
	cp DRAGONS_DEN
	jp z, .dratini
	cp ICE_PATH
	jp z, .swinub
	cp ROUTE_45
	jp z, .gligar
	cp VICTORY_ROAD
	jp z, .golbat
	cp ROUTE_26
	jp z, .doduo
	cp ROUTE_1
	jp z, .furret
	cp VIRIDIAN_FOREST
	jp z, .pikachu
	cp POKEMON_MANSION
	jp z, .magmar
	cp MT_MOON
	jp z, .geodude
	cp ROUTE_5
	jp z, .jigglypuff
	cp ROUTE_6
	jp z, .poliwag
	cp ROUTE_11
	jp z, .meowth
	cp ROUTE_9
	jp z, .fearow
	cp ROCK_TUNNEL
	jp z, .cubone
	cp ROUTE_7
	jp z, .murkrow
	cp ROUTE_8
	jp z, .haunter
	cp ROUTE_16
	jp z, .slugma
	cp ROUTE_10
	jp z, .voltorb
	cp ROUTE_14
	jp z, .nidorino
	cp ROUTE_13
	jp z, .farfetch_d
	cp ROUTE_19
	jp z, .staryu
	cp SEAFOAM_ISLANDS
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