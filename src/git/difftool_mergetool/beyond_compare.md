
Launch Beyond Compare, go to the Beyond Compare menu and run Install Command Line Tools.

in ~/.gitconfig

```
[diff]
    tool = bc3
[difftool "bc3"]
	trustExitCode = true
```

Maybe also `git config --global difftool.prompt false`.

- https://www.scootersoftware.com/support.php?zz=kb_vcs_osx
- https://www.scootersoftware.com/support.php?zz=kb_vcs
- https://stackoverflow.com/questions/2069490/git-diff-with-beyond-compare