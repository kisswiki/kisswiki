## match crlf

`rg '\r$'` http://stackoverflow.com/questions/73833/how-do-you-search-for-files-containing-dos-line-endings-crlf-with-grep-on-linu/74739#74739

## autocomplete

1. Download musl release from https://github.com/BurntSushi/ripgrep/releases.
2. Extract `rg.bash-completion` to `~/`.
3. In `~/.bash_profile`: `source ~/rg.bash-completion`

https://github.com/BurntSushi/ripgrep/issues/262#issuecomment-264364685

## search `--`

`rg -- --`

## exclude

`rg -g '!yarn.lock' -g '!package.json' babel`

## file type

`rg -n -B 5 -A 5 -g "*.elm" "Store.State" src`

or

`rg -n -B 5 -A 5 -telm "Store.State" src`

https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#manual-filtering-file-types

## path separator

`rg --files -telm --path-separator /`

Works in cmd.exe, but not in git bash.

## find files

`rg --files -telm --path-separator /`

### On Windows reverse slashes

`rg --files -telm | tr '\\\\' '/' | xargs -n1 elm-format --yes`

or

`rg --files -telm --path-separator ! | tr '!' '/'` | xargs -n1 elm-format --yes`

- A path separator must be exactly one byte, but the given separator is 20 bytes https://github.com/BurntSushi/ripgrep/issues/957
- https://www.mhonarc.org/archive/html/procmail/2010-12/msg00019.html