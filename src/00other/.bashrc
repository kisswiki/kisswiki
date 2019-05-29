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

export EDITOR=nvim

export PATH=~/local/bin/:$PATH

alias nvim='~/bin/nvim.appimage'
#alias em='nvm 2>&1 >/dev/null; TERM=xterm-24bit emacs -nw'
alias em='TERM=xterm-24bit emacs -nw'

export PATH=~/.cabal/bin:$PATH

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# https://github.com/junegunn/fzf#settings
# The default commands fzf uses do not include hidden files. If you want hidden files in the list, you have to define your own $FZF_DEFAULT_COMMAND or $FZF_CTRL_T_COMMAND depending on the context. https://github.com/junegunn/fzf/issues/634#issuecomment-238036404
# and setting _fzf_compgen_path and _fzf_compgen_path does not show hidden files
# http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#disabling: it interfere with FZF_ALT_C_COMMAND
#bind -x '"\C-e": em $(fzf);'

#sudo apt install bfs
#export FZF_ALT_C_COMMAND="cd ~/; bfs -type d -nohidden | sed s@^@${HOME}/@"
# some problems: `__fzf_cd__`bfs: error: ./.dbus: Permission denied.
#export FZF_ALT_C_COMMAND="cd ~/; bfs -type d | sed s@^@${HOME}/@"
export FZF_ALT_C_COMMAND="cd; fd --type d --hidden --follow --exclude '.git' --exclude node_modules | sed s@^@${HOME}/@"
