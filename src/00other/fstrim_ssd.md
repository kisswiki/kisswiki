Warning: Users need to be certain that their SSD supports TRIM before attempting to use it. Data loss can occur otherwise!

To verify TRIM support, run:

`$ lsblk --discard`

And check the values of DISC-GRAN (discard granularity) and DISC-MAX (discard max bytes) columns. Non-zero values indicate TRIM support.

https://wiki.archlinux.org/title/Solid_state_drive

Also:

TRIM is important. Without it, the SSD's controller will not know where the free space is on the drive. The controller needs free space to do its garbage collection job. The drive has a little bit of hidden extra space so that it can still do garbage collection even if the drive is 100% full, but the drive's performance will take a nose dive in that situation.

https://www.reddit.com/r/archlinux/comments/96pgbq/comment/e42a8sy/
