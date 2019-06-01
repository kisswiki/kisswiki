# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Load nvm on demand
# to load run `nvm`
# https://gist.github.com/Janiczek/b31aa1f535c2a56098b8d191da1d7d45
# https://twitter.com/janiczek/status/1088950522856521728
nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
}

node() {
    unset -f node
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    node "$@"
}

npm() {
    unset -f npm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    npm "$@"
}

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias cdp="cd ~/projects/globalwebindex/pro-next/"
alias cdk="cd ~/personal_projects/kisswiki"

#export EDITOR=nvim
export EDITOR=em

export PATH=~/local/bin/:$PATH

alias nvim='~/bin/nvim.appimage'


# [CTRL-R shows me the list of files instead of history · Issue #1594 · junegunn/fzf](https://github.com/junegunn/fzf/issues/1594)
# using https://github.com/dvorka/hstr instead
# I need to comment bind of CTRL-R in file ~/.fzf/shell/key-bindings.bash
# https://github.com/4z3/fzf-plugins
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

history() {
  if [ -t 1 ]; then
    # to terminal: print numbers and timestamps
    builtin history "$@"
  else
    # grepping: only command
    HISTTIMEFORMAT='' builtin history "$@" | awk '{$1="";print substr($0,2)}'
  fi
}

#alias em moved to ~/bin/em because I could not use it with fzf and xargs

##!/bin/bash
#TERM=xterm-24bit emacs -nw "$@"

#alias em='TERM=xterm-24bit emacs -nw'
#alias emi='em $(fzf)'

#https://gist.github.com/mb720/86144b670599c0eab331cd2f48bd23b9
# https://www.reddit.com/r/linux/comments/5rrpyy/turbo_charge_bash_with_fzf_ripgrep/
function  edi(){
  local file=$(fd --exclude node_modules | fzf --reverse)
  # Open the file if it exists
  if [ -n "$file" ]; then
      # keep it in history
      history -s ${EDITOR:-vim} "$file"
      # Use the default editor if it's defined, otherwise Vim
      ${EDITOR:-vim} "$file"
  fi
}
bind -x '"\C-y": edi;'

alias gitc='git branch | fzf | xargs git checkout'

# https://sysadvent.blogspot.com/2017/12/day-18-awesome-command-line-fuzzy.html
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always %'" \
             --bind "enter:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

export PATH=~/.cabal/bin:$PATH

# function  mans(){
# man -k . | fzf -n1,2 --preview "echo {} | cut -d' ' -f1 | sed 's# (#.#' | sed 's#)##' | xargs -I% man %" --bind "enter:execute: (echo {} | cut -d' ' -f1 | sed 's# (#.#' | sed 's#)##' | xargs -I% man % | less -R)"
# }

function  mans(){
man -k . | fzf -n1,2 --preview "echo {} | cut -d' ' -f1 | sed 's# (#.#' | sed 's#)##' | xargs -I% man %" --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,enter:execute: (echo {} | cut -d' ' -f1 | sed 's# (#.#' | sed 's#)##' | xargs -I% man % | less -R)"
}


# https://gist.github.com/junegunn/f4fca918e937e6bf5bad#gistcomment-2731105
gitg ()
{
  git log --graph --remotes --tags --decorate --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"  | \
   fzf --ansi --no-sort --reverse --tiebreak=index --preview \
   'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1 ; }; f {}' \
   --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF" --preview-window=right:60%
}

alias updnvim="(cd ~/bin && rm nvim.appimage && curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage && chmod +x nvim.appimage)"

export PATH="~/bin/julia/bin:$PATH"

# do not set TERM manually - let the terminal do it.
# https://wiki.archlinux.org/index.php/Home_and_End_keys_not_working
# https://stackoverflow.com/questions/18600188/home-end-keys-do-not-work-in-tmux/27467524#27467524
#export TERM=xterm-256color

export PATH="~/personal_projects/stmux:$PATH"

alias webstorm="nvm; webstorm"
alias m='cd ~/projects/mapdid/monorepo; stmux'
alias ds='spotdl --song "$@"'
alias dy='youtube-dl --extract-audio --audio-format mp3 -f bestaudio "$@"'
alias elm-an="elm-analyse | tee $HOME/elm-analyse.txt"

# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
# https://www.quora.com/What-is-the-best-Bash-prompt-for-Git
if [ -f /etc/bash_completion.d/git-prompt ]; then
  source /etc/bash_completion.d/git-prompt
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWCOLORHINTS=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  #PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
  PS1='\w$(__git_ps1 " (%s)")\$ '
fi
. "/etc/letsencrypt/acme.sh.env"

function killTcpListen () {
  kill -9 $(lsof -sTCP:LISTEN -i:$1 -t)
}

export PATH="$PATH:$HOME/.skim/bin"

#alias ls='exa'
alias dfo='df -x squashfs -x tmpfs -x devtmpfs -BM -H -T'
alias ncdumc='NCDU_SHELL="mpv *" ncdu'
# https://unix.stackexchange.com/questions/25327/watch-command-alias-expansion
alias watch='watch '

export GOPATH=$HOME/go
export PATH=${GOPATH//://bin:}/bin:$PATH

## https://github.com/junegunn/fzf#settings
## The default commands fzf uses do not include hidden files. If you want hidden files in the list, you have to define your own $FZF_DEFAULT_COMMAND or $FZF_CTRL_T_COMMAND depending on the context. https://github.com/junegunn/fzf/issues/634#issuecomment-238036404
## and setting _fzf_compgen_path and _fzf_compgen_path does not show hidden files
## http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
#export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#
##disabling: it interfere with FZF_ALT_C_COMMAND
##bind -x '"\C-e": em $(fzf);'
#
##sudo apt install bfs
##export FZF_ALT_C_COMMAND="cd ~/; bfs -type d -nohidden | sed s@^@${HOME}/@"
## some problems: `__fzf_cd__`bfs: error: ./.dbus: Permission denied.
##export FZF_ALT_C_COMMAND="cd ~/; bfs -type d | sed s@^@${HOME}/@"
#export FZF_ALT_C_COMMAND="cd; fd --type d --hidden --follow --exclude '.git' --exclude node_modules | sed s@^@${HOME}/@"
#
#export PATH=$HOME/bin/ctags/bin:$PATH
#
#
###--------------------
### History
###--------------------
## Here's a solution that doesn't mix up histories from individual sessions!
##
## Basically one has to store history of each session separately and recreate it on every prompt. Yes, it uses more resources, but it's not as slow as it may sound - delay starts to be noticeable only if you have more than 100000 history entries.
## https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows/430128#430128
## https://gist.github.com/jan-warchol/89f5a748f7e8a2c9e91c9bc1b358d3ec
## https://news.ycombinator.com/item?id=11811272
## https://spin.atomicobject.com/2016/05/28/log-bash-history/
##   - log to multiple files, save directory name
## https://superuser.com/questions/1158739/prompt-command-to-reload-from-bash-history/1158857#1158857
## https://askubuntu.com/questions/67283/is-it-possible-to-make-writing-to-bash-history-immediate
## https://stackoverflow.com/questions/9457233/unlimited-bash-history/19533853#19533853
#
. $HOME/sync-history.sh
HISTCONTROL=ignoredups:ignorespace
export HISTTIMEFORMAT='%Y-%m-%d %H:%M.%S | '
export HISTIGNORE="ls:exit:history:[bf]g:jobs"

## hh is alias to hstr
# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors

## Options set by hstr
#shopt -s histappend              # append new history items to .bash_history
#export HISTCONTROL=ignorespace   # leading space hides commands from history
#export HISTFILESIZE=10000        # increase history file size (default is 500)
#export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
## ensure synchronization between Bash memory and history file
#export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"

# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
