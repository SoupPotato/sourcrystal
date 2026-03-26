; This file contains save file migration actions.
; The migration should only be limited at most 1 version,
; so as to avoid getting bogged down with too much code.
; (e.g. version 1 -> 2, not version 1 -> 3.)

; Loading a newer save file should either error out or be unstable,
; since we don't know what that newer version contains.

DEF GAME_VERSION EQU 2
; 00 = v6.1
; 01 = v6.2
;      * Add the save file version.
; 02 = v7.0?
;      * Adjustments for new phone contact system.


; Anything between these lines should be the ones updated when making a breaking
; change to the save format.
; ------------------------------------------------------------------------------
; version 01 -> 02: shift the weather variables due to Pokegear expansion
DEF MIGRATION_wPlayerData EQU $d47e
DEF MIGRATION_OLD_wWeatherRandomDay EQU $dc8a
DEF MIGRATION_NEW_wWeatherRandomDay EQU $dc92
DEF MIGRATION_OLD_sGSBallFlagBackup EQU $be14
DEF MIGRATION_NEW_sGSBallFlagBackup EQU $be12

MigrateSaveFile:
	ld a, BANK(sPlayerData)
	call OpenSRAM
; the weather stuff has shifted, so deal with that
	ld de, MIGRATION_NEW_wWeatherRandomDay + 8 - wPlayerData + sPlayerData
	ld hl, MIGRATION_OLD_wWeatherRandomDay + 8 - wPlayerData + sPlayerData
	call MigrateSaveFileCommon
; attempt to compensate for the slight decimation of crystal data
	ld a, BANK(sGSBallFlagBackup)
	call OpenSRAM
	ld de, MIGRATION_OLD_sGSBallFlagBackup
	ld hl, MIGRATION_NEW_sGSBallFlagBackup
	ld c, sBTMonPrevPrevTrainer3-sGSBallFlagBackup
.shift_tower_data
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .shift_tower_data
	jp ApplySaveVersion

MigrateBackupSaveFile:
	ld a, BANK(sBackupPlayerData)
	call OpenSRAM
; the weather stuff has shifted, so deal with that
	ld de, MIGRATION_NEW_wWeatherRandomDay + 8 - wPlayerData + sBackupPlayerData
	ld hl, MIGRATION_OLD_wWeatherRandomDay + 8 - wPlayerData + sBackupPlayerData
	call MigrateSaveFileCommon
	jp ApplyBackupSaveVersion

MigrateSaveFileCommon:
	ld c, 9
.shift_weather_stuff
	ld a, [hld]
	ld [de], a
	dec de
	dec c
	jr nz, .shift_weather_stuff
; prevent borking of the pokegear as well
	ld c, 8
	xor a
.shift_pokegear
	ld [de], a
	dec de
	dec c
	jr nz, .shift_pokegear
	ret

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
	cp -1 ; treat this as version 0
	jr nz, .do_compare
	xor a
.do_compare
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
	jp z, MigrateBackupSaveFile
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