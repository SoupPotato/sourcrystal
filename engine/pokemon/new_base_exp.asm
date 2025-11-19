GetNewBaseExp:
; basic stage mons: BST*0.2
; stage 1 or non-evolver: BST*0.35
; stage 2 or legendaries: BST*0.5
; exceptions: Chansey, Blissey
; NOTE: Reads from wEnemyMonBaseStats
	xor a
	ldh [hMultiplicand], a
	ld a, [wBattleMode]
	dec a
	ld a, [wEnemyMonSpecies]
	jr z, .got_species
	ld hl, wOTPartyMon1Species
	ld a, [wCurOTMon]
	call GetPartyLocation
.got_species
	ld [wCurSpecies], a
	ld de, 3
	ld hl, NewBaseExpExceptions
	call IsInArray
	jr nc, .calc_base_exp
	inc hl
	ld a, [hli]
	ldh [hMultiplicand + 2], a
	ld a, [hl]
	ldh [hMultiplicand + 1], a
	ret

.calc_base_exp
	ld hl, 0
	ld de, wBaseStats
	ld b, NUM_STATS
.bst_loop
	ld a, [de]
	ld c, a
	inc de
	push bc
	ld b, 0
	add hl, bc
	pop bc
	dec b
	jr nz, .bst_loop

	ld a, h
	ldh [hMultiplicand + 1], a
	ld a, l
	ldh [hMultiplicand + 2], a

	ld a, [wCurSpecies]
	ld [wCurPartySpecies], a

	farcall GetPreEvolution
	jr c, .not_basic

	; let's see if we have an evolution
	ld hl, EvosAttacksPointers
	ld a, [wCurPartySpecies]
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarWord

	ld a, BANK(EvosAttacks)
	call GetFarByte
	and a
	ld a, 4 ; basic mon (not evolved, but can evolve): *4/20 -> *0.2
	jr nz, .got_multiplier
	jr .stage_1_or_nonevolver

.not_basic
	ld de, 1
	ld hl, LegendaryMons
	call IsInArray
	jr c, .legendary
	farcall GetPreEvolution
.legendary
	ld a, 10 ; stage 2 or legendary: *10/20 -> *0.5
	jr c, .got_multiplier
.stage_1_or_nonevolver
	ld a, 7 ; stage 1 or non-evolver: *7/20 -> *0.35
.got_multiplier
	ldh [hMultiplier], a
	call Multiply
	ld a, 20
	ldh [hDivisor], a
	ld b, 4
	jp Divide

INCLUDE "data/pokemon/legendary_mons.asm"
INCLUDE "data/pokemon/base_exp_exceptions.asm"

_WithdrawMonText:
	text_far _BattleMonNickCommaText
	text_asm
; Depending on the HP lost since the enemy mon was sent out, the game prints a different text
	push de
	push bc
	; compute enemy health lost as a percentage
	ld hl, wEnemyMonHP + 1
	ld de, wEnemyHPAtTimeOfPlayerSwitch + 1
	ld b, [hl]
	dec hl
	ld a, [de]
	sub b
	ldh [hMultiplicand + 2], a
	dec de
	ld b, [hl]
	ld a, [de]
	sbc b
	ldh [hMultiplicand + 1], a
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld b, [hl]
	ld c, 100
	and a
	jr z, .shift_done
.shift
	rra
	rr b
	srl c
	and a
	jr nz, .shift
.shift_done
	ld a, c
	ldh [hMultiplier], a
	call Multiply
	ld a, b
	ld b, 4
	ldh [hDivisor], a
	call Divide
	pop bc
	pop de
	ldh a, [hQuotient + 3]
	ld hl, ThatsEnoughComeBackText
	and a
	ret z

	ld hl, ComeBackText
	cp 30
	ret c

	ld hl, OKComeBackText
	cp 70
	ret c

	ld hl, GoodComeBackText
	ret

ThatsEnoughComeBackText:
	text_far _ThatsEnoughComeBackText
	text_end

OKComeBackText:
	text_far _OKComeBackText
	text_end

GoodComeBackText:
	text_far _GoodComeBackText
	text_end

ComeBackText:
	text_far _ComeBackText
	text_end
