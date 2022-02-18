`brew install mpv`

or better

`brew cask install mpv` to have mpv in Applications

- https://mpv.io/installation/
- https://apple.stackexchange.com/questions/288689/installed-mpv-with-brew-but-nothing-in-applications
- https://github.com/mpv-player/mpv/issues/572#issuecomment-35679696

## Power usage

quicktime uses 5%, mpv uses 40% when looking at battery widget fro stats app.

iina-plus from https://github.com/iina-plus/iina/releases uses 20% in foreground, 10% in background.

https://www.reddit.com/r/MacOS/comments/s2vtue/finally_found_the_best_media_player/

iina-plus supports hdr.

- https://www.reddit.com/r/MacOS/comments/s2vtue/comment/hsjgjik/
  - https://www.youtube.com/watch?v=74SZXCQb44s

## Native m1

BasedKips

Any benefits to this over the brew install (If you aren't modding the code)?

rpchill

Yes! There's a couple, but it depends on your use case. The big one is having a native M1 / ARM "mpv.app" bundle.

The Homebrew cask currently sources "mpv.app" from someone only doing Intel builds. On an M1 Mac, those have to run using Rosetta 2 to translate all of the x86-64 instructions into ARM64 instructions. Rosetta 2 is extremely impressive, but it's still less efficient than just running a native ARM64 binary. You're guaranteed better performance.

The Homebrew formula does produce ARM64 binaries, but there's no "mpv.app" bundle, making it effectively command-line only.

mpv version numbering is arbitrary, but Homebrew still has to wait for it to increment. Building it yourself from the latest source lets you use the absolute most recent version of mpv.

https://www.reddit.com/r/mpv/comments/qt41pl/comment/hx5tihi/

Binary downloaded from https://laboratory.stolendata.net/~djinn/mpv_osx/ also shows as Intel and not Apple in Activity Monitor.

- https://github.com/mpv-player/mpv/issues/9232#issuecomment-925922864
  - Requires XCode >= 13.1 https://github.com/mpv-player/mpv/issues/9232#issuecomment-952063467
  - https://www.reddit.com/r/mpv/comments/qt41pl/how_to_build_mpv_for_m1_macs_arm64/hkjjdi4/

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
