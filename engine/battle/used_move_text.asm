DisplayUsedMoveText:
; battle command 03
	ld hl, UsedMoveText
	call BattleTextBox
	jp WaitBGMap

UsedMoveText:
; this is a stream of text and asm from 105db9 to 105ef6
	text_jump _ActorNameText
	start_asm
	ld a, [hBattleTurn]
	and a
	jr nz, .start

	ld a, [wPlayerMoveStruct + MOVE_ANIM]
	call UpdateUsedMoves

.start
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld d, h
	ld e, l

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [wTempSpecies], a

	push hl
	farcall CheckUserIsCharging
	pop hl
	jr nz, .ok

	; update last move
	ld a, [wTempSpecies]
	ld [hl], a
	ld [de], a

.ok
	ld hl, UsedMoveInsteadText
	ret

UsedMoveInsteadText:
	text_jump _UsedMoveText
	start_asm
; check obedience
	ld a, [wAlreadyDisobeyed]
	and a
	jr z, .GetMoveNameText
; print "instead,"
	ld hl, .UsedInsteadText
	ret

.UsedInsteadText:
	text_jump _UsedInsteadText
	start_asm
.GetMoveNameText:
	ld hl, MoveNameText
	ret

MoveNameText:
	text_jump _MoveNameText
	db "@"


UpdateUsedMoves:
; append move a to wPlayerUsedMoves unless it has already been used

	push bc
; start of list
	ld hl, wPlayerUsedMoves
; get move id
	ld b, a
; next count
	ld c, NUM_MOVES

.loop
; get move from the list
	ld a, [hli]
; not used yet?
	and a
	jr z, .add
; already used?
	cp b
	jr z, .quit
; next byte
	dec c
	jr nz, .loop

; if the list is full and the move hasn't already been used
; shift the list back one byte, deleting the first move used
; this can occur with struggle or a new learned move
	ld hl, wPlayerUsedMoves + 1
; 1 = 2
	ld a, [hld]
	ld [hli], a
; 2 = 3
	inc hl
	ld a, [hld]
	ld [hli], a
; 3 = 4
	inc hl
	ld a, [hld]
	ld [hl], a
; 4 = new move
	ld a, b
	ld [wPlayerUsedMoves + 3], a
	jr .quit

.add
; go back to the byte we just inced from
	dec hl
; add the new move
	ld [hl], b

.quit
; list updated
	pop bc
	ret
