```
[merge]
  keepBackup = false
	tool = p4merge
[mergetool "p4merge"]
	cmd = /Applications/p4merge.app/Contents/Resources/launchp4merge "\"$PWD/$BASE\"" "\"$PWD/$REMOTE\"" "\"$PWD/$LOCAL\"" "\"$PWD/$MERGED\""
	keepTemporaries = false
	trustExitCode = false
	keepBackup = false
[diff]
    tool = p4merge
[difftool "p4merge"]
	cmd = /Applications/p4merge.app/Contents/Resources/launchp4merge "\"$REMOTE\"" "\"$LOCAL\""
```

- https://gist.github.com/samsalisbury/5436108
- https://stackoverflow.com/questions/137102/whats-the-best-visual-merge-tool-for-git/2235841#2235841