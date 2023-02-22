GenerateAltSwarmShiny:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp ROUTE_35
	jp z, .psyduck
	cp DARK_CAVE
	jp z, .teddiursa
	cp ROUTE_32
	jp z, .bellsprout
	cp MT_MORTAR
	jp z, .machop
	cp ROUTE_38
	jp z, .tauros
	cp OLIVINE_CITY
	jp z, .corsola
	cp ROUTE_44
	jp z, .lickitung
	cp SLOWPOKE_WELL
	jp z, .slowpoke
	cp ROUTE_30
	jp z, .weedle
	cp ROUTE_31
	jp z, .ledyba
	cp ILEX_FOREST
	jp z, .oddish
	cp ROUTE_29
	jp z, .pineco
	cp ROUTE_34
	jp z, .drowzee
	cp NATIONAL_PARK
	jp z, .venonat
	cp ROUTE_36
	jp z, .growlithe
	cp ROUTE_37
	jp z, .stantler
	cp UNION_CAVE
	jp z, .wooper
	cp ROUTE_33
	jp z, .aipom
	cp BURNED_TOWER
	jp z, .koffing
	cp ROUTE_41
	jp z, .mantine
	cp ROUTE_42
	jp z, .mareep
	cp ROUTE_43
	jp z, .girafarig
	cp ROUTE_48
	jp z, .houndour
	cp CLIFF_CAVE
	jp z, .onix
	cp ICE_PATH
	jp z, .sneasel
	cp ROUTE_45
	jp z, .skarmory
	cp VICTORY_ROAD
	jp z, .rhyhorn
	cp ROUTE_21
	jp z, .mr_mime
	cp ROUTE_1
	jp z, .raticate
	cp VIRIDIAN_FOREST
	jp z, .bulbasaur
	cp ROUTE_22
	jp z, .charmander
	cp MT_MOON
	jp z, .clefairy
	cp ROUTE_5
	jp z, .noctowl
	cp ROUTE_6
	jp z, .abra
	cp ROUTE_11
	jp z, .pidgeotto
	cp ROUTE_25
	jp z, .squirtle
	cp ROCK_TUNNEL
	jp z, .kangaskhan
	cp ROUTE_10
	jp z, .electabuzz
	cp ROUTE_8
	jp z, .tyrogue
	cp ROUTE_17
	jp z, .grimer
	cp ROUTE_15
	jp z, .exeggcute
	cp ROUTE_14
	jp z, .nidorina
	cp ROUTE_13
	jp z, .chansey
	cp ROUTE_20
	jp z, .shellder
	cp SEAFOAM_ISLANDS
	jp z, .jynx
	jp .skipshine

.psyduck
	ld a, [wCurPartySpecies]
	cp PSYDUCK
	jp .next
.teddiursa
	ld a, [wCurPartySpecies]
	cp TEDDIURSA
	jp .next
.bellsprout
	ld a, [wCurPartySpecies]
	cp BELLSPROUT
	jp .next
.machop
	ld a, [wCurPartySpecies]
	cp MACHOP
	jp .next
.tauros
	ld a, [wCurPartySpecies]
	cp TAUROS
	jp .next
.corsola
	ld a, [wCurPartySpecies]
	cp CORSOLA
	jp .next
.lickitung
	ld a, [wCurPartySpecies]
	cp LICKITUNG
	jp .next
.slowpoke
	ld a, [wCurPartySpecies]
	cp SLOWPOKE
	jp .next
.weedle
	ld a, [wCurPartySpecies]
	cp WEEDLE
	jp .next
.ledyba
	ld a, [wCurPartySpecies]
	cp LEDYBA
	jp .next
.oddish
	ld a, [wCurPartySpecies]
	cp ODDISH
	jp .next
.stantler
	ld a, [wCurPartySpecies]
	cp STANTLER
	jp .next
.drowzee
	ld a, [wCurPartySpecies]
	cp DROWZEE
	jp .next
.venonat
	ld a, [wCurPartySpecies]
	cp VENONAT
	jp .next
.growlithe
	ld a, [wCurPartySpecies]
	cp GROWLITHE
	jp .next
.pineco
	ld a, [wCurPartySpecies]
	cp PINECO
	jp .next
.wooper
	ld a, [wCurPartySpecies]
	cp WOOPER
	jp .next
.aipom
	ld a, [wCurPartySpecies]
	cp AIPOM
	jp .next
.koffing
	ld a, [wCurPartySpecies]
	cp KOFFING
	jp .next
.mantine
	ld a, [wCurPartySpecies]
	cp MANTINE
	jp .next
.mareep
	ld a, [wCurPartySpecies]
	cp MAREEP
	jp .next
.girafarig
	ld a, [wCurPartySpecies]
	cp GIRAFARIG
	jp .next
.houndour
	ld a, [wCurPartySpecies]
	cp HOUNDOUR
	jp .next
.onix
	ld a, [wCurPartySpecies]
	cp ONIX
	jp .next
.sneasel
	ld a, [wCurPartySpecies]
	cp SNEASEL
	jp .next
.skarmory
	ld a, [wCurPartySpecies]
	cp SKARMORY
	jp .next
.rhyhorn
	ld a, [wCurPartySpecies]
	cp RHYHORN
	jp .next
.mr_mime
	ld a, [wCurPartySpecies]
	cp MR__MIME
	jp .next
.raticate
	ld a, [wCurPartySpecies]
	cp RATICATE
	jp .next
.bulbasaur
	ld a, [wCurPartySpecies]
	cp BULBASAUR
	jp .next
.charmander
	ld a, [wCurPartySpecies]
	cp CHARMANDER
	jp .next
.clefairy
	ld a, [wCurPartySpecies]
	cp CLEFAIRY
	jp .next
.noctowl
	ld a, [wCurPartySpecies]
	cp NOCTOWL
	jp .next
.abra
	ld a, [wCurPartySpecies]
	cp ABRA
	jp .next
.pidgeotto
	ld a, [wCurPartySpecies]
	cp PIDGEOTTO
	jp .next
.squirtle
	ld a, [wCurPartySpecies]
	cp SQUIRTLE
	jp .next
.kangaskhan
	ld a, [wCurPartySpecies]
	cp KANGASKHAN
	jp .next
.electabuzz
	ld a, [wCurPartySpecies]
	cp ELECTABUZZ
	jp .next
.tyrogue
	ld a, [wCurPartySpecies]
	cp TYROGUE
	jp .next
.grimer
	ld a, [wCurPartySpecies]
	cp GRIMER
	jp .next
.exeggcute
	ld a, [wCurPartySpecies]
	cp EXEGGCUTE
	jp .next
.nidorina
	ld a, [wCurPartySpecies]
	cp NIDORINA
	jp .next
.chansey
	ld a, [wCurPartySpecies]
	cp CHANSEY
	jp .next
.shellder
	ld a, [wCurPartySpecies]
	cp SHELLDER
	jp .next
.jynx
	ld a, [wCurPartySpecies]
	cp JYNX
.next
	jr nz, .skipshine
	;fallthrough
.rollshiny
	call Random
	cp 7 ; adjust to desired percentage
	jr nc, .trynext
	ld b, ATKDEFDV_SHINY
	ld c, SPDSPCDV_SHINY
	jr .UpdateDVs
.trynext:
	call Random
	cp 7 ; adjust to desired percentage
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