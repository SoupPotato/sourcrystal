; IN
;   b  = queried index with "A" starting at 00
; OUT
;   a  = (replaced)
;   c  = (replaced)
;   hl = (replaced)
;   f  = CARRY, if unown is found
	and a ; reset carry
	ld c, NUM_UNOWN
	ld hl, wUnownDex
.loop
	ld a, [hli]
	and a
	ret z
	dec a ; UnownDex has "A" starting at 01
	cp b
	jr z, .found
	dec c
	jr nz, .loop
; not found
	and a
	ret
.found
	scf
	ret