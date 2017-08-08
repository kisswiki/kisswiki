## signature failed, cleansigned file isn't valid got 'NODATA'

```bash
apt-get clean
mv /var/lib/apt/lists /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update
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
sudo apt-get update        # Fetches the list of available updates
sudo apt-get upgrade       # Strictly upgrades the current packages
sudo apt-get dist-upgrade  # Installs updates (new ones)
```

## upgrade release

- http://askubuntu.com/questions/110477/how-do-i-upgrade-to-a-newer-version-of-ubuntu
- http://askubuntu.com/questions/5763/upgrading-from-the-command-line

## clean

```bash
sudo apt-get --purge autoremove
sudo apt-get clean all
```

## update single package

`apt install --only-upgrade <packagename>`

https://askubuntu.com/questions/44122/how-to-upgrade-a-single-package-using-apt-get

## list installed packages

`apt list --installed | grep postg`

## remove package with dependencies

`apt-get remove --auto-remove packagename`

https://askubuntu.com/questions/443/how-to-remove-an-uninstalled-packages-dependencies

## Discover what package a file belongs to

`dpkg -S /usr/bin/ls`

https://superuser.com/questions/10997/find-what-package-a-file-belongs-to-in-ubuntu-debian/11003#11003

## What files are installed with package

`dpkg -L <package>`

https://askubuntu.com/questions/32507/how-do-i-get-a-list-of-installed-files-from-a-package/32510#32510
