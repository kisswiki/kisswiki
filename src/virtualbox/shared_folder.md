- Install guest additions on guest

## Ubuntu guest

Probably you need to install:

```bash
sudo apt-get install build-essential linux-headers-$(uname -r) virtualbox-guest-dkms virtualbox-guest-additions-iso virtualbox-guest-utils
```

- http://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm/34871#34871

No need to manually mount like `sudo mount -t vboxsf wd ~/vbshare/`

Maybe needed to

### Group

There is result when running `grep vbox /etc/group`

> if the vboxsf group did not exist in the guest, the shared folder wouldn't have shown up in /media
> https://forums.virtualbox.org/viewtopic.php?f=7&t=61327#p285737
