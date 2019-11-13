`sudo apt install ubuntu-mate-desktop`

Choose `lightdm` during installation or `sudo dpkg-reconfigure lightdm` after installation.

To go back to `gdm`: `sudo dpkg-reconfigure gdm3`.

- https://itsfoss.com/install-mate-desktop-ubuntu/
- https://askubuntu.com/questions/139491/how-to-change-from-gdm-to-lightdm#139529
- https://itsfoss.com/switch-gdm-and-lightdm-in-ubuntu-14-04/

## Tiling windows

I can put window to the right or left and with quarters up/bottom, but after that I cannot resize left and right dragging in the middle like in gnome.

For that I can use `Alt+F8` or `Alt+right mouse drag`

- https://askubuntu.com/questions/858488/increase-size-of-window-resize-drag-area

## No NaturalScrolling in the settings.

I needed to create xorg configuration file. Refer to `os/ubuntu/mouse/README.md`.

## Map capslock to escape

I have mapped caps lock to escape in gnome, but it does not work in mate.

## Firefox start page

Mate change my firefox start page to https://start.ubuntu-mate.org/ without my consent.
