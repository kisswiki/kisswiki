- benchmark.md
- The prices for DigitalOcean and Vultr do not include taxes (VAT) for European countries. https://github.com/joedicastro/vps-comparison
- https://www.slant.co/topics/3444/versus/~digitalocean_vs_linode_vs_f-x-data-cloud

## charging for powered-off

### digitalocean.com

Am I charged while my Droplet is in a powered-off state?
Yes. Your disk space, CPU, RAM, and IP address are all reserved while your Droplet is powered off. If you want to save a Droplet for future use take a snapshot of it and then destroy it. You'll be able to create a new Droplet from the snapshot image anytime to bring it back online. Snapshots are billed at $.05/GB/mo, so a 40GB snapshot costs $2/month.

https://www.digitalocean.com/help/pricing-and-billing/general/

### linode.com

If your Linode is powered off you will still be billed for it. Linode maintains your saved data and reserves your ability to use other resources like RAM and network capacity, even when your Linode is powered off. You will also be billed for any other active Linode service, such as Longview Pro or extra IP’s.

If you want to stop being billed for a particular Linode service, you need to remove it from your account entirely.

https://linode.com/docs/platform/billing-and-payments/

Linode 1GB	$0.003/hr	$2/mo

https://www.linode.com/docs/platform/linode-backup-service/

Linode Images allows you to take snapshots of your disks, and then deploy them to any Linode under your account. This can be useful for bootstrapping a master image for a large deployment, or retaining a disk for a configuration that you may not need running, but wish to return to in the future. Linode Images will be retained whether or not you have an active Linode on your account, which also makes them useful for long term storage of a private template that you may need in the future. There is no additional charge to store Images for Linode users, with a limit of 2GB per Image and 3 Images per account.

https://linode.com/docs/platform/linode-images/

The Linode Images and the backups are different, so you can safely take a snapshot without fear of overwriting the image from the "Manage Image" tab.

https://forum.linode.com/viewtopic.php?f=20&t=14627&sid=76fde816d27629cbe8655987ef274155