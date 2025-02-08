## macos arm64 apple silicon install

`brew install --cask ioquake3`

or https://files.ioquake3.org/ioquake3_notarized.zip from https://ioquake3.org/get-it/

Install, go to Applications, ioquake3 > right click > Show Package Contents > Contents > MacOS > baseq3 > paste all *.pk3 files 

## cd key

22222....

https://www.reddit.com/r/quake/comments/w4iqbn/comment/ih2tr9y/

## disable bot chat

`seta bot_nochat 1`

in baseq3/autoexec.cfg

on macos `nvim ~/Library/Application\ Support/Quake3/baseq3/autoexec.cfg`

- https://ioquake3.org/help/players-guide/#macoswhere
- https://steamcommunity.com/sharedfiles/filedetails/?id=2608518812

## skip id logo movie

`open -na ioquake3 --args +wait`

- https://ioquake3.ioquake.narkive.com/28FmCUro/id-intro-movie
- https://superuser.com/questions/16750/how-can-i-run-an-application-with-command-line-arguments-in-mac-os

can also make it an app on macos:

open script editor, paste above command, export as application.

https://apple.stackexchange.com/questions/8299/how-do-i-make-an-applescript-file-into-a-mac-app/234254#234254
