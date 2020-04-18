Works on Windows 10.

~/.gitconfig

```
[user]
	name = Name Surname
	email = me@me.com

# getdir is case esnsitive
# getdir/i is case insensitive
# there have to have slash after ~/projects
[includeIf "gitdir/i:~/projects/"]
        # relative path, i.e. .gitconfig-work will be relative to global git config
        path = ~/projects/.gitconfig
```

~/projects/.gitconfig

```
[user]
        email = work@example.com
```

`includeIf` must be in git config after `user.email` settings. The last settings in git config are applied.

```
cd ~/projects
# below command will show all email settings. Useful to check if git read settings from our includeIf,
# but it does not use them because we later overidden them in config with user.email
git config --show-origin --get-all user.email
# this must be run in initialized git directory
git config --show-origin --get user.email
```

- https://git-scm.com/docs/git-config#_includes
- https://stackoverflow.com/questions/43919191/git-2-13-conditional-config-on-windows
- https://stackoverflow.com/questions/8801729/is-it-possible-to-have-different-git-config-for-different-projects
- about `getdir/i` https://github.com/microsoft/vscode/issues/40354#issuecomment-421297202
- different ssh key https://dev.to/arnellebalane/setting-up-multiple-github-accounts-the-nicer-way-1m5m
- GPG signing http://blog.bennycornelissen.nl.s3-website-eu-west-1.amazonaws.com/post/juggling-multiple-git-identities/
- GPG signing https://augustl.com/blog/2019/set_up_win10_dev_environment_for_macos_linux_users/
