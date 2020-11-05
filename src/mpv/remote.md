## Remote gui

With this https://github.com/search?q=mpv+remote I have found this https://github.com/open-dynaMIX/simple-mpv-webui

```bash
$ mkdir -p ~/.config/mpv/scripts
$ cd ~/.config/mpv/scripts
$ git clone https://github.com/open-dynaMIX/simple-mpv-webui
$ ln -s simple-mpv-webui/webui.lua .
$ ln -s simple-mpv-webui/webui-page/ .
# mpv supports lua 5.1 or 5.2 https://github.com/mpv-player/mpv/wiki/FAQ#Why_does_mpv_not_support_Lua_53
$ sudo apt install lua5.2 liblua5.2-dev luarocks
$ sudo luarocks install luasocket lua-json
```

- https://stackoverflow.com/questions/28126996/installing-lua-socket-lib
- https://stackoverflow.com/questions/39760619/lua-cannot-find-installed-luarocks-on-ubuntu

To prevent zoom-in on double click, add to the end of ~/.config/mpv/scripts/simple-mpv-webui/webui-page/webui.js:

```javascript
var lastTouchEnd = 0;
document.addEventListener('touchend', function (event) {
  var now = (new Date()).getTime();
  if (now - lastTouchEnd <= 300) {
    event.preventDefault();
  }
  lastTouchEnd = now;
}, false);
```

https://stackoverflow.com/questions/37808180/disable-viewport-zooming-ios-10-safari/38573198#38573198

- https://stackoverflow.com/questions/20321560/how-do-install-libraries-for-both-lua5-2-and-5-1-using-luarocks
- This didn't work https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix

## Find movie files

`find . -type f -exec file -N -i -- {} + | sed -n 's!: video/[^:]*$!!p' | rg -v ".*\.sub$" | awk '{printf "\"%s\"\n", $0}' | xargs mpv`

- https://askubuntu.com/questions/844711/how-can-i-find-all-video-files-on-my-system/844720#844720
- sub is video file? https://www.iana.org/assignments/media-types/media-types.xhtml#video
- https://unix.stackexchange.com/questions/251360/add-quotation-marks-comma-to-each-word-in-a-file/251387#251387
