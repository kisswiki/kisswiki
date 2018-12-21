- [Error changing shell in config · Issue #1381 · jwilm/alacritty](https://github.com/jwilm/alacritty/issues/1381#issuecomment-399488855)
- [Windows Support · Issue #28 · jwilm/alacritty](https://github.com/jwilm/alacritty/issues/28)
- https://arslan.io/2018/02/05/gpu-accelerated-terminal-alacritty/

## Windows

Download Alacritty-v0.2.3.exe and winpty-agent.exe to the same directory.

put `alacritty.xml` in `%USERPROFILE%`.

https://github.com/jwilm/alacritty/blob/master/alacritty_windows.yml

vim scrolls strange. Use nvim.

Finally rust errors are visible on light background.

### nvim

Paste in command buffer works with default register (+):

`C-r +`

## Light theme 

Using xterm with white background and black foreground.

- https://github.com/jwilm/alacritty/wiki/Color-schemes#xterm

## Font size

You need to copy whole section of font, not only size. Otherwise it won't start.

https://github.com/ToxicFrog/Ligaturizer/releases/download/v2/LigaturizedFonts.zip

Install LigaSrc Pro Regular.

## Add to launcher in Linux

https://github.com/jwilm/alacritty/blob/fc04bc1e6dfc6f1bd3f0a70b1d6d2b6cbc551d40/INSTALL.md#desktop-entry
