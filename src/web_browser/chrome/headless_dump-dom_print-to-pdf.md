## flagi

Maybe `--disable-extension`?

- https://peter.sh/experiments/chromium-command-line-switches/
- https://chromium.googlesource.com/chromium/src/+/master/chrome/common/chrome_switches.cc
- https://superuser.com/questions/545033/google-chrome-command-line-switches
- https://stackoverflow.com/questions/21136212/what-are-the-chrome-command-line-switches-parameters

## dump-dom

Add --enable-logging to get --dump-dom to work.

Works in cmd.exe but not in git bash:

```
start chrome --headless --enable-logging --disable-gpu --dump-dom "https://www.dwutygodnik.com/artykul/8162-podsumowanie-roku.html"
```

-https://stackoverflow.com/questions/57000400/why-doesnt-chromium-headless-dump-the-dom-when-i-tell-it-to/57594816#57594816

- https://www.reddit.com/r/chrome/comments/7aak83/headless_browsing_chrome_cli_on_windows_not/dp8xyvo/?utm_source=reddit&utm_medium=web2x&context=3

## print-to-pdf

'--run-all-compositor-stages-before-draw' : It Prevents the Pdf Creation Before all the data is rendered(After all data is rendered the pdf will be created).

'--virtual-time-budget = x: It Delays the Process of creation of Pdf, here x will be the miliseconds.

```
start chrome --enable-logging --headless --disable-gpu --print-to-pdf=c:\misc\output.pdf https://www.google.com/
```

Used in real project:

```
google-chrome --virtual-time-budget=1000000 --headless --disable-gpu --run-all-compositor-stages-before-draw --print-to-pdf=file1.pdf http://example.com/
```

- https://stackoverflow.com/questions/45364102/how-do-i-use-headless-chrome-in-chrome-60-on-windows-10/50318211#50318211
- https://stackoverflow.com/questions/46077392/additional-options-in-chrome-headless-print-to-pdf

### To save pdf you need full path, so to use relative:

w cmd.exe:

```
start chrome --enable-logging --headless --disable-gpu --print-to-pdf=%cd%\output.pdf https://www.google.com/
```

w git bash

```
start chrome --enable-logging --headless --disable-gpu --print-to-pdf=`pwd`/output.pdf https://www.google.com/
```

- https://stackoverflow.com/questions/607670/windows-shell-command-to-get-the-full-path-to-the-current-directory
- https://stackoverflow.com/questions/54707524/headless-chrome-not-working-in-windows-10/67313565#67313565
- https://stackoverflow.com/questions/47789685/windows-10-chrome-headless-not-doing-anything/67313985#67313985

## Open file

cmd.exe:

`start .\output.pdf`

git bash

`start ./output.pdf`

linux

`xdg-open ./output.pdf`

- https://www.quora.com/What-is-the-equivalent-of-xdg-open-on-Windows

## Links

- https://chromium.googlesource.com/chromium/src/+/lkgr/headless/README.md
- https://developers.google.com/web/updates/2017/04/headless-chrome
- `--virtual-time-budget=10000` https://stackoverflow.com/questions/53526799/how-to-delay-capture-of-dom-using-chrome-headless-mode
- https://stackoverflow.com/questions/44397492/detect-chrome-running-in-headless-mode-from-javascript
