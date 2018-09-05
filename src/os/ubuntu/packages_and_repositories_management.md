## signature failed, cleansigned file isn't valid got 'NODATA'

```bash
apt clean
mv /var/lib/apt/lists /tmp
mkdir -p /var/lib/apt/lists/partial
apt clean
apt update
```

- http://askubuntu.com/questions/131601/gpg-error-release-the-following-signatures-were-invalid-badsig
- http://askubuntu.com/questions/635087/apt-get-update-fails-in-ubuntu-14-04-due-to-gpg-error
- http://askubuntu.com/questions/477906/cant-update-my-system-due-to-gpg-error-clearsigned-file-isnt-valid-got-nodat
- http://askubuntu.com/questions/474549/got-nodata-issue-nodata-does-the-network-require-authentication

## add sources manually

http://askubuntu.com/questions/38021/how-to-add-a-ppa-on-a-server/38029#38029

## show package dependencies

`apt-cache depends pkgname | awk '!seen[$0]++'`

- http://serverfault.com/questions/577942/install-only-dependencies-of-a-given-package-in-debian-or-ubuntu-apt
- http://unix.stackexchange.com/questions/11939/how-to-get-only-the-unique-results-without-having-to-sort-data

`debfoster -d $PACKAGE`

- http://unix.stackexchange.com/questions/29653/list-recursive-dependencies-of-the-installed-packages-in-apt

## install updates

```bash
sudo apt update        # Fetches the list of available updates
sudo apt upgrade       # Strictly upgrades the current packages
sudo apt dist-upgrade  # Installs updates (new ones)
```

https://askubuntu.com/questions/301484/how-do-i-update-ubuntu-manually

## upgrade release

- http://askubuntu.com/questions/110477/how-do-i-upgrade-to-a-newer-version-of-ubuntu
- http://askubuntu.com/questions/5763/upgrading-from-the-command-line

## clean

```bash
sudo apt --purge autoremove
sudo apt clean all
```

## update single package

```
sudo apt update
sudo apt install --only-upgrade <packagename>
```

https://askubuntu.com/questions/44122/how-to-upgrade-a-single-package-using-apt-get

## list installed packages

`apt list --installed | grep postg`

## remove package with dependencies

`sudo apt remove --auto-remove packagename`

https://askubuntu.com/questions/443/how-to-remove-an-uninstalled-packages-dependencies

## Discover what package a file belongs to

`dpkg -S /usr/bin/ls`

https://superuser.com/questions/10997/find-what-package-a-file-belongs-to-in-ubuntu-debian/11003#11003

## What files are installed with package

`dpkg -L <package>`

https://askubuntu.com/questions/32507/how-do-i-get-a-list-of-installed-files-from-a-package/32510#32510

## remove repository

`sudo add-apt-repository --remove ppa:whatever/ppa`

Manual:

you can enter:

sudo rm -i /etc/apt/sources.list.d/myppa.list

Take care with rm (hence why I have used the interactive switch so you can confirm your actions. Then run sudo apt-get update afterwards.

This method merely removes the ppa .list file; it does not remove any other files or sort out any other problems caused by the ppa; for that you could use ppa-purge.

Also take into account that if you previously added the key of the repo as trusted you should remove it:

```bash
# list the trusted keys
sudo apt-key list
# remove the key
sudo apt-key del KEY_ID
```

https://askubuntu.com/questions/307/how-can-ppas-be-removed
