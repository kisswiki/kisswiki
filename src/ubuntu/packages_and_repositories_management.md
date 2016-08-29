## show package dependencies

`apt-cache depends pkgname | awk '!seen[$0]++'`

- http://serverfault.com/questions/577942/install-only-dependencies-of-a-given-package-in-debian-or-ubuntu-apt
- http://unix.stackexchange.com/questions/11939/how-to-get-only-the-unique-results-without-having-to-sort-data
