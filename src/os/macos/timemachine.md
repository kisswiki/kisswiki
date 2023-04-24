## backups will resume when your mac is unlocked

If you can't back up or restore your Mac using Time Machine

1. Suggest restarting in Safe Mode. This will perform a Disk Repair, clear cache files and only load Apple Software, extensions and fonts. The boot up will be slow and can take some time - Normal.

- https://discussions.apple.com/thread/253701948

## backup disc need to be erased?

It will require you to erase the disk if it doesn't like the format of the disk. In this case, I have an ExFAT disk that has 7.5TB and even unencrypted, it requires me to erase it. It requires HFS+ or AFS.

If file format is accepted, time machine creates a Backups.backupdb/ directory for itself and leaves your other files untouched.

Unless you want to encrypt your backup. It uses the same full-disc encryption as FileVault

https://apple.stackexchange.com/questions/19125/does-my-time-machine-backup-disc-need-to-be-dedicated
