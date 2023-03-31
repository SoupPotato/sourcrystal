BattleCommand_Spite:
; spite

	ld a, [wAttackMissed]
	and a
	jp nz, .failed
	ld bc, PARTYMON_STRUCT_LENGTH ; ????
	ld hl, wEnemyMonMoves
	ld a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld hl, wBattleMonMoves
.got_moves
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed
	cp STRUGGLE
	jr z, .failed
	ld b, a
	ld c, -1
.loop
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop
	ld [wTypeMatchup], a
	dec hl
	ld b, 0
	push bc
	ld c, wBattleMonPP - wBattleMonMoves
	add hl, bc
	pop bc
	ld a, [hl]
	and PP_MASK
	jr z, .failed
	push bc
	call GetMoveName
	; lose 4 PP
	ld a, 4
	ld b, a
	ld a, [hl]
	and PP_MASK
	cp b
	jr nc, .deplete_pp
	ld b, a
.deplete_pp
	ld a, [hl]
	sub b
	ld [hl], a
	push af
	ld a, MON_PP
	call OpponentPartyAttr
	ld d, b
	pop af
	pop bc
	add hl, bc
	ld e, a
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .transformed
	ld a, [hBattleTurn]
	and a
	jr nz, .not_wildmon
	ld a, [wBattleMode]
	dec a
	jr nz, .not_wildmon
	ld hl, wWildMonPP
	add hl, bc
.not_wildmon
	ld [hl], e
.transformed
	push de
	call AnimateCurrentMove
	pop de
	ld a, d
	ld [wTypeMatchup], a
	ld hl, SpiteEffectText
	jp StdBattleTextBox

.failed
	jp PrintDidntAffect2

