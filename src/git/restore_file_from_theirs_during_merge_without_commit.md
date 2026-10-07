During a merge ("theirs" is `MERGE_HEAD`):

`git restore --source=MERGE_HEAD --staged --worktree -- <file>`

During a rebase (`REBASE_HEAD` exists only then):

`git restore --source=REBASE_HEAD --staged --worktree -- <file>`
