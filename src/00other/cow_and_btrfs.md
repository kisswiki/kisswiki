https://lwn.net/Articles/747633/ 
Sorry XFS is a data copy on write filesystem. XFS includes in current form data copy on write. What has been generally recognised as requiring a full COW file system turns out to be wrong. Hybrid between data copy on write and update in place metadata has been demoed. The hybrid prototype seams to show that it can do all the functionality of full copy on write file systems without the worst overheads and issues of full copy on write file systems.

Data copy on write file system is a lot simpler item to create than a full copy on write file system. Data copy on write allows effective duplication reduction.

XFS might be the first copy on write file system with all features that does not have strange issues. This is while keeping update in place metadata system. Basically lets not reinvent the wheel if we don't have to.

https://en.wikipedia.org/wiki/Ext3cow
Note what XFS is doing is not the first of either by using data cow with update in place metadata to create a copy on write file system with most of the functionality.

Really we might end up hating ZFS because its method that btrfs and other attempted to follow might have been completely the wrong way.

Having a file system that handles ENOSPC badly is not a particular good thing. Btrfs and ZFS have both have this problem. Both it comes to not being able to calculate how much space is going to be consumed to complete an operation dependably this is coming from the COW metadata. The history of COW metadata file systems have brought up the same problems. The one thing is xfs developers do properly torture tested their file system.


https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1023658-bcachefs-file-system-is-working-on-going-upstream-in-the-linux-kernel/page2