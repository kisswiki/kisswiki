# Disk usage on APFS: clones, swap, Preboot

## Why du and gdu overcount

- APFS clones (`cp -c`, Finder copies, `ditto`, git worktrees on some tools) share blocks.
  `stat`'s `st_blocks` counts the shared blocks in every clone, so `du`, `gdu`, `ncdu`, `dust`
  add them up once per file. `gdu -a` is apparent size; the default is already `st_blocks`,
  so no switch fixes it.
- Example: `/System/Volumes/Preboot` shows 31 GiB in `gdu`/`du`, but the volume really
  consumes 9.7 GB (its cryptex `.dmg` files are clones).
- The real figure exists only per volume: `diskutil apfs list` ("Capacity Consumed")
  or `df -h`. If a scan's total is well above that, something is cloned.

## What deleting a file frees: ATTR_CMNEXT_PRIVATESIZE

- `getattrlist(2)` with `ATTR_CMNEXT_PRIVATESIZE`: "the number of bytes that are not
  trapped inside a clone or snapshot, and which would be freed immediately if the file
  were deleted". A file and its `cp -c` copy both report 0; once one is gone the other
  reports its full size.
- Exception (measured on macOS 27): a file compressed by the filesystem
  (`UF_COMPRESSED`, `ls -lO` shows `compressed`; many app bundles) reports 0 although
  nothing shares it, and `ATTR_CMNEXT_CLONE_REFCNT` is 0 for it and its clones too.
- Extended attributes are not in `st_blocks` on APFS (a 1 MB xattr changed nothing).

## gdu with --exclusive-size on macOS (fork)

- Upstream gdu has `--exclusive-size` on Linux only (FIEMAP):
  https://github.com/dundee/gdu/pull/710
- Fork with macOS support (getattrlist through libSystem via purego, no cgo):
  https://github.com/rofrol/gdu/tree/darwin-exclusive-size, offered upstream in
  https://github.com/dundee/gdu/pull/729
- Compressed files keep their `st_blocks` figure, so their clones count in full.
- Homebrew names: `gdu` is coreutils' GNU du; the `gdu` formula installs `gdu-go`.

Install the fork as `gdu-go` (Homebrew's `gdu` formula is uninstalled):

```sh
brew uninstall gdu
cd ~/personal_projects/gdu && CGO_ENABLED=0 go build -o ~/.local/bin/gdu-go ./cmd/gdu
gdu-go -n -p -s --exclusive-size /System/Volumes/Preboot   # 11.1 GiB instead of 31.3
```

Back to Homebrew's:

```sh
rm ~/.local/bin/gdu-go && brew install gdu
```

## Non-interactive scans

```sh
gdu-go -n -p -x --depth 3 /System/Volumes/Data > gdu.txt   # -x: stay on the volume
```

## Other places space hides

- Swap: `/System/Volumes/VM` (a separate volume), `sysctl vm.swapusage`.
  20 GB with Chrome at 169 processes; a reboot frees it.
- `/System/Volumes/Preboot`: cryptexes, managed by macOS; nothing to delete.
- Local Time Machine snapshots: `tmutil listlocalsnapshots /`.
- Files deleted but still open: `lsof -nP +L1`.
