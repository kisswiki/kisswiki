`git filter-branch -f --env-filter 'export GIT_COMMITTER_DATE="$GIT_AUTHOR_DATE"' -- --all`

Note 2026-10: `git filter-branch` is discouraged by its own man page; the git-filter-repo equivalent is:

`git filter-repo --commit-callback 'commit.committer_date = commit.author_date'`
