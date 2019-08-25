- https://remysharp.com/2018/08/23/cli-improved
- https://medium.com/@sidneyliebrand/how-fzf-and-ripgrep-improved-my-workflow-61c7ca212861
- [Navigating a filesystem quickly with fzf and fd](https://mike.place/2017/fzf-fd/)
- https://darrenburns.net/posts/tools/
  - z > cd https://github.com/rupa/z
  - https://github.com/wting/autojump
- Rust CLI Working Group https://fosstodon.org/@clirust
- https://news.ycombinator.com/item?id=15429390
- https://github.com/knqyf263/pet
- https://github.com/topics/terminal
- https://serverfault.com/questions/3743/what-useful-things-can-one-add-to-ones-bashrc
- https://altbox.dev/
- https://www.reddit.com/r/linuxquestions/comments/btsl09/what_are_your_favorite_cli_applications/

## bat > cat

highlighting, paging, line numbers and git integration https://github.com/sharkdp/bat

## prettyping > ping

nicer visuals, graph `alias ping='prettyping --nolegend'` https://github.com/denilsonsa/prettyping

## rg > find, ack, ag

- https://github.com/BurntSushi/ripgrep
- filter stuff like logs, process stats, find files, because unlike grep, you can type as you think and look through the current results https://github.com/peco/peco
- https://sift-tool.org/

## fzf > ctrl+r

fuzzy search against the terminal history, with a fully interactive preview of the possible matches, preview and open files https://github.com/junegunn/fzf

Example usage

```bash
$ fzf
> var .sh$ !priv
```

exact match:

```
> 'news
```

Will containing news letters one by one. https://github.com/junegunn/fzf/issues/1265

### Install

```bash
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$ ~/.fzf/install
$ . ~/.bashrc
$ vim <Ctrl-t>
```

For Windows set env `FZF_DEFAULT_COMMAND` to `rg --files . 2> nul` https://github.com/junegunn/fzf/wiki/Windows

### Keys

`CTRL-T` to add paths to a command

You can then use fzf to select the destination directory (as long as it’s somewhere in your home directory). Once you’ve selected it you can hit return to add it to the command line you’re working on, and then hit return again to execute the command.

`ALT-C` to change directory

If you hit `ALT-C` then you can use fzf to change to any directory in your home directory.

That’s because FZF_ALT_C_COMMAND="fd -t d . $HOME" generates a list of directories below home.

`CTRL-R` to search the history

`CTRL-R` pipes your history to fzf, allowing you to find and rerun complicated commands with fzf.

`kill -9 <tab>` - list processes

`cd **<tab>`

`cd some/dir/**<tab>`

`ssh **<tab>`

### vscode

alias which combines fzf with bat for the preview and a custom key binding to open VS Code:

```
$ alias preview="fzf --preview 'bat --color \"always\" {}'"
# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
```

### Make your own autocompletion with fzf

- https://media.yuis-programming.com/make-more-powerful-bash-command-line-with-fzf/
- [Examples (completion) · junegunn/fzf Wiki](https://github.com/junegunn/fzf/wiki/Examples-(completion%29)

### Links

- https://medium.freecodecamp.org/fzf-a-command-line-fuzzy-finder-missing-demo-a7de312403ff
- kubernetes configs example https://sysadvent.blogspot.com/2017/12/day-18-awesome-command-line-fuzzy.html
- http://seenaburns.com/vim-setup-for-rust/
- https://dev.to/matthewbdaly/improving-search-in-vim-and-neovim-with-fzf-and-ripgrep-579j
- https://www.reddit.com/r/linux/comments/5rrpyy/turbo_charge_bash_with_fzf_ripgrep/
- wrapper for Windows https://github.com/genotrance/ff
- https://adamheins.com/blog/fzf-vi-mode-and-fixing-delays
- with ripgrep, bat and preview https://stackoverflow.com/questions/55186799/multi-process-bash-within-fzf-preview-feature
- !!! https://www.reddit.com/r/vim/comments/9xpb18/file_preview_with_fzf_rg_bat_and_devicons/
- https://www.reddit.com/r/vim/comments/7axmsb/i_cant_believe_how_good_fzf_is/
- mutliselect and spaces https://www.reddit.com/r/linuxquestions/comments/aorbec/problem_with_fzf_multiselect_for_files_with/
- https://pnguyen.io/posts/improve-productivity-with-fzf/
- https://github.com/junegunn/fzf/wiki/Examples

### Alternatives

Theres is also skim in Rust:

- https://github.com/lotabout/skim
- https://users.rust-lang.org/t/skim-a-fuzzy-finder-written-in-rust/6390
- https://github.com/jhawthorn/fzy
- https://github.com/nixprime/cpsm
- https://github.com/FelikZ/ctrlp-py-matcher
- https://github.com/Yggdroot/LeaderF

### vim and emacs

in ~/.bashrc:

`bind -x '"\C-p": $EDITOR $(fzf);'`

Now you can press `Ctrl-p` to search for file and edit it.

- https://www.reddit.com/r/linux/comments/5rrpyy/turbo_charge_bash_with_fzf_ripgrep/
- http://ericnode.info/post/fzf_jump_to_tab_in_vim/
- https://stackoverflow.com/questions/46438519/how-to-enable-per-command-history-in-fzf
- http://seenaburns.com/2018/03/06/emacs-fzf/
- https://github.com/alok/notational-fzf-vim

### git

`git branch | fzf | xargs git checkout`

- https://www.reddit.com/r/emacs/comments/3loko4/fzfel_emacs_frontend_for_fzf/cv9ii4n/
- https://github.com/junegunn/fzf/wiki/examples#git
- https://stackoverflow.com/questions/36513310/how-to-get-a-gits-branch-with-fuzzy-finder

## htop > top

top is my goto tool for quickly diagnosing why the CPU on the machine is running hard or my fan is whirring. I also use these tools in production. Annoyingly (to me!) top on the Mac is vastly different (and inferior IMHO) to top on linux.

However, htop is an improvement on both regular top and crappy-mac top. Lots of colour coding, keyboard bindings and different views which have helped me in the past to understand which processes belong to which.

Handy key bindings include:

- P - sort by CPU
- M - sort by memory usage
- F4 - filter processes by string (to narrow to just "node" for instance)
- space - mark a single process so I can watch if the process is spiking

### Alternatives

- https://github.com/nicolargo/glances
- https://github.com/cjbassi/gotop
- https://github.com/MrRio/vtop
- https://github.com/aksakalli/gtop

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
- https://github.com/bootandy/dust
- https://github.com/vmchale/tin-summer

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

### Shortcut top open file

`NCDU_SHELL=mc ncdu`

`NCDU_SHELL="mpv *" ncdu`

or better

`NCDU_SHELL="mpv_playstlist.sh` from https://github.com/rofrol/dotfiles/blob/master/bin/mpv_playlist.sh

Add alias ~/.bashrc

`alias ncdumc='NCDU_SHELL="mpv *" ncdu'`

To quit mc inside ncdu, I need to press `Shift+Alt+0` instead of just `Alt+0`.

- https://code.blicky.net/yorhel/ncdu/issues/90

## dua

`cargo install dua-cli`

`dua i /some/dir`

`?` help

`Shift+o` to open file

`d` or `space` to select/deselect`

`Ctrl+r` to remove selected

`q` or `Ctrl-c` to quit

- https://www.reddit.com/r/commandline/comments/c10f73/dua_interactive_du_written_in_rust/
- https://github.com/Byron/dua-cli

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
  - with this font https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono.ttf

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

### standard input is not a TTY

`find . -name "php.ini" | xargs -o vim`

https://unix.stackexchange.com/questions/44426/xargs-and-vi-input-is-not-from-a-terminal

`find -name '*.c' | xargs sh -c 'emacs "$@" < /dev/tty' emacs`

https://mdk.fr/blog/emacs-standard-input-is-not-a-tty.html

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

### Alternatives

- https://github.com/lotabout/rargs

## file

### mime-type

`file --mime-type -b Downloads/main.js`

https://davidwalsh.name/get-mime-type

## htmlq - like jq for html

```bash
$ cargo install hmltq
$ htmlq -p "#itemsStream > li .diggbox span:first-of-type" < out.html
$ htmlq -p "#itemsStream > li:first-of-type h2 a" --attribute title < out.html
```

- in Rust https://github.com/mgdm/htmlq
- in Rust https://github.com/andreastt/htmlgrep
- Inspired by jq, pup aims to be a fast and flexible way of exploring HTML from the terminal https://github.com/ericchiang/pup

## httpie > curl ?

- https://github.com/jakubroztocil/httpie
- https://gitlab.com/rakenodiax/rust-client

## tldr > man ?

- https://github.com/tldr-pages/tldr
- https://github.com/chubin/cheat.sh

## wrk > ?

- https://github.com/Gymmasssorla/finshir
  - Finshir is a stress-tester which is trying to fill a whole thread pool of a web server, opening tens of thousands TCP-based connections simultaneously. The main feature is that it is protocol-agnostic, which means that you can test both raw TCP, HTTP, HTTPS and other protocols with ease. It is also coroutines-driven for performance reasons. https://www.reddit.com/r/rust/comments/bqyaok/finshir_v022_was_released_any_suggestions_to_low/

## prompt

- prompt in Rust https://crates.io/crates/pista
  - https://www.reddit.com/r/rust/comments/brdu7v/oc_pista_a_simple_bash_prompt_for_programmers/

## midnight command mc

### Alternatives

- https://github.com/jarun/nnn
- https://github.com/ranger/ranger

## Manage dotfiles

- https://github.com/jan-warchol/dotfiles
- https://news.ycombinator.com/item?id=11515222
- https://github.com/tubbo/homer
- https://protesilaos.com/codelog/gnu-stow-dotfiles/

## ngrok

- https://ngrok.com/
- https://localtunnel.me
- http://serveo.net/
  - `ssh -R 80:localhost:3000 serveo.net`
  - target doesn't have to be on localhost `ssh -R 80:example.com:80 serveo.net`
  - request particular domain `ssh -R incubo.serveo.net:80:localhost:8888 serveo.net`

## tig


- https://github.com/rgburke/grv
- https://github.com/jonas/tig

## accounting

- https://plaintextaccounting.org/#plain-text-accounting-tools

## Misc

- xsv: for working with csv https://github.com/BurntSushi/xsv
- Execute SQL against structured text like CSV or TSV https://github.com/dinedal/textql
- make alternative https://github.com/casey/just
- Run arbitrary commands when files change http://entrproject.org/
- [keenerd/gz-sort: A utility for sorting really big files. http://kmkeen.com/gz-sort/](https://github.com/keenerd/gz-sort/)
- https://github.com/vrothberg/vgrep
- https://github.com/jakubroztocil/httpie
- explore json, pretty print https://stedolan.github.io/jq/
- https://joeyh.name/code/moreutils/
- facebook's fpp https://asciinema.org/a/19519
- like `7z x` or `tar -x` and more https://github.com/jwiegley/una
- pv, qalc and many more https://www.reddit.com/r/linux/comments/b5n1l5/whats_your_favorite_cli_tool_nobody_knows_about/
  - https://joeyh.name/code/moreutils/
- speedometer, example usage https://github.com/dustinkirkland/hollywood/blob/e75c619546d31dc9fc66c472c9d06da647ed1174/lib/hollywood/speedometer
- https://01.org/powertop/
- [yudai/gotty: Share your terminal as a web application](https://github.com/yudai/gotty)
- https://github.com/nvbn/thefuck
  - https://twitter.com/liamosaur/status/506975850596536320
- https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/bgnotify
- serve some files over HTTP https://github.com/svenstaro/miniserve
  - currently on nightly only so: `rustup toolchain install nightly; rustup default nigthly; cargo install minserve; rustup default stable`
