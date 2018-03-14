in ~/.gitconfig

```
[diff]
    tool = default-difftool
[difftool "default-difftool"]
    cmd = code --wait --diff $LOCAL $REMOTE
[merge]
    tool = vscode
[mergetool "vscode"]
    cmd = code --wait $MERGED
```

- https://code.visualstudio.com/docs/editor/versioncontrol
- https://github.com/Microsoft/vscode/issues/5770#issuecomment-308533904
- https://stackoverflow.com/questions/44549733/how-to-use-visual-studio-code-as-default-editor-for-git-mergetool/44549734#44549734