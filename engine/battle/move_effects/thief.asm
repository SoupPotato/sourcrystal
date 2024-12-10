BattleCommand_Thief:
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

; The player needs to be able to steal an item.

	call .playeritem
	ld a, [hl]
	and a
	ret nz

; The enemy needs to have an item to steal.

	call .enemyitem
	ld a, [hl]
	and a
	ret z

; Can't steal mail.

	ld [wNamedObjectIndex], a
	ld d, a
	farcall ItemIsMail
	ret c

	ld a, [wEffectFailed]
	and a
	ret nz

	ld a, [wLinkMode]
	and a
	jr z, .stealenemyitem

.stealenemyitem
	call .enemyitem
	xor a
	ld [hl], a
	ld [de], a

	call .playeritem
	ld a, [wNamedObjectIndex]
	ld [hl], a
	ld [de], a

	; If you steal from a wildmon, you do so permanently.
	ld a, [wBattleMode]
	dec a
	ld b, [hl]
	call z, SetBackupItem
	jr .stole

.enemy

; The enemy can't already have an item.

	call .enemyitem
	ld a, [hl]
	and a
	ret nz

; The player must have an item to steal.

	call .playeritem
	ld a, [hl]
	and a
	ret z

; Can't steal mail!

	ld [wNamedObjectIndex], a
	ld d, a
	farcall ItemIsMail
	ret c

; Wildmons can't steal items
	ld a, [wBattleMode]
	dec a
	jr z, .cant

	ld a, [wEffectFailed]
	and a
	ret nz

	; If a foe steals an item, it is returned after battle.
	call .playeritem
	xor a
	ld [hl], a
	ld [de], a

	call .enemyitem
	ld a, [wNamedObjectIndex]
	ld [hl], a
	ld [de], a

.stole
	call GetItemName
	ld hl, StoleText
	jp StdBattleTextbox

.playeritem
	ld a, MON_ITEM
	call BattlePartyAttr
	ld d, h
	ld e, l
	ld hl, wBattleMonItem
	ret

.enemyitem
	ld a, MON_ITEM
	call OTPartyAttr
	ld d, h
	ld e, l
	ld hl, wEnemyMonItem
	ret

.cant
	or 1
	ret

SetBackupItem::
; If backup is empty, replace with b if our turn (even in trainer battles)
	ldh a, [hBattleTurn]
	and a
	ret nz

	call GetBackupItemAddr
	ld a, [hl]
	and a
	ret nz
	ld [hl], b
	ret
