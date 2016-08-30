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

- http://askubuntu.com/questions/52328/mount-virtualbox-sharedfolder-in-ubuntu-vm-on-boot/818483#818483
- https://help.ubuntu.com/community/VirtualBox/SharedFolders
- https://wiki.archlinux.org/index.php/VirtualBox#Enable_shared_folders
- http://askubuntu.com/questions/161759/how-to-access-a-shared-folder-in-virtualbox
- http://unix.stackexchange.com/questions/52667/file-permission-issues-with-shared-folders-under-virtual-box-ubuntu-guest-wind
- http://serverfault.com/questions/674974/how-to-mount-a-virtualbox-shared-folder/674978
- http://askubuntu.com/questions/252853/how-to-mount-a-virtualbox-shared-folder-at-startup
- http://askubuntu.com/questions/30396/error-mounting-virtualbox-shared-folders-in-an-ubuntu-guest
- http://superuser.com/questions/640027/why-cant-i-chown-a-virtualbox-shared-folder
- http://askubuntu.com/questions/481559/how-to-automatically-mount-a-folder-and-change-ownership-from-root-in-virtualbox
- http://askubuntu.com/questions/747974/virtualbox-shared-folders-are-owned-by-root-in-lubuntu-guest
- http://askubuntu.com/questions/337531/admin-no-longer-has-access-to-shared-folder
- http://superuser.com/questions/307853/permission-denied-when-accessing-virtualbox-shared-folder-when-member-of-the-vbo
- http://stackoverflow.com/questions/26740113/virtualbox-shared-folder-permissions
- http://askubuntu.com/questions/456400/why-cant-i-access-a-shared-folder-from-within-my-virtualbox-machine
- http://stackoverflow.com/questions/37038958/auto-mount-virtualbox-shared-folder-in-fstab-on-ubuntu-server-16-04
- http://stackoverflow.com/questions/33822107/how-to-access-a-shared-folder-with-ubuntu-on-virtualbox
- http://serverfault.com/questions/674974/how-to-mount-a-virtualbox-shared-folder/674976#674976

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
