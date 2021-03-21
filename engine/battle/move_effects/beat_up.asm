BattleCommand_BeatUp:
; beatup

	call ResetDamage
	ld a, [hBattleTurn]
	and a
	jp nz, .enemy_beats_up

	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_IN_LOOP, a
	jr nz, .next_mon

	xor a
	ld [wPlayerRolloutCount], a
	ld [wd002], a
	ld [wBeatUpHits], a
	jr .got_mon

.next_mon
	ld a, [wPlayerRolloutCount]
	ld b, a
	ld a, [wPartyCount]
	sub b
	ld [wd002], a

.got_mon
	ld c, a
	ld a, [wCurBattleMon]
	cp c
	jr nz, .mon_not_in_battle
	ld a, [wBattleMonStatus]
	and a
	jr nz, .beatup_fail
	jr .finish_beatup


.enemy_beats_up
	ld a, [wEnemySubStatus3]
	bit SUBSTATUS_IN_LOOP, a
	jr nz, .enemy_next_mon

	xor a
	ld [wEnemyRolloutCount], a
	ld [wd002], a
	ld [wBeatUpHits], a
	jr .enemy_got_mon

.enemy_next_mon
	ld a, [wEnemyRolloutCount]
	ld b, a
	ld a, [wOTPartyCount]
	sub b
	ld [wd002], a

.enemy_got_mon
	ld a, [wBattleMode]
	dec a
	jr z, .wild

	ld a, [wd002]
	ld b, a
	ld a, [wCurOTMon]
	cp b
	jr nz, .mon_not_in_battle
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .beatup_fail
	jr .finish_beatup


.wild
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .beatup_fail
	ld a, [wEnemyMonSpecies]
	jr .finish_beatup_wild


.mon_not_in_battle
	ld a, MON_HP
	call GetBeatupMonLocation
	ld a, [hli]
	or [hl]
	jr z, .beatup_fail
	ld bc, MON_STATUS - (MON_HP + 1)
	add hl, bc

	ld a, [hl]
	and a
	jr nz, .beatup_fail


.finish_beatup
	; Get the 'mon's base attack
	ld a, MON_SPECIES
	call GetBeatupMonLocation
	ld a, [hl]
.finish_beatup_wild
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseAttack]
	; Calculate the new base power
	ld c, 10
	call SimpleDivide
	ld a, 5
	add b

	; Call the usual DamageStats, but replace the move power
	push af
	call BattleCommand_DamageStats
	pop af
	ld d, a

	ld hl, wBeatUpHits
	inc [hl]
	ret


.beatup_fail
	ld b, buildopponentrage_command
	jp SkipToBattleCommand


BattleCommand_BeatUpFailText:
; beatupfailtext

	ld a, [wBeatUpHits]
	and a
	ret nz

	inc a
	ld [wAttackMissed], a
	jp PrintButItFailed


GetBeatupMonLocation:
	push bc
	ld c, a
	ld b, 0
	ld a, [hBattleTurn]
	and a
	ld hl, wPartyMon1Species
	jr z, .got_species
	ld hl, wOTPartyMon1Species

.got_species
	ld a, [wd002]
	add hl, bc
	call GetPartyLocation
	pop bc
	ret
