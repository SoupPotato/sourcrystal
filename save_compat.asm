; This file contains save file migration actions.
; The migration should only be limited at most 1 version,
; so as to avoid getting bogged down with too much code.
; (e.g. version 1 -> 2, not version 1 -> 3.)

; Loading a newer save file should either error out or be unstable,
; since we don't know what that newer version contains.

; 00 = v6.1
; 01 = v6.2
;      * Add the save file version.

DEF GAME_VERSION EQU 1

; Anything between these lines should be the ones updated when making a breaking
; change to the save format.
; ------------------------------------------------------------------------------
; version 00 -> 01: simply update the save version

MigrateSaveFile:
	jp ApplySaveVersion

MigrateBackupSaveFile:
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
	jr z, MigrateSaveFile
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