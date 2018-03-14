https://code.visualstudio.com/docs/editor/versioncontrol

in ~/.gitconfig

```
[diff]
    tool = default-difftool
[difftool "default-difftool"]
    cmd = code --wait --diff $LOCAL $REMOTE
```