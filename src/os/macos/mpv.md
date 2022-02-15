`brew install mpv`

or better

`brew cask install mpv` to have mpv in Applications

- https://mpv.io/installation/
- https://apple.stackexchange.com/questions/288689/installed-mpv-with-brew-but-nothing-in-applications
- https://github.com/mpv-player/mpv/issues/572#issuecomment-35679696

## txt subtitle no loaded

I have to use `mpv file.mp4 --sub-file file.txt`, and then press `j` in app to see subtitles.

Didn't help putting in `~/.config/mpv/mpv.conf`

```
sub-auto=fuzzy
subcp=cp1250
```

mpvs worked https://unix.stackexchange.com/questions/279884/play-subtitles-automatically-with-mpv

inna allows select subtitles with the gui https://lhc70000.github.io/iina/ or maybe https://www.smplayer.info/pl/mpv

- https://askubuntu.com/questions/901120/can-i-make-mpv-player-to-pick-up-any-subtitles-available-in-the-folder

## config

- https://gist.github.com/zanderzhng/c2735bea40eb5b5ced87
- https://github.com/Argon-/mpv-config/blob/master/mpv.conf

## default app

```bash
$ brew install mpv --with-bundle
```

If you need alias in Applications/Launchpad, open Finder window at /usr/local/Cellar/mpv/your_mpv_version/. In there the mpv.app bundle was generated. While holding Cmd+Alt drag this .app onto Applications folder.

Use duti to associate files with application:

```bash
$ brew install duti
$ duti -s io.mpv avi all
$ duti -s io.mpv mkv all
$ duti -s io.mpv mp4 all
$ duti -s io.mpv webm all
```

- https://github.com/mpv-player/mpv/wiki/FAQ#how-can-i-make-mpv-the-default-application-to-open-movie-files-on-osx
