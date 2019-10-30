## Remote gui

With this https://github.com/search?q=mpv+remote I have found this https://github.com/open-dynaMIX/simple-mpv-webui

```bash
$ mkdir -p ~/.config/mpv/scripts
$ cd ~/.config/mpv/scripts
$ git clone https://github.com/open-dynaMIX/simple-mpv-webui
$ ln -s simple-mpv-webui/webui.lua .
$ ln -s simple-mpv-webui/webui-page/ .
$ sudo apt install lua5.2 lua5.2-dev luarocks
$ sudo luarocks install luasocket
```

- https://stackoverflow.com/questions/28126996/installing-lua-socket-lib
- https://stackoverflow.com/questions/39760619/lua-cannot-find-installed-luarocks-on-ubuntu
- to prevent zoom-in on double click https://stackoverflow.com/questions/37808180/disable-viewport-zooming-ios-10-safari/38573198#38573198

- https://stackoverflow.com/questions/20321560/how-do-install-libraries-for-both-lua5-2-and-5-1-using-luarocks
- This didn't work https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix

## Find movie files

`find . -type f -exec file -N -i -- {} + | sed -n 's!: video/[^:]*$!!p' | rg -v ".*\.sub$" | awk '{printf "\"%s\"\n", $0}' | xargs mpv`

- https://askubuntu.com/questions/844711/how-can-i-find-all-video-files-on-my-system/844720#844720
- sub is video file? https://www.iana.org/assignments/media-types/media-types.xhtml#video
- https://unix.stackexchange.com/questions/251360/add-quotation-marks-comma-to-each-word-in-a-file/251387#251387
