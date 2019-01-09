## Latest stable

https://askubuntu.com/questions/945244/when-will-firefox-55-be-in-the-repos

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
