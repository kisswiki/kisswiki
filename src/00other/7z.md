`7z a folder.7z -mx=9 -mmt=on folder`

- https://superuser.com/questions/408631/how-do-i-enable-multi-threaded-lzma2-using-7-zip-9-20-on-the-command-line
- https://askubuntu.com/questions/491223/7z-ultra-settings-for-zip-format
- https://sevenzip.osdn.jp/chm/cmdline/switches/method.htm

## Exclude

`7z a -x'!dir' -x'!dir1' b.7z *`

- https://superuser.com/questions/1310547/7zip-linux-command-line-excluding-directories/1310558#1310558

use `-spf` for fully qualified names

- https://superuser.com/questions/97342/7zip-command-line-exclude-folders-by-wildcard-pattern/723204#723204

More

- https://superuser.com/questions/185135/add-to-a-7-zip-archive-how-to-exclude-certain-file-types-extensions
- https://superuser.com/questions/682961/how-to-exclude-a-folder-in-7zip
- https://superuser.com/questions/330005/7zip-how-to-exclude-files-not-file-types-using-an-exclude-list-file

## Strongest compression

`7z a -mm=Deflate -mfb=258 -mpass=15 -r foo.zip C:\Path\To\Files\*`

`7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on archive.7z dir1`

- https://superuser.com/questions/281573/what-are-the-best-options-to-use-when-compressing-files-using-7-zip/742034#742034

`7z a archiv.7z -m0=bcj -m1=zstd -mx22 archive.7z dir1`

- https://github.com/mcmilk/7-Zip-zstd
