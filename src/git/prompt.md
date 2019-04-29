in ~/.bashrc:

```bash
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
# https://www.quora.com/What-is-the-best-Bash-prompt-for-Git
# https://github.com/magicmonty/bash-git-prompt
# https://coderwall.com/p/pn8f0g/show-your-git-status-and-branch-in-color-at-the-command-prompt
if [ -f /etc/bash_completion.d/git-prompt ]; then
  source /etc/bash_completion.d/git-prompt
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWCOLORHINTS=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  #PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
  PS1='\w$(__git_ps1 " (%s)")\$ 'fi
```
