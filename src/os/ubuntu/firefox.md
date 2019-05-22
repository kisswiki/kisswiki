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
