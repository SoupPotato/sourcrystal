; More overworld event handling.


WarpToSpawnPoint::
	ld hl, wStatusFlags2
	res STATUSFLAGS2_SAFARI_GAME_F, [hl]
	res STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	ret

RunMemScript::
; If there is no script here, we don't need to be here.
	ld a, [wMapReentryScriptQueueFlag]
	and a
	ret z
; Execute the script at (wMapReentryScriptBank):(wMapReentryScriptAddress).
	ld hl, wMapReentryScriptAddress
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapReentryScriptBank]
	call CallScript
	scf
; Clear the buffer for the next script.
	push af
	xor a
	ld hl, wMapReentryScriptQueueFlag
	ld bc, 8
	call ByteFill
	pop af
	ret

LoadScriptBDE::
; If there's already a script here, don't overwrite.
	ld hl, wMapReentryScriptQueueFlag
	ld a, [hl]
	and a
	ret nz
; Set the flag
	ld [hl], 1
	inc hl
; Load the script pointer b:de into (wMapReentryScriptBank):(wMapReentryScriptAddress)
	ld [hl], b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	scf
	ret

TryTileCollisionEvent::
	call GetFacingTileCoord
	ld [wEngineBuffer1], a
	ld c, a
	farcall CheckFacingTileForStdScript
	jr c, .done

	call CheckCutTreeTile
	jr nz, .whirlpool
	farcall TryCutOW
	jr .done

.whirlpool
	ld a, [wEngineBuffer1]
	call CheckWhirlpoolTile
	jr nz, .waterfall
	farcall TryWhirlpoolOW
	jr .done

.waterfall
	ld a, [wEngineBuffer1]
	call CheckWaterfallTile
	jr nz, .headbutt
	farcall TryWaterfallOW
	jr .done

.headbutt
	ld a, [wEngineBuffer1]
	call CheckHeadbuttTreeTile
	jr nz, .surf
	farcall TryHeadbuttOW
	jr c, .done
	jr .noevent

.surf
	farcall TrySurfOW
	jr nc, .noevent
	jr .done

.noevent
	xor a
	ret

.done
	call PlayClickSFX
	ld a, $ff
	scf
	ret


RandomEncounter::
; Random encounter

	call CheckWildEncounterCooldown
	jr c, .nope
	call CanUseSweetScent
	jr nc, .nope
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BUG_CONTEST_TIMER_F, [hl]
	jr nz, .bug_contest
	bit STATUSFLAGS2_SAFARI_GAME_F, [hl]
	jr nz, .safari_zone
	farcall TryWildEncounter
	jr nz, .nope
	jr .ok

.bug_contest
	call _TryWildEncounter_BugContest
	jr nc, .nope
	jr .ok_bug_contest

.safari_zone
	call _TryWildEncounter_SafariZone
	jr nc, .nope
	jr .ok_safari_zone

.nope
	ld a, 1
	and a
	ret

.ok
	ld a, BANK(WildBattleScript)
	ld hl, WildBattleScript
	jr .done

.ok_bug_contest
	ld a, BANK(BugCatchingContestBattleScript)
	ld hl, BugCatchingContestBattleScript
	jr .done

.ok_safari_zone
	ld a, BANK(SafariZoneBattleScript)
	ld hl, SafariZoneBattleScript
	jr .done

.done
	call CallScript
	scf
	ret

WildBattleScript:
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

CanUseSweetScent::
	ld hl, wStatusFlags
	bit STATUSFLAGS_NO_WILD_ENCOUNTERS_F, [hl]
	jr nz, .no
	ld a, [wEnvironment]
	cp CAVE
	jr z, .ice_check
	cp DUNGEON
	jr z, .ice_check
	farcall CheckGrassCollision
	jr nc, .no

.ice_check
	ld a, [wPlayerStandingTile]
	call CheckIceTile
	jr z, .no
	scf
	ret

.no
	and a
	ret

_TryWildEncounter_BugContest:
	call TryWildEncounter_BugContest
	ret nc
	call ChooseWildEncounter_BugContest
	farcall CheckRepelEffect
	ret

_TryWildEncounter_SafariZone:
	call ChooseWildEncounter_SafariZone
	farcall CheckRepelEffect
	ret

ChooseWildEncounter_BugContest::
; Pick a random mon out of ContestMons.

.loop
	call Random
	cp 100 << 1
	jr nc, .loop
	srl a
	
	ld hl, ContestMons
	ld de, 4
.CheckMon:
	sub [hl]
	jr c, .GotMon
	add hl, de
	jr .CheckMon

.GotMon:
	inc hl

; Species
	ld a, [hli]
	ld [wTempWildMonSpecies], a

; Min level
	ld a, [hli]
	ld d, a

; Max level
	ld a, [hl]

	sub d
	jr nz, .RandomLevel

; If min and max are the same.
	ld a, d
	jr .GotLevel

.RandomLevel:
; Get a random level between the min and max.
	ld c, a
	inc c
	call Random
	ld a, [hRandomAdd]
	call SimpleDivide
	add d

.GotLevel:
	ld [wCurPartyLevel], a

	xor a
	ret

ChooseWildEncounter_SafariZone::

.loop
	call Random
	cp 100 << 1
	jr nc, .loop
	srl a
	
	ld a, [wMapNumber]
	cp MAP_SAFARI_ZONE_AREA_1
	jp nz, .not_safari_zone_area_1
	ld hl, SafariMonsArea1
	jr .finish
.not_safari_zone_area_1
	cp MAP_SAFARI_ZONE_AREA_2
	jp nz, .not_safari_zone_area_2
	ld hl, SafariMonsArea2
	jr .finish
.not_safari_zone_area_2
	cp MAP_SAFARI_ZONE_AREA_3
	jp nz, .not_safari_zone_area_3
	ld hl, SafariMonsArea3
	jr .finish
.not_safari_zone_area_3
	cp MAP_SAFARI_ZONE_AREA_4
	jp nz, .not_safari_zone_area_4
	ld hl, SafariMonsArea4
	jr .finish
.not_safari_zone_area_4
	ld hl, ContestMons
.finish
	ld de, 4
.CheckMon:
	sub [hl]
	jr c, .GotMon
	add hl, de
	jr .CheckMon

.GotMon:
	inc hl

; Species
	ld a, [hli]
	ld [wTempWildMonSpecies], a

; Min level
	ld a, [hli]
	ld d, a

; Max level
	ld a, [hl]

	sub d
	jr nz, .RandomLevel

; If min and max are the same.
	ld a, d
	jr .GotLevel

.RandomLevel:
; Get a random level between the min and max.
	ld c, a
	inc c
	call Random
	ld a, [hRandomAdd]
	call SimpleDivide
	add d

.GotLevel:
	ld [wCurPartyLevel], a

	xor a
	ret

INCLUDE "data/wild/safari_zone_mons.asm"

TryWildEncounter_BugContest:
	ld a, [wPlayerStandingTile]
	call CheckSuperTallGrassTile
	ld b, 40 percent
	jr z, .ok
	ld b, 20 percent

.ok
	farcall ApplyMusicEffectOnEncounterRate
	farcall ApplyCleanseTagEffectOnEncounterRate
	call Random
	ld a, [hRandomAdd]
	cp b
	ret c
	ld a, 1
	and a
	ret


INCLUDE "data/wild/bug_contest_mons.asm"


DoBikeStep::
	nop
	nop
	; If the bike shop owner doesn't have our number, or
	; if we've already gotten the call, we don't have to
	; be here.
	ld hl, wStatusFlags2
	bit STATUSFLAGS2_BIKE_SHOP_CALL_F, [hl]
	jr z, .NoCall

	; If we're not on the bike, we don't have to be here.
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr nz, .NoCall

	; If we're not in an area of phone service, we don't
	; have to be here.
	call GetMapPhoneService
	and a
	jr nz, .NoCall

	; Check the bike step count and check whether we've
	; taken 65536 of them yet.
	ld hl, wBikeStep
	ld a, [hli]
	ld d, a
	ld e, [hl]
	cp 255
	jr nz, .increment
	ld a, e
	cp 255
	jr z, .dont_increment

.increment
	inc de
	ld [hl], e
	dec hl
	ld [hl], d

.dont_increment
	; If we've taken at least 1024 steps, have the bike
	;  shop owner try to call us.
	ld a, d
	cp HIGH(1024)
	jr c, .NoCall

	; If a call has already been queued, don't overwrite
	; that call.
	ld a, [wSpecialPhoneCallID]
	and a
	jr nz, .NoCall

	; Queue the call.
	ld a, SPECIALCALL_BIKESHOP
	ld [wSpecialPhoneCallID], a
	xor a
	ld [wSpecialPhoneCallID + 1], a
	ld hl, wStatusFlags2
	res STATUSFLAGS2_BIKE_SHOP_CALL_F, [hl]
	scf
	ret

.NoCall:
	xor a
	ret

HandleStoneTable:
	ld hl, wStoneTableAddress
	ld a, [hli]
	ld b, [hl]
	ld c, a
	or b
	ret z
	ld de, wPlayerStruct
	ld a, NUM_OBJECT_STRUCTS
.loop
	push af

	ld hl, OBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .next

	ld hl, OBJECT_MOVEMENTTYPE
	add hl, de
	ld a, [hl]
	cp SPRITEMOVEDATA_STRENGTH_BOULDER
	jr nz, .next

	ld hl, OBJECT_NEXT_TILE
	add hl, de
	ld a, [hl]
	call CheckPitTile
	jr nz, .next

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, de
	ld a, [hl]
	cp STANDING
	jr nz, .next
	call HandleStoneQueue
	jr c, .fall_down_hole

.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l

	pop af
	dec a
	jr nz, .loop
	ret

.fall_down_hole
	pop af
	ret
