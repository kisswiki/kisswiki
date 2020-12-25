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
sudo apt update           # Fetches the list of available updates
sudo apt upgrade -y       # Installs some updates; does not remove packages
sudo apt full-upgrade -y  # Installs updates; may also remove some packages, it needed
sudo apt dist-upgrade -y
sudo apt autoremove -y    # Removes any old packages that are no longer needed
sudo apt autoclean -y
```

- https://askubuntu.com/questions/196768/how-to-install-updates-via-command-line
- https://askubuntu.com/questions/301484/how-do-i-update-ubuntu-manually

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
cd /etc/apt/trusted.gpg.d/
rm {file}
```

https://askubuntu.com/questions/307/how-can-ppas-be-removed/173209#173209

## Errors

### Could not get lock /var/lib/dpkg/lock

`shutdown -r now` helped me.

https://askubuntu.com/questions/15433/unable-to-lock-the-administration-directory-var-lib-dpkg-is-another-process

## HTTPS

https://www.reddit.com/r/programming/comments/ai9n4k/why_does_apt_not_use_https/

## update or intall - forbidden 403

`sudo vim /etc/apt/sources.list`

change `pl.archive.ubuntu.com` to `archive.ubuntu.com`.

- https://lists.ubuntu.com/archives/ubuntu-pl/Week-of-Mon-20051121/001582.html
- https://askubuntu.com/questions/104695/how-do-i-change-mirrors-in-ubuntu-server-from-regional-to-main

## apt-get vs apt

While apt does have some similar command options as apt-get, it’s not backward compatible with apt-get. That means it won’t always work if you just replace the apt-get part of an apt-get command with apt.

```
apt install			apt-get install			Installs a package
apt remove	 		apt-get remove	 		Removes a package
apt purge			apt-get purge   		Removes package with configuration
apt update 			apt-get update 			Refreshes repository index
apt upgrade			apt-get upgrade 		Upgrades all upgradable packages
apt autoremove 		apt-get autoremove	 	Removes unwanted packages
apt full-upgrade 	apt-get dist-upgrade 	Upgrades packages with auto-handling of dependencies
apt search			apt-cache search 		Searches for the program
apt show			apt-cache show 			Shows package details
```

apt has a few commands of its own as well.

```
apt list		 	Lists packages with criteria (installed, upgradable etc)
apt edit-sources 	Edits sources list
```

- https://itsfoss.com/apt-vs-apt-get-difference/
- https://askubuntu.com/questions/829864/is-apt-get-deprecated

## information about package

`apt show <package>`

https://askubuntu.com/questions/341178/how-do-i-get-details-about-a-package-which-isnt-installed/1148414#1148414

If it is installed (probably) there should be line starting with `APT-Manual-Installed:`.

Or use `dpkg -s <package>` to get info if it is installed.

## check verson before install

```
apt list <package>
apt policy <package>
apt-cache madison <package>
apt install -V <package>
```

- https://stackoverflow.com/questions/18885820/how-to-check-the-version-before-install-packages-using-apt-get
- https://askubuntu.com/questions/447/how-can-i-see-all-versions-of-a-package-that-are-available-in-the-archive

## apt vs apt-get

APT 1.0 was released on the 1. April 2014 includes a new “apt” binary that combines the most commonly used commands from apt-get and apt-cache. The commands are the same as their apt-get/apt-cache counterparts but with slightly different configuration options.

- https://mvogt.wordpress.com/2014/04/04/apt-1-0/
- https://askubuntu.com/questions/445384/what-is-the-difference-between-apt-and-apt-get/446484#446484

## Why a package is installed

`apt-cache rdepends --no-{suggests,conflicts,breaks,replaces,enhances} --installed --recurse <package>`

- https://askubuntu.com/questions/5636/can-i-see-why-a-package-is-installed#comment1012201_5637
