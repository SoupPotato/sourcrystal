CheckForLuckyNumberWinners:
; Returns number of digits matching
	xor a
	ld [wScriptVar], a

	; Prepare lucky number buffer
	ld hl, wStringBuffer1
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum

	ld b, NUM_BOXES
	push bc ; will be where box+position number is stored
.outer_loop
	inc b
	dec b
	ld c, PARTY_LENGTH
	jr z, .loop
	ld c, MONS_PER_BOX
.loop
	farcall GetStorageBoxMon
	jr z, .next

	ld hl, wBufferMonAltSpecies
	ld a, [hl]
	cp EGG
	jr z, .next
	ld de, wBufferMonID
	push bc
	ld hl, wLuckyNumberDigitsBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld hl, wStringBuffer1 + 4
	ld de, wLuckyNumberDigitsBuffer + 4
	ld b, 0
.compare_loop
	ld a, [de]
	cp [hl]
	jr nz, .compare_end
	inc b
	dec de
	dec hl
	ld a, b
	cp 5
	jr nz, .compare_loop
.compare_end
	ld a, [wScriptVar]
	and $f
	cp b
	ld a, b
	pop bc
	jr nc, .next

	; if matching digits were found...
	ld [wScriptVar], a
	ld hl, sp+0 ; store box + position on the stack for mon with matching digits
	ld [hl], c
	inc hl
	ld [hl], b
	cp 5
	jr z, .done
.next
	dec c
	jr nz, .loop
	dec b
	bit 7, b ; check for reaching -1
	jr z, .outer_loop
.done
	pop bc ; restores box + position, if applicable
	call WaitSFX
	ld a, [wScriptVar]
	and a
	ret z ; found nothing

	; Prepare found storage mon ID
	push bc
	farcall GetStorageBoxMon
	pop bc

	; Get box name (if applicable)
	inc b
	dec b
	ld hl, .MatchInParty
	jr z, .got_text
	farcall GetBoxName ; loads box name into wStringBuffer1
	ld hl, .MatchInStorage
.got_text
	jp PrintText

.MatchInParty:
	; Congratulations! We have a match with the ID number of @  in your party.
	text_far _LuckyNumberMatchPartyText
	text_end

.MatchInStorage:
	; Congratulations! We have a match with the ID number of @  in your PC BOX.
	text_far _LuckyNumberMatchPCText
	text_end

PrintTodaysLuckyNumber:
	ld hl, wStringBuffer3
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, "@"
	ld [wStringBuffer3 + 5], a
	ret
