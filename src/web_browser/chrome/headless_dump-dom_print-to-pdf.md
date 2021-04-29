## flagi

opcjonalnie możnaby też dodać `--disable-extension` lub `--enable-logging`

- https://superuser.com/questions/545033/google-chrome-command-line-switches
- https://chromium.googlesource.com/chromium/src/+/master/chrome/common/chrome_switches.cc

## dump-dom

Works in cmd.exe but not in git bash:

```
start chrome --headless --enable-logging --disable-gpu --dump-dom "https://www.dwutygodnik.com/artykul/8162-podsumowanie-roku.html"
```

https://stackoverflow.com/questions/57000400/why-doesnt-chromium-headless-dump-the-dom-when-i-tell-it-to/57594816#57594816

## print-to-pdf

```
start chrome --enable-logging --headless --disable-gpu --print-to-pdf=c:\misc\output.pdf https://www.google.com/
```

https://stackoverflow.com/questions/45364102/how-do-i-use-headless-chrome-in-chrome-60-on-windows-10/50318211#50318211

To save pdf you need full path, so to use relative:

w cmd.exe:

```
start chrome --enable-logging --headless --disable-gpu --print-to-pdf=%cd%\output.pdf https://www.google.com/
```

w git bash

```
start chrome --enable-logging --headless --disable-gpu --print-to-pdf=`pwd`/output.pdf https://www.google.com/
```

Otwarcie pliku:

cmd.exe:

`start .\output.pdf`

git bash

`start ./output.pdf`

linux

`xdg-open ./output.pdf`
