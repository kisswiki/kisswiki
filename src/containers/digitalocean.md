## Block Storage

> Volumes are units of highly available block storage that you can attach to your Droplet - use them to store assets, backups, databases, and more. Volumes can be moved between Droplets and you can increase their size as needed.

<br>

> - Highly available: Your data is stored on hardware separated from your Droplet and it's replicated multiple times across different racks, reducing the chances of data loss in case of hardware failure.
> - Live resize: Easily scale Block Storage volumes from 1GB up to 16TB, resize them if you need more space, and move them between Droplets.
> - Reliable and secure: All your data is encrypted at rest and transmitted to the Droplets over isolated networks.
- https://www.digitalocean.com/products/storage/

<br>

> DigitalOcean Block Storage is a flexible, convenient way of managing additional storage for your DigitalOcean Droplets. Block Storage is provisioned in units known as volumes. Volumes function as block devices, meaning they appear to the operating system as locally attached storage drives which can be partitioned and formatted according to your needs.
> Region Support: Currently, volumes are available in NYC1 and SFO2.
> Additional details:
> - Volumes are region-specific resources. Volumes can be moved freely between Droplets within that region.
> - A volume may only be attached to one Droplet at a time. However, up to five volumes can be attached to a single Droplet.
> Block Storage is a good solution in scenarios where you need more storage space, but do not require the additional processing power or memory that a larger Droplet would provide. Block Storage volumes can be created, destroyed, or expanded easily as your needs change, simplifying initial planning around your storage requirements.
> https://www.digitalocean.com/community/tutorials/how-to-use-block-storage-on-digitalocean

<br>

> To date, the top feature request from our community has been to have the ability to add additional disk space to their Droplets.
> We’re working quickly to expand to other regions.
> As of Monday, August 1st Block Storage is now live in FRA1.
> Like all DigitalOcean resources, you can also automate provisioning using
- our brand new volumes API https://developers.digitalocean.com/documentation/v2/#block-storage
- or doctl, the official DigitalOcean command-line client https://www.digitalocean.com/community/tutorials/how-to-use-doctl-the-official-digitalocean-command-line-client
> https://www.digitalocean.com/company/blog/block-storage-more-space-to-scale/

<br>

> you can not currently attach a volume to multiple Droplets at the same time. Setting up a GlusterFS storage pool would be a one way to achieve something similar right now.
> https://www.digitalocean.com/company/blog/block-storage-more-space-to-scale/#comment-2780986082
> https://www.digitalocean.com/community/tutorials/how-to-create-a-redundant-storage-pool-using-glusterfs-on-ubuntu-servers

<br>

> you can certainly use NFS or other tools that you can layer on top of your volume that will allow you to export and mount it on multiple droplets at the same time.
> https://www.digitalocean.com/company/blog/block-storage-more-space-to-scale/#comment-2781185520

<br>

> Currently a droplet only boots from it's local disk which is bundled together in the package and you can't yet boot a droplet directly from block storage if that's what you were interested in.
> https://www.digitalocean.com/company/blog/block-storage-more-space-to-scale/#comment-2782221485

<br>

> You scammers want to charge for snapshots when the sizes are wrong!!
> When we begin billing for snapshots on October 1st, you will only be billed for the amount of space used. This is based on the size of the compressed image file, not the total disk space allocated to the Droplet. Before that time, we'll be sending out updates showing exactly what each user's bill would be so you can make adjustments to your snapshot usage based on real info.
> https://www.digitalocean.com/company/blog/block-storage-more-space-to-scale/#comment-2841549346

<br>

> your competitors are doubling resources (ram/disk space). Don't you think you should follow? It has been 3 years since last time you have done that.
> now that we have block storage out the there we can begin to review our pricing on our plans as customers will be able to augment their storage needs with block storage
> https://www.digitalocean.com/company/blog/block-storage-more-space-to-scale/#comment-2798737633

<br>

> can it be use as cdn like s3, access it directly without droplet?
> In order to use Block Storage you do need to mount it to a Droplet. If you're looking for an object storage solution, please vote for this suggestion over on our UserVoice page.
> https://www.digitalocean.com/company/blog/block-storage-more-space-to-scale/#comment-2784123158

## Bandwidth

> The transfer limits are for external traffic, so you should be alright when moving data internally between your block and your servers.
> https://www.digitalocean.com/company/blog/block-storage-more-space-to-scale/#comment-2781665958

<br>

> If you have the account even before 24th January 2013, bandwidth is free forever
> https://www.digitalocean.com/company/blog/block-storage-more-space-to-scale/#comment-2783414010

<br>

> Once the monthly transfer limit has been exceeded, it is only 2 Cents per GB thereafter
> https://www.digitalocean.com/company/blog/bandwidth-pricing-introduced/
