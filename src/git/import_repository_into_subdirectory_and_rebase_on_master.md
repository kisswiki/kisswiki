## Move all files to subdirectory

```
git filter-branch --index-filter \
	'git ls-files -s | sed "s-\t\"*-&newsubdir/-" |
		GIT_INDEX_FILE=$GIT_INDEX_FILE.new \
			git update-index --index-info &&
	 mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE"' HEAD
```

- https://git-scm.com/docs/git-filter-branch
- https://stackoverflow.com/questions/4042816/how-can-i-rewrite-history-so-that-all-files-except-the-ones-i-already-moved-ar
- This failed for me: `fatal: input format error: -e 040000 tree`, suggestion in comment to use gecho from gnu coreutils https://stackoverflow.com/questions/3212485/how-do-i-re-root-a-git-repo-to-a-parent-folder-while-preserving-history/3212697#3212697

## Add local repo

```
$ git remote add -f bak path/to/repo/
$ git co back back/master
$ git co -b back back/master
$ git rebase master
```

- https://stackoverflow.com/questions/10603671/how-to-add-a-local-repo-and-treat-it-as-a-remote-repo
