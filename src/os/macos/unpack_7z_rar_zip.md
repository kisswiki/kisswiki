`brew cask install the-unarchiver`

- http://7-zip.org/download.html
- https://superuser.com/questions/548349/how-can-i-install-7zip-so-i-can-run-it-from-terminal-on-os-x

## Pack

`brew install sevenzip`

no compression:

`7zz a -tzip -mem=AES256 -mx=1 -mmt=on -p archive.zip Folder_or_File`

compression:

`7zz a -tzip -mem=AES256 -p archive.zip Folder_or_File`
