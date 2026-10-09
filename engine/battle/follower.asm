SlidePlayerPicIn::
	ld a, 7
	ldh [hMapObjectIndex], a
	hlcoord 0, 6
	ld a, $4f ; last column of the back pic
	ld c, 6
	ld de, SCREEN_WIDTH
.loop1
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .loop1
	call WaitBGMap
	hlcoord 6, 6
	ldh a, [hMapObjectIndex]
	ld c, a
.loop
	push bc
	push hl
	ld b, 6
.loop2
	push hl
	call .DoFrame
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop2
	ld c, 2
	call DelayFrames
	pop hl
	pop bc
	dec c
	jr nz, .loop
	hlcoord 0, 6
	ld a, " "
	ld c, 6
	ld de, SCREEN_WIDTH
.loop3
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop3
	jp WaitBGMap

.DoFrame:
	ldh a, [hMapObjectIndex]
	ld c, a
.forward
	ld a, [hli]
	ld [hld], a
	cp " "
	jr z, .skip
	sub 6
	cp $31 ; first back pic tile
	jr nc, .do
	ld a, " "
.do
	ld [hl], a
.skip
	dec hl
	dec c
	jr nz, .forward
	ret

SlidePlayerPicOut::
	hlcoord 1, 6
	ld a, 8
	ldh [hMapObjectIndex], a
	ld c, a
.loop
	push bc
	push hl
	ld b, 7
.loop2
	push hl
	call .DoFrame
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop2
	ld c, 2
	call DelayFrames
	pop hl
	pop bc
	dec c
	jr nz, .loop
	ret

.DoFrame:
	ldh a, [hMapObjectIndex]
	ld c, a
.forward
	ld a, [hld]
	ld [hli], a
	inc hl
	dec c
	jr nz, .forward
	ret

UnloadFaintedFollower::
	ld a, [wPartyFollower]
	and a
	ret z

; has current follower fainted?
	dec a
	ld hl, wPartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hli]
	or [hl]
	ret nz

	ld [wPartyFollower], a
	newfarjp UnloadFollowerIfNeeded
