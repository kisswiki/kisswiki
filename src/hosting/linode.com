## block storage

- https://blog.linode.com/2018/02/01/announcing-linode-block-storage-volumes/
- https://www.linode.com/blockstorage
- https://linode.com/docs/platform/how-to-use-block-storage-with-your-linode/

### specifics

availability

The Block Storage service is available now in us-west/Fremont region only. us-east/Newark will be online in the next few weeks, with us-central/Dallas online shortly after. We’re aiming to have eu-west/London, eu-central/Frankfurt, ap-south/Singapore, and ap-northeast/Tokyo2 online in Q2, 2018.

cost

Each volume will be $0.10 per GiB per month no matter the size, so if you happen to have a volume that’s below 10GiB it would be less than $1 per month.

https://blog.linode.com/2018/02/01/announcing-linode-block-storage-volumes/