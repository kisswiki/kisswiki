## Build from source

```
# https://blog.meinside.dev/How-to-Setup-Development-Environment-on-Steam-Deck/
passwd
sudo steamos-readonly disable
# https://www.reddit.com/r/SteamDeck/comments/18ec3r7/comment/kcngnfc/ 
sudo pacman-key --init
sudo pacman-key --populate holo 
# https://www.reddit.com/r/SteamDeck/comments/t92ozw/for_compiling_c_code/
sudo pacman -S glibc linux-api-headers
# install rust as in https://rustup.rs/
echo 'export PATH=$HOME/.cargo/bin:$PATH' >> ~/.bashrc
. ~/.bashrc  
```

As system libs and rustup and paths are set, follow instructions:

https://ki-editor.org/docs/installation/#build-from-source-without-nix

## Copy text does not copy to system clipboard

How to fix it?

## KDE titlebar takes to much space.

In ~/.config/ghostty/config

set

`window-decoration = none`

And reopen ghostty.

But ghostty then will be under taskbar.

You need to maximize it with `win+pgup`.

Then you need other ghostty shorcuts like:

new tab: ctrl+shift+t

close tab: ctrl+shift+w

quit ghostty: ctrl+shift+q

copy text: ctrl+shift+c

paste text: ctrl+shift+v

increase font-size: ctrl+=

decrease font-size: ctrl+-

reset font-size: ctrl+0