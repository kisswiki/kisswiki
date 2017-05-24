Doesn't work for me on Windows7. I have also used `gitdir/i`.

~/.gitconfig

```
[includeIf "gitdir:C:/projects/"]
        path = .gitconfig-work
```

~/.gitconfig-work

```
[user]
        email = work@example.com
```

```
cd /c/projects
git config --show-origin --get user.email
```

- https://git-scm.com/docs/git-config
- https://stackoverflow.com/questions/43919191/git-2-13-conditional-config-on-windows
- https://stackoverflow.com/questions/8801729/is-it-possible-to-have-different-git-config-for-different-projects
