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

## updagre release

- http://askubuntu.com/questions/110477/how-do-i-upgrade-to-a-newer-version-of-ubuntu
- http://askubuntu.com/questions/5763/upgrading-from-the-command-line
