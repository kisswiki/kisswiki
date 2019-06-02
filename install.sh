#!/bin/bash

ln -sf $PWD/src/bin/ ~/
ln -sf $PWD/src/dotfiles/.bashrc ~/
ln -sf $PWD/src/dotfiles/sync-history.sh ~/
ln -sf $PWD/src/dotfiles/.tmux.conf ~/
mkdir -p ~/.config/mpv/
ln -sf $PWD/src/dotfiles/.config/mpv/* ~/.config/mpv/
