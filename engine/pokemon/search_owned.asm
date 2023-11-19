BeastsCheck:
; Check if the player has caught all three legendary beasts.
; Return the result in wScriptVar.

	ld a, [wPlayerCaught]
	or ~CAUGHT_BEASTS_MASK
	inc a
	jr nz, SpecialMonCheckFailed
	ld a, 1
	ld [wScriptVar], a
	ret

SpecialMonCheckFailed:
	xor a
	ld [wScriptVar], a
	ret

CheckBattleCaughtResult:
	ld a, [wBattleResult]
	and 1 << BATTLERESULT_CAUGHT_POKEMON_F
	rlca
	rlca
	ld [wScriptVar], a
	ret
