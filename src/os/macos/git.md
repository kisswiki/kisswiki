## Old

in `~/.bash_profile`

```bash
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
  . $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '
```

`source ~/.bash_profile`

https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion

If there are errors about brew couldn’t link, run this:

`brew link --overwrite git`

https://stackoverflow.com/questions/20648235/error-linking-git-to-homebrew
