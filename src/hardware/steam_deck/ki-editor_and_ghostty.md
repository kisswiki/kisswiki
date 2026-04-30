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

## Capslock as Escape

`System Settings > Keyboard > Key Bindings > Caps Lock behavior > Make Caps Lock an additional Esc > Apply`

## Install ghostty

`sudo pacman -S ghostty`

## On-screen keyboard is shown in desktop mode in ghostty

The only solution that works for me, is to have external display and then OSK (on-screen keyboard) is displayed on steam deck internal display. In desktop mode for tv I needed to change in KDE `System Settings > Display & Monitor > Display Configuration > Resoultion: 1920x1080`. https://www.forbes.com/sites/jasonevangelho/2022/03/04/steam-deck-desktop-mode-challenge-day-1-get-a-hub-and-get-docked/

You need to cancel it couple of times. I do not know how to disable it.

To hide it, press `B` on gamepad.

- https://github.com/ghostty-org/ghostty/discussions/9302

- https://github.com/ghostty-org/ghostty/issues/7987

Maybe this will help https://steamcommunity.com/discussions/forum/1/5560306947037841392/

## KDE titlebar takes to much space in ki and ghostty

In ~/.config/ghostty/config

set

`window-decoration = none`

And reopen ghostty.

To move windows: win+mouse move

https://ghostty.org/docs/config/reference#window-decoration

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

You may also disable showing tabs in ghostty with `window-show-tab-bar = never`, but only on Linux (GTK). https://ghostty.org/docs/config/reference#window-show-tab-bar

next tab: ctrl+pgup

previous tab: ctrl+pgdown

context menu: shift+right mouse click

split right: shift+ctrl+o

split down: shift+ctrl+e

## Terminfo

> the terminfo authors have deliberately chosen to ship their own version of the terminfo definition under a different name (ghostty instead of xterm-ghostty), with their own modifications that make it substantially different from our own terminfo definition, so it wouldn't even work out-of-the-box like what we had expected. https://github.com/ghostty-org/ghostty/discussions/8268#discussioncomment-16744849

Copy Ghostty's terminfo entry to the remote machine. The easiest way is using the following one-liner:

`infocmp -x xterm-ghostty | ssh YOUR-SERVER -- tic -x -`

https://ghostty.org/docs/help/terminfo
