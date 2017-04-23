## Polish characters displayed incorrectly

- `Options > Text > Locale > pl_PL`
- `Options > Text > Character set > UTF-8`

Restart terminal

## Slow

```bash
git config --global core.preloadindex true
git config --global core.fscache true
git config --global gc.auto 256
```

~/.bash_profile

```bash
fast_git_ps1 ()
{
    (git symbolic-ref --short -q HEAD || git rev-parse -q --short HEAD) 2> /dev/null
}

PS1='\[\033]0;$MSYSTEM:\w\007
\033[32m\]\u@\h \[\033[33m\w ($(fast_git_ps1))\033[0m\]
$ '
```

Activate it in current shell:

`source ~/.bash_profile`

- http://stackoverflow.com/questions/4485059/git-bash-is-extremely-slow-in-windows-7-x64/24045966#24045966
- PS1 http://stackoverflow.com/questions/4485059/git-bash-is-extremely-slow-in-windows-7-x64/43569540#43569540
- https://github.com/msysgit/msysgit/wiki/Diagnosing-why-Git-is-so-slow
