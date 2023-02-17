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
.next
	jr nz, .skipshine
	;fallthrough
.rollshiny
	call Random
	cp 255 ; adjust to desired percentage
	jr nc, .trynext
	ld b, ATKDEFDV_SHINY
	ld c, SPDSPCDV_SHINY
	jr .UpdateDVs
.trynext:
	call Random
	cp 255 ; adjust to desired percentage
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