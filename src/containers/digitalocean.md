## Block Storage

> Volumes are units of highly available block storage that you can attach to your Droplet - use them to store assets, backups, databases, and more. Volumes can be moved between Droplets and you can increase their size as needed.

> - Highly available: Your data is stored on hardware separated from your Droplet and it's replicated multiple times across different racks, reducing the chances of data loss in case of hardware failure.
> - Live resize: Easily scale Block Storage volumes from 1GB up to 16TB, resize them if you need more space, and move them between Droplets.
> - Reliable and secure: All your data is encrypted at rest and transmitted to the Droplets over isolated networks.
- https://www.digitalocean.com/products/storage/


> DigitalOcean Block Storage is a flexible, convenient way of managing additional storage for your DigitalOcean Droplets. Block Storage is provisioned in units known as volumes. Volumes function as block devices, meaning they appear to the operating system as locally attached storage drives which can be partitioned and formatted according to your needs.
> Region Support: Currently, volumes are available in NYC1 and SFO2.
> Additional details:
> - Volumes are region-specific resources. Volumes can be moved freely between Droplets within that region.
> - A volume may only be attached to one Droplet at a time. However, up to five volumes can be attached to a single Droplet.
> Block Storage is a good solution in scenarios where you need more storage space, but do not require the additional processing power or memory that a larger Droplet would provide. Block Storage volumes can be created, destroyed, or expanded easily as your needs change, simplifying initial planning around your storage requirements.
> https://www.digitalocean.com/community/tutorials/how-to-use-block-storage-on-digitalocean

> To date, the top feature request from our community has been to have the ability to add additional disk space to their Droplets.
> https://www.digitalocean.com/company/blog/block-storage-more-space-to-scale/
