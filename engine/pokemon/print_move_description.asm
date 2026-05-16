; Does not print to screen by default.
; Auto-sets `de` to sMoveDescriptionScratch.
; Keeps SRAM open so the routine after it can immediately print or do whatever.
; Caller must CloseSRAM themselves.
PrintMoveDescriptionToScratch:
	push hl
	xor a ; BANK(sMoveDescriptionScratch)
	call OpenSRAM
	ld hl, MoveDescriptions
	ld a, [wCurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, sMoveDescriptionScratch
.keep_copying
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .keep_copying
	ld de, sMoveDescriptionScratch
	pop hl
	ret

INCLUDE "data/moves/descriptions.asm"
