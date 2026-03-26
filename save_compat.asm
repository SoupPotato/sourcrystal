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

MigrateSaveFile::
  ; version 00 -> 01: simply update the save version
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
  ccf
  ret
.yes
  ld a, MIGRATION_SHOULD_MIGRATE
  ccf
  ret
.no
  ld a, MIGRATION_NO_CHANGE_NEEDED
  ret
.unknown ; save file version is greater, don't know what to do
  ld a, MIGRATION_UNKNOWN
  ret

InitiateMigration::
  ; get game version
  ; check if it's the current version -yes-> no change
  ; check SaveCanBeMigrated -no-> warn player
  ; fallthrough to migrate save file
