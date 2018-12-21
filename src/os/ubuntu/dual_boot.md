## Partition table: msdod

If `sudo parted -l` shows that your disk has msdos partion table, do not create EFI partition during install, bc you won't be able to chainload Windows.
