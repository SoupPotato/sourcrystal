; This file contains save file migration actions.
; The migration should only be limited at most 1 version,
; so as to avoid getting bogged down with too much code.
; (e.g. version 1 -> 2, not version 1 -> 3.)

; Loading a newer save file should either error out or be unstable,
; since we don't know what that newer version contains.

; 00 = v6.1
; 01 = v6.2
;      * Add the save file version.
; 02 = vX.Y
;      * wPhoneList is now a bit flag array.

DEF GAME_VERSION EQU 2

; Anything between these lines should be the ones updated when making a breaking
; change to the save format.
; ------------------------------------------------------------------------------
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
	cp CONTACT_LIST_SIZE + 1
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
	cp CONTACT_LIST_SIZE + 1
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

;-------------------------------------------------------------------------------

ApplySaveVersion:
	ld a, BANK(sGameVersion)
	call OpenSRAM
	ld hl, sGameVersion
	ld [hl], GAME_VERSION
	and a ; clear carry
	ret

ApplyBackupSaveVersion:
	ld a, BANK(sBackupGameVersion)
	call OpenSRAM
	ld hl, sBackupGameVersion
	ld [hl], GAME_VERSION
	call CloseSRAM
	and a ; clear carry
	ret

	const_def
	const MIGRATION_NO_CHANGE_NEEDED
	const MIGRATION_SHOULD_MIGRATE
	const MIGRATION_CANNOT_MIGRATE
	const MIGRATION_UNKNOWN
; a = current game version
;
; returns:
;    a = MIGRATION_*
;    f = may be affected
SaveCanBeMigrated::
; Saves that have not been tagged yet MAY have another value already written on it, due
; to not being explicitly written.

; If the save file has a random value written on it, AND the player is sure they are
; updating from a version prior to the save tagging, the player may force a migration
; to happen, like so:
	push af
		ldh a, [hJoypadDown] ; press RIGHT while selecting "CONTINUE"
		and D_RIGHT
		cp D_RIGHT
		jr z, .force_migration
	pop af

; On some emulators, this value will be $ff. Assuming that's the majority of cases,
; we can simply detect that here:
	assert GAME_VERSION < $ff
	cp -1
	jr z, .yes

; Otherwise, the check can proceed as normal.
	sub a, GAME_VERSION
	jr z, .no
	jr nc, .unknown
	cp -1
	jr z, .yes
	; gap of more than 1 version
	ld a, MIGRATION_CANNOT_MIGRATE
	ret
.yes
	ld a, MIGRATION_SHOULD_MIGRATE
	ret
.no
	ld a, MIGRATION_NO_CHANGE_NEEDED
	ret
.unknown ; save file version is greater, don't know what to do
	ld a, MIGRATION_UNKNOWN
	ret
.force_migration
	pop af
	jr .yes

InitiateBackupMigration:
	ld a, BANK(sBackupGameVersion)
	call OpenSRAM
	ld a, [sBackupGameVersion]
	call SaveCanBeMigrated
	cp MIGRATION_NO_CHANGE_NEEDED
	jr z, .done
	cp MIGRATION_CANNOT_MIGRATE
	jr z, MigrationCannotMigrate
	cp MIGRATION_SHOULD_MIGRATE
	jr z, MigrateBackupSaveFile
	jr MigrationUnknown
.done
	call CloseSRAM
	ret

InitiateMigration:
	ld a, BANK(sGameVersion)
	call OpenSRAM
	ld a, [sGameVersion]
	call SaveCanBeMigrated
	cp MIGRATION_NO_CHANGE_NEEDED
	jr z, .done
	cp MIGRATION_CANNOT_MIGRATE
	jr z, MigrationCannotMigrate
	cp MIGRATION_SHOULD_MIGRATE
	jp z, MigrateSaveFile
	jr MigrationUnknown
.done
	call CloseSRAM
	ret

MigrationUnknown:
	call CloseSRAM
	ld a, [wOptions]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions], a
	ld hl, UnknownVersionText
	call PrintText
	pop af
	ld [wOptions], a
	scf
	ret

MigrationCannotMigrate:
	call CloseSRAM
	ld a, [wOptions]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions], a
	ld hl, CannotMigrateText
	call PrintText
	pop af
	ld [wOptions], a
	scf
	ret

UnknownVersionText:
	text "This save file"
	line "appears to be from"
	para "a newer version of"
	line "the game."
	para "Please use it with"
	line "the newer version"
	cont "instead."
	prompt

CannotMigrateText:
	text "This save file"
	line "appears to be from"
	para "an older version"
	line "of the game."
	para "Consult the docs"
	line "for details on"
	para "how to update the"
	line "save file."
	prompt
