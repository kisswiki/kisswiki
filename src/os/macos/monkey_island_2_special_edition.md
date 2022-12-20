## Install Monkey Island 2 Special Edition

1. Buy MISE from GOG: https://www.gog.com/game/the_secret_of_monkey_island_special_edition
2. Download MISE from your GOG account
3. Install Porting Kit `brew install --cask porting-kit`
4. Install MISE via Porting Kit: https://portingkit.com/game/1349

- https://www.reddit.com/r/MonkeyIsland/comments/m4ki4i/comment/gqutn0s/
- https://www.paulthetall.com/monkey-island-2-se-mac/
- https://www.skidrowcodex.net/monkey-island-2-special-edition-lechucks-revenge-gog/

## Install Polish translation

1. Download file https://www.dropbox.com/sh/4gllpgjbgxw4u1s/AACRgxkvjiar2Cq46VF2rAPta/Games/MISEC/misec_pl_user/ referenced on https://grajpopolsku.pl/forum/viewtopic.php?t=2473
2. Install docker desktop `brew install --cask docker`
3. You need xdelta1, because xdelta3 which is the newest version, will fail to use the translation patch: `xdelta3: not a VCDIFF input: XD3_INVALID_INPUT`.

> If I'm not mistaken, this error is due to their being two versions of xDelta (v1.1.x and v3.0, either that or they are two apps calling themselves xDelta, both doing similar things but in different ways) and are not compatible with eachother. https://gbatemp.net/threads/xdeltaui-help.263015/post-3243655

> The algorithm of xdelta1 was based on the algorithm of rsync, developed by Andrew Tridgell, though it uses a smaller block size. xdelta3 can generate standardized VCDIFF format, and it realized the compatibility among other delta encoding software which supports the VCDIFF format. https://en.wikipedia.org/wiki/Xdelta

xdelta1 is available in alt linux https://altlinux.pkgs.org/p10/classic-x86_64/xdelta1-1.1.4-alt4.x86_64.rpm.html

3. Run alt linux

```shell
% docker run --rm -it --platform linux/amd64 alt bash
```

https://forums.docker.com/t/run-x86-intel-and-arm-based-images-on-apple-silicon-m1-macs/117123

4. On macos

```shell
% brew instal 7za
% cd ~/Downloads
% unzip misec_pl_user.zip
% 7za x misec_pl_user_v1-4.7z
% unzip misec_pl_user_v1-4.zip
# check md5 of patch
% md5 misec_pl_user/diffs/mi2_2010_steam/pl1/monkey2.pak.xdelta
MD5 (misec_pl_user/diffs/mi2_2010_steam/pl1/monkey2.pak.xdelta) = 7299507d108ea70c8dac57007ad08af3
```

- https://apple.stackexchange.com/questions/307377/how-can-i-unpack-7z-files-via-macos-terminal/307975#307975
- https://stackoverflow.com/questions/5423356/how-to-make-an-md5-file-on-a-mac/5423393#5423393

5. Open in terminal Monkey Island 2 folder.

Go to `Porting Kit > right-click on Monkey Island 2 SE > Show in Finder`

In Finder there is bread crumb with path at the bottom. Right-click on last position in bread crumb and choose copy as path name.

In terminal find the monkey2.pak and check it's md5 sum:

```shell
cd "$HOME/Applications/Monkey Island 2 SE.app"
% find . -iname 'monkey2.pak'
./Contents/SharedSupport/prefix/drive_c/GOG Games/Monkey Island 2 SE/monkey2.pak
% md5 "./Contents/SharedSupport/prefix/drive_c/GOG Games/Monkey Island 2 SE/monkey2.pak"
MD5 (./Contents/SharedSupport/prefix/drive_c/GOG Games/Monkey Island 2 SE/monkey2.pak) = f3cddedea04512fcaf61468ff0b55274
```

md5 sum is the same as in instruction on https://grajpopolsku.pl/forum/viewtopic.php?t=2473

Now we will copy monkey2.pak and monkey2.pak.xdelta to alt linux running in docker.

```shell
% docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED       STATUS       PORTS     NAMES
eb9f00699182   alt       "bash"    2 hours ago   Up 2 hours             funny_noyce
% docker cp "$HOME/Applications/Monkey Island 2 SE.app/Contents/SharedSupport/prefix/drive_c/GOG Games/Monkey Island 2 SE/monkey2.pak" eb9f00699182:/root/
% docker cp ~/Downloads/misec_pl_user/diffs/mi2_2010_steam/pl1/monkey2.pak.xdelta eb9f00699182:/root/
```

- https://stackoverflow.com/questions/22049212/docker-copying-files-from-docker-container-to-host
- https://stackoverflow.com/questions/22907231/how-to-copy-files-from-host-to-docker-container
- https://docs.docker.com/engine/reference/commandline/cp/

6. Go back to terminal when we are logged in to alt linux. Then will we patch the monkey2.pak and check md5 sum of patched file.

```shell
$ apt-get update
$ apt-get install xdelta1
$ xdelta patch monkey2.pak.xdelta monkey2.pak monkey2.pak.patched
$ md5sum monkey2.pak.patched
8425a729f1a59ddd8f64f6c423a9ef9c  monkey2.pak.patched
```

- man page for xdelta1 https://github.com/jmacd/xdelta-gpl/blob/release3_1/xdelta1/README#L124

7. Go back to host terminal

```shell
% docker cp eb9f00699182:/root/monkey2.pak.patched ~/Downloads/
% cp ~/Downloads/monkey2.pak.patched "$HOME/Applications/Monkey Island 2 SE.app/Contents/SharedSupport/prefix/drive_c/GOG Games/Monkey Island 2 SE/monkey2.pak"
```

8. Now we need to change language to French to make Polish translations work. Go `Porting Kit > right-click on "Monkey Island 2 SE" > Properties`. Change Target from `"C:\GOG Games\Monkey Island 2 SE\Monkey2.exe" ` to `C:\GOG Games\Monkey Island 2 SE\language_setup.exe`.

`Run "Monkey Island 2 SE" in Porting Kit which will run language setup. Change to French. Close.

Revert Target to "C:\GOG Games\Monkey Island 2 SE\Monkey2.exe". Run game.

- https://www.gog.com/forum/general/monkey_island_2_special_edition_change_language_to_german

9. Notes

- compiling xdelta1 on mac failed, it needed old glib the something else probably
- https://formulae.brew.sh/cask/wine-stable didn't work to run xdelta.exe. Found it here https://www.evanjones.ca/software/xdelta-win32.html and in here https://web.archive.org/web/20060502025605/https://www.evanjones.ca/software/xdelta.exe. Probably has virus https://www.virustotal.com/gui/file/e4ae06b27af32a1ec1890f9327a2d440cab5b897e6fceccf219583e73e998542.
- There is xdelta 1.1.4 in centos 6, but alt linux worked http://rpm.pbone.net/info_idpl_73607027_distro_centos6_com_xdelta-1.1.4-8.el6.x86_64.rpm.html
- https://formulae.brew.sh/cask/multipatch didn't worked
- there is https://www.freshports.org/misc/xdelta
- another gui using xdelta3 https://github.com/dan0v/xdelta3-cross-gui
- setting messages in macos terminal to English `export LC_MESSAGES=en_US.UTF-8`. https://blog.remibergsma.com/2012/07/10/setting-locales-correctly-on-mac-osx-terminal-application/
