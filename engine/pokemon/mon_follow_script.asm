_SetPartyFollowerAction::
; preload old mon's nickname for "refused"/"fainted" txt
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname

	ld hl, wPartySpecies
	assert HIGH(wPartySpecies) == HIGH(wPartySpecies+PARTY_LENGTH)
	ld a, [wCurPartyMon]
	add l
	ld l, a
	ld a, [hl]
	dec a

; refuse if pokemon has no follower sprite
	ld hl, FollowerSprites
	ld bc, 3
	call AddNTimes
	ld a, BANK(FollowerSprites)
	call GetFarByte
	and a
	jr z, .refused

; fainted mons can't follow
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [hli]
	or [hl]
	jr z, .fainted

; "Recalled X"
	ld a, [wPartyFollower]
	and a
	jr z, .no_previous
	dec a
	call RecallPartyFollowerText
; ensure old follower is deleted, otherwise the respawned
; follower may appear somewhere else due to the old follower
; blocking the spot
	newfarcall DeleteFollower

.no_previous
	ld a, [wCurPartyMon]
	inc a ; 1-index
	ld [wPartyFollower], a
	newfarcall SpawnFollower     ; reinit follower
	newfarcall ReappearFollower  ; actually place it

; load new mon's nickname ("X follows you")
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname

	ld de, SFX_BALL_POOF
	call PlaySFX

; cry
	ld hl, wPartySpecies
	ld a, [wCurPartyMon]
	add l
	ld l, a
	ld a, [hl]
	call PlayMonCry2

	ld hl, .TagAlongText
	jp PrintText

.TagAlongText:
	text_far _TagAlongText
	text_end

.refused
	ld hl, .RefusedText
	jp PrintText

.fainted
	ld hl, .CantFollowText
	jp PrintText

.RefusedText:
	text_far _FollowerRefusedText
	text_end

.CantFollowText:
	text_far _FollowerCantFollowText
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
	call WaitSFX
	ld hl, wPartyMonNicknames
	call GetNickname
	ld de, SFX_BALL_POOF
	call PlaySFX
	ld hl, .RecalledText
	jp PrintText

.RecalledText:
	text_far _RecalledText
	text_end
