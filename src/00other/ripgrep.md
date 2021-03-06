## install

`cargo install ripgrep --features 'pcre2'`

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

list of types `rg --type-list`

`rg -n -B 5 -A 5 -g "*.elm" "Store.State" src`

or

`rg -n -B 5 -A 5 -telm "Store.State" src`

for rust

`rg -trust someting`

https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#manual-filtering-file-types

## path separator

`rg --files -telm --path-separator //`

Works in cmd.exe, but not in git bash.

For git bash use `//` ot '\x2F'.

## find files

`rg --files -telm --path-separator //`

### On Windows reverse slashes

`rg --files -telm | tr '\\\\' '/' | xargs -n1 elm-format --yes`

or

`rg --files -telm --path-separator ! | tr '!' '/'` | xargs -n1 elm-format --yes`

- A path separator must be exactly one byte, but the given separator is 20 bytes https://github.com/BurntSushi/ripgrep/issues/957
- https://www.mhonarc.org/archive/html/procmail/2010-12/msg00019.html

## ignore case and smart case

```
-i/--ignore-case: When searching for a pattern, ignore case differences. That is rg -i fast matches fast, fASt, FAST, etc.
-S/--smart-case: This is similar to --ignore-case, but disables itself if the pattern contains any uppercase letters. Usually this flag is put into alias or a config file.
```

https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md

## regex spec

https://docs.rs/regex

## no negative lookahead, works in ag

```
ag 'foo(?!.*bar)'
```

This would find all rows with "foo", but not with "bar" somewhere after that on the same line.

You can satisfy this particular use case relatively easily with `rg foo | rg -v 'foo.*bar'`.

https://github.com/BurntSushi/ripgrep/issues/188

## filter out some extensions

`cat yoga.txt | rg -N -i -v '.*\.(jpe?g|torrent|pdf|epub|mobi|azw3|djv|md|lrf)$'`

## output entire line when matched word

`objdump -D hello_world | rg -A20 '^.*<main>:.*$'`

- https://superuser.com/questions/783622/how-to-make-grep-command-return-entire-matching-line/1610125#1610125

## only matched group

`rg -No "classes\.(\w+)" src/components/FilterSection/FilterSection.js --replace '$1' | sort | uniq`

- https://github.com/BurntSushi/ripgrep/issues/34#issuecomment-267309265
