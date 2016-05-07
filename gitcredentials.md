# git credentials

https://git-scm.com/docs/gitcredentials

Available helpers `git help -a | grep credential-`

## store

`git config credential.helper store`

stored in `~/.git-credentials`

https://git-scm.com/docs/git-credential-store

## cache

`git config credential.helper cache`

didn't worked for me on windows

https://git-scm.com/docs/git-credential-cache

## wincred

`git config credential.helper wincred`

https://help.github.com/articles/caching-your-github-password-in-git/

## github --credentials

`git config credential.helper '!github --credentials'`

## unset

```
git config --system --unset credential.helper
git config --global --unset credential.helper
git config --local --unset credential.helper
```

http://stackoverflow.com/questions/15381198/remove-credentials-from-git

## multiple helpers

> If there are multiple instances of the credential.helper configuration variable, each helper will be tried in turn, and may provide a username, password, or nothing. Once Git has acquired both a username and a password, no more helpers will be tried. https://git-scm.com/docs/gitcredentials

in git >=2.9:

> Since the credential.helper key is a multi-valued config list, there's no way to "unset" a helper once it's been set. So if your system /etc/gitconfig sets one, you can never avoid running it, but only add your own helpers on top.
> giving an empty string as its value now serves as the signal to clear the values specified in various files
> http://stackoverflow.com/questions/13198143/how-do-i-disable-gits-credential-helper-for-a-single-repository/36435803#36435803

http://stackoverflow.com/questions/13198143/how-do-i-disable-gits-credential-helper-for-a-single-repository
