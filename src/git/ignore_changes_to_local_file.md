`git update-index --assume-unchanged src/file/to/ignore`

`git update-index --no-assume-unchanged src/file/to/ignore`

https://stackoverflow.com/questions/24983762/git-ignore-local-file-changes/44652029#44652029

## Old

`git update-index --skip-worktree <file>`

To cancel

git update-index --no-skip-worktree <file>`

- https://stackoverflow.com/questions/1274057/how-to-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore/20241145#20241145
- https://stackoverflow.com/questions/50252181/git-how-to-ignore-changes-to-a-tracked-file/55351856#55351856
