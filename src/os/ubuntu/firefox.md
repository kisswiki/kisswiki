## Latest stable

Oficial is 1-2 days behind release, so it is ok. https://packages.ubuntu.com/disco/firefox

https://askubuntu.com/questions/945244/when-will-firefox-55-be-in-the-repos/976702#976702

There is also snap package https://snapcraft.io/firefox

You also just unpack archive with binaries from mozilla. It will update to later version day or two faster than ubuntu version, but you will not have `firefox.desktop` file needed for adding to gnome panel favourites.

You could also create `firefox.desktop` file like here:

- https://wiki.debian.org/Firefox
- https://bazaar.launchpad.net/~mozillateam/firefox/firefox-trunk.head/view/head:/debian/firefox.desktop.in
- using [gendesk](https://github.com/xyproto/gendesk) as described here https://wiki.archlinux.org/index.php/desktop_entries
- [Creating a Gnome Dock launcher and a terminal command for Firefox Nightly – Firefox Nightly News](https://blog.nightly.mozilla.org/2018/01/22/335/)

## Beta

```shell
sudo add-apt-repository ppa:mozillateam/firefox-next
sudo apt update
```

## Nigthly

```shell
sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
sudo apt update
sudo apt install firefox-trunk install firefox-trunk-locale-pl
```

later:

```
sudo apt update
sudo apt install --only-upgrade firefox-trunk firefox-trunk-locale-pl
```

http://www.ubuntu-pomoc.org/instalacja-firefox-nightly-z-repozytorium/

## tabs on title bar

https://addons.mozilla.org/pl/firefox/addon/hide-caption-titlebar-plus-sma/

## hardware acceleration

https://browserbench.org/MotionMark/ before enabling ha:

```
253.73
±13.59%
on a large screen (desktop)

Test Name      Score
Multiply        258.82     ±10.80%
Canvas Arcs     808.93      ±6.54%
Leaves          380.00      ±7.37%
Paths          2381.33      ±1.11%
Canvas Lines   3421.40      ±1.18%
Focus            18.58     ±21.16%
Images          234.77      ±4.38%
Design           16.71     ±48.55%
Suits            92.26      ±9.81%
```

After enabling `layers.acceleration.force-enabled` and restarting Firefox.

```
2.01
±246.54%
on a large screen (desktop)

Test Name      Score
Multiply          3.00    ±100.00%
Canvas Arcs       4.00    ±350.00%
Leaves            1.00    ±800.00%
Paths            11.00    ±163.64%
Canvas Lines      1.00   ±2400.00%
Focus             1.00      ±0.00%
Images            2.00    ±350.00%
Design            2.00     ±50.00%
Suits             1.00    ±100.00%
```

In `about:support`

```
Graphics
Features
Compositing	OpenGL
```

- https://www.reddit.com/r/firefox/comments/8hmnn7/firefox_gpu_acceleration_on_linux/
- https://ask.fedoraproject.org/en/question/125175/how-to-check-that-firefox-uses-hardware-gpu-acceleration/

## Cannot change default file manager

- https://unix.stackexchange.com/questions/146904/set-new-default-file-manager-for-firefox-in-archlinux
- https://askubuntu.com/questions/267514/open-containing-folder-in-firefox-does-not-use-my-default-file-manager/870830#870830
- https://bugzilla.mozilla.org/show_bug.cgi?id=266600
- https://bugzilla.mozilla.org/show_bug.cgi?id=1106916
- https://bugzilla.mozilla.org/show_bug.cgi?id=1285711
- https://bugzilla.opensuse.org/show_bug.cgi?id=904229

## Touchpad scrolling

To this day, FireFox on Linux still doesn't properly handle touchpad scrolling unless you set "MOZ_USE_XINPUT2=1" and disable the simulated "smooth scrolling" in its settings.

https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1277302-high-resolution-scrolling-on-linux-progressing-apple-magic-mouse-support-in-linux-5-15?p=1277304#post1277304

Firefox has an option called "Use smooth scrolling" that is a bit misleading. It does not give you pixel-precision scrolling. Rather, it glides between jumps of several lines at a time. That should just be turned off if you set "MOZ_USE_XINPUT2=1".

In Wayland, rather than set "MOZ_USE_XINPUT2=1" to get smooth scrolling, I have to set "MOZ_ENABLE_WAYLAND=1". Maybe some distros set those values by default. I would hope so.

https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1277302-high-resolution-scrolling-on-linux-progressing-apple-magic-mouse-support-in-linux-5-15?p=1277402#post1277402

Nice to see work getting put into this area again. Ive historically always wound up using the [mtrack XOrg driver](https://github.com/p2rkw/xf86-input-mtrack) on all modern laptops

https://www.phoronix.com/forums/forum/phoronix/latest-phoronix-articles/1277302-high-resolution-scrolling-on-linux-progressing-apple-magic-mouse-support-in-linux-5-15?p=1277410#post1277410

For anyone else that comes across this Solaar has an option to [reissue the settings on wake-up](https://github.com/pwr-Solaar/Solaar/issues/443), but it need to be passed as a flag when starting solaar.

https://bugzilla.redhat.com/show_bug.cgi?id=1701322#c20
