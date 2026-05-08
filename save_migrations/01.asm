; version 00 -> 01: simply update the save version
;
; It really does nothing except initiate the new "tagging" system by writing
; the save version to sGameVersion--not handled here, but in `Apply[Backup]SaveVersion`.
; Therefore subsequent save migrations should end with this exact same jump.

MigrateSaveFile:
	jp ApplySaveVersion

MigrateBackupSaveFile:
	jp ApplyBackupSaveVersion
