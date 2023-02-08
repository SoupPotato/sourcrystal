GenerateSwarmShiny:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp ROUTE_35
	jr z, .yanma
	cp DARK_CAVE
	jr z, .dunsparce
	cp ROUTE_32
	jr z, .qwilfish
	cp MT_MORTAR
	jr z, .marill
	cp ROUTE_38
	jr z, .magnemite
	cp OLIVINE_CITY
	jr z, .chinchou
	cp ROUTE_44
	jr z, .remoraid
	jr .skipshine

.yanma
	ld a, [wCurPartySpecies]
	cp YANMA
	jr nz, .skipshine
	jr .rollshiny
.dunsparce
	ld a, [wCurPartySpecies]
	cp DUNSPARCE
	jr nz, .skipshine
	jr .rollshiny
.qwilfish
	ld a, [wCurPartySpecies]
	cp QWILFISH
	jr nz, .skipshine
	jr .rollshiny
.marill
	ld a, [wCurPartySpecies]
	cp MARILL
	jr nz, .skipshine
	jr .rollshiny
.magnemite
	ld a, [wCurPartySpecies]
	cp MAGNEMITE
	jr nz, .skipshine
	jr .rollshiny
.chinchou
	ld a, [wCurPartySpecies]
	cp CHINCHOU
	jr nz, .skipshine
	jr .rollshiny
.remoraid
	ld a, [wCurPartySpecies]
	cp REMORAID
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
