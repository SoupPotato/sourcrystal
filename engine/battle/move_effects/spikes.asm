BattleCommand_Spikes:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens
	ld hl, wPlayerScreens
.got_screens

; Fails if spikes are already down!

	ld a, [hl]
	and 3
	cp 3
	jr nc, .failed

; Nothing else stops it from working.

	push bc
	inc a
	ld b, a
	ld a, [hl]
	and $fc
	or b
	ld [hl], a
	pop bc

	call AnimateCurrentMove

	ld hl, SpikesText
	jp StdBattleTextbox

.failed
	jp FailMove
