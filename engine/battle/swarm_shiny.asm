GenerateSwarmShiny:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
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