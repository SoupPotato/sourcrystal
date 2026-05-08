; version 01 -> 02: convert wPhoneList into bitflags.
;
; Previously, wPhoneList was just a literal list of contact IDs
; (phone_contacts.asm) with a maximum capacity of CONTACT_LIST_SIZE.
; We wanted to increase this CONTACT_LIST_SIZE, but it ended up shifting
; everything, which also invalidated the save file completely, thus prompting
; the creation of this save file migration system.
;
; This next idea is to just make the wPhoneList a bit flag array. That way your
; phone can make like the Pokedex: you can collect 'em all. This loses the
; property of the player adding contacts sequentially, but I wonder if that
; is *really* important compared to the increased capacity.

MigrateSaveFile:
	ld hl, sPlayerData + (wPhoneList - wPlayerData)
; WRAM at this point isn't loaded yet, so it should be safe to use as a
; scratch space. Let's move the original contact list there.
	ld de, wPhoneList
	ld c, 0
.continue_memmove
	ld a, [hl]
	ld [hl], 0
	inc hl
	ld [de], a
	inc de
	inc c
	ld a, c
	cp 10 + 1 ; CONTACT_LIST_SIZE + 1
	jr nz, .continue_memmove

; Now let's iterate over the thing we moved to generate the new bitflag array.
	ld hl, wPhoneList
	ld d, 0
	ld b, SET_FLAG
.continue_convert
	ld a, [hl]
; Skip entry if it's invalid PHONE_00.
	and a
	jr z, .skip_this
; Bit flag array has the first contact that's not PHONE_00 start at 0, so adjust.
	dec a
	ld e, a
; c contains the upper limit, we now count down instead.
	push bc
	push hl
		ld hl, sPlayerData + (wPhoneList - wPlayerData)
		call FlagAction
	pop hl
	pop bc
.skip_this
	inc hl
	dec c
	jr nz, .continue_convert

; Finish migration
	jp ApplySaveVersion

MigrateBackupSaveFile:
; eh same code as above. should I like make a macro or something for these?
	ld hl, sBackupPlayerData + (wPhoneList - wPlayerData)
	ld de, wPhoneList
	ld c, 0
.continue_memmove
	ld a, [hl]
	ld [hl], 0
	inc hl
	ld [de], a
	inc de
	inc c
	ld a, c
	cp 10 + 1 ; CONTACT_LIST_SIZE + 1
	jr nz, .continue_memmove
	ld hl, wPhoneList
	ld d, 0
	ld b, SET_FLAG
.continue_convert
	ld a, [hl]
	and a
	jr z, .skip_this
	dec a
	ld e, a
	push bc
	push hl
		ld hl, sBackupPlayerData + (wPhoneList - wPlayerData)
		call FlagAction
	pop hl
	pop bc
.skip_this
	inc hl
	dec c
	jr nz, .continue_convert
	jp ApplyBackupSaveVersion
