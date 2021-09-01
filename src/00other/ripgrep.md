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

Or better add to config. In `~/.bashrc`:

```
export RIPGREP_CONFIG_PATH=~/.config/ripgrep/ripgreprc
```

in `~/.config/ripgrep/ripgreprc`:

```
--path-separator=/
```

- https://github.com/BurntSushi/ripgrep/issues/1373#issuecomment-548587320
- https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#configuration-file
- Example of config files https://github.com/search?q=filename%3A.ripgreprc&type=code
- A path separator must be exactly one byte, but the given separator is 20 bytes https://github.com/BurntSushi/ripgrep/issues/957

## find files

`rg --files -telm`

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

## only content

```
$ rg "\('Sign up.*" -NoI | sort | uniq
('Sign up', 'Joined as anonymous', null);
('Sign up', 'Signed up', 'email');
('Sign up', 'Signed up', param);
('Sign up', 'View', 'popup-modal');
('Sign up', 'View', 'user-menu');
```

- https://github.com/BurntSushi/ripgrep/commit/5490d9e8069778321a40ed2874a160d66c1d5df3

## get parent dir and file name

Only `ts` extension and exclude `spec.ts` extension.

```bash
~/projects/codecharm/magma $ rg receiveEmails -l -tts -g '!*.spec.ts' | xargs -d '\n' -I {} sh -c 'echo $(basename $(dirname {}))/$(basename {})' | sort | uniq
common/interfaces.ts
common/user.ts
modals/settings-form.ts
modals/user-settings.ts
server/clientHelpers.ts
server/db.ts
server/serverActions.ts
server/serverInterfaces.ts
services/accountService.ts
```

- https://www.cyberciti.biz/faq/bash-get-filename-from-given-path-on-linux-or-unix/
- https://stackoverflow.com/questions/19204531/-an-xargs-default-delimiter-be-changed/19773922#19773922
- https://stackoverflow.com/questions/3294072/-et-last-dirname-filename-in-a-file-path-argument-in-bash/3294102#3294102
- https://superuser.com/questions/538877/get-the-parent-directory-for-a-file/538889#538889
- https://unix.stackexchange.com/questions/65212/why-doesnt-this-xargs-command-work

## backreference

Its syntax is similar to Perl-style regular expressions, but lacks a few features like look around and backreferences.

Note that this isn't an unfettered win, it's a trade off. For example:

```bash
$ cat foo
c
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
c
$ ag '(a*)*c' foo
1:c
$ rg '(a*)*c' foo
1:c
3:c
```

The Silver Searcher completely drops the second match because it's using a backtracking regex engine, which is required for supporting arbitrary lookaround.

This would find all rows with "foo", but not with "bar" somewhere after that on the same line.

You can satisfy this particular use case relatively easily with `rg foo | rg -v 'foo.*bar'`.

- https://github.com/BurntSushi/ripgrep/issues/188
- https://github.com/BurntSushi/ripgrep/issues/644
- https://docs.rs/regex/1.5.4/regex/
