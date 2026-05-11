# Save file migrations

This directory contains all of the code for migrating from a prior save version
to a newer one. It's intended as a sort of reference for how and why a
change had to be made, because putting this stuff behind the git log doesn't
seem to be the best course of action.

Only the latest migration is `INCLUDE`'d inside of `save_compat.asm`.

> [!NOTE]
> Save migration routines end with a `jp ApplySaveVersion`/`ApplyBackupSaveVersion`, to ensure the proper save version is tagged.
> It is also *always* called `MigrateSaveFile`/`MigrateBackupSaveFile`.

## Save versions summary

### v6.3 (save version 02)

* Change how the Pokegear stores contacts. This results in the phone essentially having
  maximum capacity.

### v6.2 (save version 01)

* Save tagging system introduced.
