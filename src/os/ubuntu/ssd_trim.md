## Continuous vs via NCQ vs periodic

Continuous TRIM (discard in fstab, note that this is not sufficient on XFS root partition however, see [(https://wiki.archlinux.org/title/Solid_state_drive#Periodic_TRIM)]) issues TRIM with each delete and that can compound if it requires doing some GC internally, if you have lots of deletes going on then it can cause perf issues.

To work around that SATA 3.1 compatible devices (with compatible SATA 3.1 controller chipsets and any USB-SATA bridge intermediary if one is involved for external disk) can offer queued TRIM via NCQ, but as this article points out some firmware is faulty and that can result in performance issues that others have said can stall I/O making a system seem frozen/stuck for a bit.

Due to that, it's safer to not worry about such an optimization AFAIK and most distros default/prefer periodic TRIM instead, which sends the command once at some regular interval (eg weekly), to just perform the same task that's piled up in bulk (ideally during an idle period, if it would have any impact on the UX).

As someone else mentioned citing Wikipedia, apparently only Linux supports this Continuous TRIM approach (no clue if that's outdated info). Doesn't seem like there's any practical advantage for consumers to discard on-demand vs once weekly.

So fstrim periodically seems to be the way to go.

https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1277056-samsung-860-870-ssds-continue-causing-problems-for-linux-users?p=1277253#post1277253

## Trim manually

```bash
$ sudo /sbin/fstrim -a -v
/mnt/games: 96.3 GiB (103374827520 bytes) trimmed on /dev/sdd1
/boot/efi: 477.8 MiB (500965376 bytes) trimmed on /dev/md126p1
/: 105.2 GiB (112951443456 bytes) trimmed on /dev/md126p2
```

https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1277056-samsung-860-870-ssds-continue-causing-problems-for-linux-users?p=1277096#post1277096

## Blacklist of devices

- https://git.kernel.dk/cgit/linux-block/tree/drivers/ata/libata-core.c?id=master#n3794
