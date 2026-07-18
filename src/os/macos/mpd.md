`brew install mpd mpv`

`cargo install rmpc --locked`

```
mkdir -p ~/music-mpd
# below needed?
touch ~/.config/mpd/database
mkdir -p ~/.config/mpd/playlists
# copy music files to ~/music-mpd
brew services start mpd
mpc add /
mpc play
rmpc
```
