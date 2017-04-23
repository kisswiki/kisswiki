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
# https://unix.stackexchange.com/questions/140610/using-variables-to-store-terminal-color-codes-for-ps1/140618#140618
# https://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt
# \033 is the same as \e
# 0;32 is the same as 32
CYAN="$(echo -e "\e[1;36m")"
GREEN="$(echo -e "\e[32m")"
YELLOW="$(echo -e "\e[33m")"
RESET="$(echo -e "\e[0m")"

# http://stackoverflow.com/questions/4485059/git-bash-is-extremely-slow-in-windows-7-x64/19500237#19500237
# http://stackoverflow.com/questions/4485059/git-bash-is-extremely-slow-in-windows-7-x64/13476961#13476961
fast_git_ps1 ()
{
    rev="$((git symbolic-ref --short -q HEAD || git rev-parse -q --short HEAD) 2> /dev/null)"
    # http://stackoverflow.com/questions/39518124/check-if-directory-is-git-repository-without-having-to-cd-into-it/39518382#39518382
    git -C . rev-parse 2>/dev/null && echo " (${rev})"
}

# you need \] at the end for colors. Maybe you also need \[ at the beginning
PS1='\[${GREEN}\u@\h ${YELLOW}\w${CYAN}$(fast_git_ps1)${RESET}\] $ '
```

Activate it in current shell:

`source ~/.bash_profile`

- http://stackoverflow.com/questions/4485059/git-bash-is-extremely-slow-in-windows-7-x64/43569540#43569540
- https://github.com/msysgit/msysgit/wiki/Diagnosing-why-Git-is-so-slow
