BattleCommand_TripleKick:
	ld c, 10  ; Base Power of 10
	ld a, [wBattleAnimParam]
	inc a ; Multiply base by KickCounter + 1
	call SimpleMultiply
	
	push af
	farcall BattleCommand_DamageStats ; damagestats
	pop af
	ld d, a
	ret

BattleCommand_KickCounter:
	ld hl, wBattleAnimParam
	inc [hl]
	ret
