- https://wiki.archlinux.org/index.php/Desktop_entries
- https://askubuntu.com/questions/722179/icon-path-in-desktop-file
- https://askubuntu.com/questions/375975/how-to-force-unity-reload-local-share-applications
- https://developer.gnome.org/integration-guide/stable/desktop-files.html.en
- https://linuxconfig.org/how-to-install-popcorn-time-movie-player-on-ubuntu-18-04-bionic-beaver-linux

## File in `Exec` entry need to have executable pemissions

Like `chmod +x file`.

## Subtitle Edit

I have extracted ico from exe:

`wrestool -x -t 14 SubtitleEdit.exe > icon.ico`.

- https://stackoverflow.com/questions/36808585/extracting-exe-icons-in-ubuntu-linux

Then with Gimp I have remove all layers except the best quality one and have exported as png.

I have created desktop file and validated it:

`desktop-file-validate src/00other/subtitleedit.desktop`

then installed it:

`desktop-file-install --dir=$HOME/.local/share/applications src/os/ubuntu/desktop_files/subtitleedit.desktop`

For valid categories I have gone this path:

- https://developer.gnome.org/desktop-entry-spec/
- https://www.freedesktop.org/wiki/Specifications/menu-spec/
- https://specifications.freedesktop.org/menu-spec/1.0/apa.html
- also this https://developer.gnome.org/integration-guide/stable/desktop-files.html.en

For exe file run with mono, I needed to prefix it with `mono`:

`Exec=mono /home/roman/bin/subtitleedit/SubtitleEdit.exe %F`

But I can do it like this:

`chmod +x SubtitleEdit.exe`

And then use:

`Exec=/home/roman/bin/subtitleedit/SubtitleEdit.exe %F`

- Generator for desktop files - looks good but creates entry with `Terminal=False` instead of `Terminal=False` https://tools.nasqueron.org/generators/GNOME/desktop-file

## poprcorn time

```bash
desktop-file-install --dir=$HOME/.local/share/applications src/os/ubuntu/desktop_files/poprcorntime.desktop
```

- https://linuxconfig.org/how-to-install-popcorn-time-movie-player-on-ubuntu-18-04-bionic-beaver-linux
