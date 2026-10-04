_SetPartyFollowerAction::
	ld a, [wPartyFollower]
	and a
	jr z, .no_previous
; "Recalled X"
	dec a
	call RecallPartyFollowerText
.no_previous
	ld a, [wCurPartyMon]
	inc a ; 1-index
	ld [wPartyFollower], a
	newfarcall SpawnFollower     ; reinit follower
	newfarcall ReappearFollower  ; actually place it

; "X follows you"
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname

	ld de, SFX_BALL_POOF
	call PlaySFX

; cry
	ld a, [wCurPartyMon]
	ld hl, wPartySpecies
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	call PlayMonCry2

	ld hl, .TagAlongText
	jp PrintText

.TagAlongText:
	text_far _TagAlongText
	text_end

_ClearPartyFollowerAction::
	ld a, [wPartyFollower]
	dec a
	call RecallPartyFollowerText
	xor a
	ld [wPartyFollower], a
	newfarcall UnloadFollowerIfNeeded
	ret

RecallPartyFollowerText:
; a = 0-indexed party mon
	ld hl, wPartyMonNicknames
	call GetNickname
  call WaitSFX
	ld de, SFX_BALL_POOF
	call PlaySFX
	ld hl, .RecalledText
	jp PrintText

.RecalledText:
	text_far _RecalledText
	text_end
