## referrals

- https://www.linode.com/referrals

## block storage

- https://blog.linode.com/2018/02/01/announcing-linode-block-storage-volumes/
- https://www.linode.com/blockstorage
- https://linode.com/docs/platform/how-to-use-block-storage-with-your-linode/

## availability

The Block Storage service is available now in us-west/Fremont region only. us-east/Newark will be online in the next few weeks, with us-central/Dallas online shortly after. We’re aiming to have eu-west/London, eu-central/Frankfurt, ap-south/Singapore, and ap-northeast/Tokyo2 online in Q2, 2018.

https://blog.linode.com/2018/02/01/announcing-linode-block-storage-volumes/

In order to take advantage of the Block Storage service the volume and associated Linode must be in the same datacenter.

Block Storage is currently at capacity in our Newark datacenter. Frankfurt, Newark, and Dallas will be launched in the first quarter of 2018.

London, Tokyo 2, and Singapore will will be available in the second quarter of 2018.

https://www.linode.com/blockstorage

## cost

Each volume will be $0.10 per GiB per month no matter the size, so if you happen to have a volume that’s below 10GiB it would be less than $1 per month.

https://blog.linode.com/2018/02/01/announcing-linode-block-storage-volumes/

## resize

You can resize online without data loss, however we haven’t been able to get Linux to recognize that the underlying device has changed size — so unplugging and replugging (or a reboot) is required (then you can resize the filesystem). We’ve tried all the tricks. Perhaps this will be resolved in the future…

https://blog.linode.com/2018/02/01/announcing-linode-block-storage-volumes/

## backup

Will block storage get backed up with the rest of the instance?

No. The Backup service only backs up directly attached disks.

You can create additional Volumes and back up your data on your own between Volumes, or you can clone an existing Volume with one click.

https://blog.linode.com/2018/02/01/announcing-linode-block-storage-volumes/

## EU vat tax

- https://forum.linode.com/viewtopic.php?p=75227&sid=cb00ea7e07222f715954c2beedc9de79
- https://linode.com/docs/platform/billing-and-payments/

## Alpine Linux

- https://linode.com/docs/tools-reference/custom-kernels-distros/install-alpine-linux-on-your-linode/
- https://serverfault.com/questions/829155/alpine-on-linode-looses-its-ip-after-reboot

## Docker

- https://www.linode.com/docs/applications/containers/