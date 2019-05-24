- https://remysharp.com/2018/08/23/cli-improved
- https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
- [Navigating a filesystem quickly with fzf and fd](https://mike.place/2017/fzf-fd/)
- https://darrenburns.net/posts/tools/
  - z > cd https://github.com/rupa/z
  - https://github.com/wting/autojump
- Rust CLI Working Group https://fosstodon.org/@clirust
- https://news.ycombinator.com/item?id=15429390
- https://github.com/knqyf263/pet

## bat > cat

highlighting, paging, line numbers and git integration https://github.com/sharkdp/bat

## prettyping > ping

nicer visuals, graph `alias ping='prettyping --nolegend'` https://github.com/denilsonsa/prettyping

## rg > find, ack, ag

- https://github.com/BurntSushi/ripgrep
- filter stuff like logs, process stats, find files, because unlike grep, you can type as you think and look through the current results https://github.com/peco/peco

## fzf > ctrl+r

fuzzy search against the terminal history, with a fully interactive preview of the possible matches, preview and open files https://github.com/junegunn/fzf

alias which combines fzf with bat for the preview and a custom key binding to open VS Code:

```
$ alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
```

- https://medium.freecodecamp.org/fzf-a-command-line-fuzzy-finder-missing-demo-a7de312403ff
- http://seenaburns.com/vim-setup-for-rust/
- https://dev.to/matthewbdaly/improving-search-in-vim-and-neovim-with-fzf-and-ripgrep-579j

Theres is also skim in Rust:

- https://github.com/lotabout/skim
- https://users.rust-lang.org/t/skim-a-fuzzy-finder-written-in-rust/6390

## htop > top

top is my goto tool for quickly diagnosing why the CPU on the machine is running hard or my fan is whirring. I also use these tools in production. Annoyingly (to me!) top on the Mac is vastly different (and inferior IMHO) to top on linux.

However, htop is an improvement on both regular top and crappy-mac top. Lots of colour coding, keyboard bindings and different views which have helped me in the past to understand which processes belong to which.

Handy key bindings include:

- P - sort by CPU
- M - sort by memory usage
- F4 - filter processes by string (to narrow to just "node" for instance)
- space - mark a single process so I can watch if the process is spiking

## diff-so-fancy > diff

Then in my ~/.gitconfig I have included the following entry to enable diff-so-fancy on git diff and git show:

```
[pager]
       diff = diff-so-fancy | less --tabs=1,5 -RFX
       show = diff-so-fancy | less --tabs=1,5 -RFX
```

## fd > find

It’ll respect your .gitignore files, and it supports parallel command execution, which lets you execute a terminal command (in parallel) for every file or directory returned for a search.

https://github.com/sharkdp/fd/

```
$ fd cli # all filenames containing "cli"
$ fd -e md # all with .md extension
$ fd cli -x wc -w # find "cli" and run `wc -w` on each file
$ fd -e jpg -x convert {} {.}.png # find all .jpg files and convert them to .png files in parallel using the Unix convert command
```

### find

derriz

I'm curious why you (or anyone) uses -exec? It's often painfully slower than piping through xargs and I find the syntax (the semicolon and braces and the required quoting/escaping) uncomfortable. I haven't used -exec in 20 years.

ekns

It's not even slower (and it's safe beyond the argv limit) if you use "+" instead of the semicolon.

`find -type f -exec sed -i s/foo/bar/ {} +`

This only invokes the command twice for 100k files (assuming we can pass in 64k arguments to sed).

https://news.ycombinator.com/item?id=15429675

`alias fd="function _fd(){find . -iregex '.*'$1'.*'};_fd"`

https://news.ycombinator.com/item?id=15429960

## ncdu > du

- https://dev.yorhel.nl/ncdu
- https://github.com/jarun/nnn

`ncdu`

Same file system

`ncdu -x /`

`man ncdu`

### Keys

Enter   go into directory

Backspace   go back

n   Order by filename (press again for descending order)

s   Order by filesize (press again for descending order)

d   Delete the selected file or directory. An error message will be shown when the contents of the directory do not match or do not exist anymore on the
           filesystem.

r   Refresh/recalculate the current director

b   Spawn shell in current directory

q   Quit

## Shortcut top open file

`NCDU_SHELL=mc ncdu`

`NCDU_SHELL="mpv *" ncdu`

Add alias ~/.bashrc

`alias ncdumc='NCDU_SHELL="mpv *" ncdu'`

- https://code.blicky.net/yorhel/ncdu/issues/90

## du

Quick overview file systems. Make an alias:

`alias dfo='df -x squashfs -x tmpfs -x devtmpfs -BM -H -T'`

## watch

With interval 2 seconds

`watch -n 2 df`

### alias

`alias watch='watch '`

use:

`watch dfo`

https://unix.stackexchange.com/questions/25327/watch-command-alias-expansion

## bench > time

https://github.com/Gabriel439/bench

## exa > ls

- https://github.com/ogham/exa
- https://github.com/Peltoche/lsd

## tldr > man

- http://tldr-pages.github.io/

## noti > display notification

Monitor a process and trigger a notification.

Never sit and wait for some long-running process to finish. Noti can alert you when it's done. You can receive messages on your computer or phone.

https://github.com/variadico/noti

## tokei > cloc

much faster, but sometimes can have problems while cloc does not.

https://github.com/XAMPPRocky/tokei

## xargs

`fd -0 '\.log$' | xargs -0 tail`

### find and xargs, parallel and problems with stdin

The stdin issue can also be worked around with GNU xargs with the -a option with shells supporting process substitution:

`xargs -r0n 20 -P 4 -a <(find . -print0) something`

https://unix.stackexchange.com/questions/321697/why-is-looping-over-finds-output-bad-practice

### limits

Some versions of xargs don't respect the shell's max argument length, so on older platforms (MacOS X 10.4 sticks out in my memory) it's easy to cause xargs to try invoking with a longer command line than permitted.

This is fixed with the `-n` argument to xargs, which lets you specify the number of arguments per invocation.

they can be as low as 4096 bytes:

```bash
$ xargs --show-limits
Your environment variables take up 3568 bytes
POSIX upper limit on argument length (this system): 2091536
POSIX smallest allowable upper limit on argument length (all systems): 4096
Maximum length of command we could actually use: 2087968
Size of command buffer we are actually using: 131072
Maximum parallelism (--max-procs must be no greater): 2147483647
```

## file

### mime-type

`file --mime-type -b Downloads/main.js`

https://davidwalsh.name/get-mime-type

## Misc

- xsv: for working with csv https://github.com/BurntSushi/xsv
- make alternative https://github.com/casey/just
- Run arbitrary commands when files change http://entrproject.org/
- [keenerd/gz-sort: A utility for sorting really big files. http://kmkeen.com/gz-sort/](https://github.com/keenerd/gz-sort/)
- https://github.com/vrothberg/vgrep
- https://github.com/jakubroztocil/httpie
- explore json, pretty print https://stedolan.github.io/jq/
- Inspired by jq, pup aims to be a fast and flexible way of exploring HTML from the terminal https://github.com/ericchiang/pup
- https://joeyh.name/code/moreutils/
- facebook's fpp https://asciinema.org/a/19519
- like `7z x` or `tar -x` and more https://github.com/jwiegley/una
