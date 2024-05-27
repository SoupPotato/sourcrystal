CheckForUsedObjPals::
	push hl
	push bc
	push de
	ldh a, [rSVBK]
	push af
	ld a, BANK(wObjectStructs)
	ldh [rSVBK], a

	xor a
	ld [wUsedObjectPals], a

	ld de, wObjectStructs
	ld b, NUM_OBJECT_STRUCTS

.loop
	ld hl, OBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .no_sprite_skip
	ld hl, OBJECT_PAL_INDEX
	add hl, de
	ld a, [hl]
	ld [wNeededPalIndex], a
	call MarkUsedPal
	ld hl, OBJECT_PALETTE
	add hl, de
	ld [hl], a
.no_sprite_skip
	dec b
	jr z, .done
	ld hl, OBJECT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	jr .loop

.done
;	ld a, TRUE
;	ldh [hCGBPalUpdate], a
	pop af
	ld [rSVBK], a
	pop de
	pop bc
	pop hl
	ret

MarkUsedPal:
	push hl
	push bc
	push de

	; Check if pal is already loaded
	ld b, 8
	ld c, 0
	ld hl, wLoadedObjPal0
.loop
	cp [hl]
	jr z, .mark_in_use
	inc hl
	inc c
	dec b
	jr nz, .loop

	ld b, a
	push bc

	; Pal is not already loaded, find a empty pal slot.
	ld b, 0
	ld c, 8
	ld hl, wUsedObjectPals
	ld a, 1
	ld d, a
.search_again
	ld a, d
	and [hl]
	jr z, .found_empty
	ld a, d
	rla
	ld d, a
	inc b
	dec c
	jr nz, .search_again
.found_empty
	ld a, b
	pop bc

	ld c, a
	ld a, b
	ld b, 0
	ld hl, wLoadedObjPal0
	add hl, bc
	ld [hl], a

	push bc
	ld a, c
	ld bc, 1 palettes
	ld hl, wOBPals1
	call AddNTimes
	ld d, h
	ld e, l
	farcall CopySpritePal
	pop bc

.mark_in_use
	push bc
	ld hl, wUsedObjectPals
	inc c
	ld a, 1
.loop3
	dec c
	jr z, .load_hl
	rla
	jr .loop3
.load_hl
	or [hl]
	ld [hl], a
	pop bc
	ld a, c

.done
	pop de
	pop bc
	pop hl
	ret

ClearSavedObjPals::
	ld hl, wUsedObjectPals
	ld bc, wNeededPalIndex - wUsedObjectPals
	ld a, -1
	jp ByteFill