- Install guest additions on guest

## Ubuntu guest and shared folders automounting

In order automount and access those folders as normal user, specific steps are required.

Don't use official guest additions. Instead install `virtualbox-guest-dkms`.

```bash
sudo apt-get install -y virtualbox-guest-dkms
sudo usermod -aG vboxsf $(whoami)
sudo VBoxControl guestproperty set /VirtualBox/GuestAdd/SharedFolders/MountDir ~/vbshare
```

Add some shared folders with `Auto-mount` and `Permanent` checked.

Restart vm.

After that check if you have any vb folders mounted:

`mount | grep vboxsf`

If so, you need to change ownership of `~/vbshare` to yourself.

```bash
sudo chown $(whoami):$(whoami) ~/vbshare
```

# Ubuntu 16.04 guest and shared folders automounting accessible by normal user

In order automount and access those folders as normal user, specific steps are required.

1. Don't use official guest additions. Instead install `virtualbox-guest-dkms`.

    ```bash
    sudo apt-get install -y virtualbox-guest-dkms
    sudo usermod -aG vboxsf $(whoami)
    sudo VBoxControl guestproperty set /VirtualBox/GuestAdd/SharedFolders/MountDir ~/vbshare
    ```

2. Add some shared folders with `Auto-mount` and `Permanent` checked.
3. Restart vm.
4. Check if you have any vb folders mounted:

    `mount | grep vboxsf`

5. If so, change ownership of `~/vbshare` to yourself.

    ```bash
    sudo chown $(whoami):$(whoami) ~/vbshare
    ```
6. Get list of shared folders: `sudo VBoxControl sharedfolder list`.



### Packages

```bash
$ apt-cache depends virtualbox-guest-utils
 |Recommends: virtualbox-guest-dkms
  Recommends: virtualbox-guest-x11
$ apt-cache depends virtualbox-guest-dkms
  Depends: virtualbox-guest-utils
$ apt-cache depends virtualbox-guest-x11
  Depends: virtualbox-guest-utils
```

### Group

There is result when running `grep vbox /etc/group`

> if the vboxsf group did not exist in the guest, the shared folder wouldn't have shown up in /media
> https://forums.virtualbox.org/viewtopic.php?f=7&t=61327#p285737
