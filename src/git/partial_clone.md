```bash
$ git clone --depth 1 -b <branch> https://github.com/user/repo.git
$ cd repo
$ git fetch origin otherBranch --depth 10
#$ git fetch origin remoteBranch:localBranch --depth 1
```

- https://stackoverflow.com/questions/1209999/using-git-to-get-just-the-latest-revision/1210012#1210012
- https://stackoverflow.com/questions/1911109/how-do-i-clone-a-specific-git-branch/4568323#4568323
- https://stackoverflow.com/questions/19352894/how-to-git-fetch-efficiently-from-a-shallow-clone/19528379#19528379

`git clone --depth=1` works, in the more general case, it can create problems. For instance, if you want to keep your clone up to date with upstream, `git fetch` is much more expensive on a shallow clone.

If what you want is to download less data, partial clones are better for the general case:

`git clone --filter=tree:0 <url>`

This will still download the commit history, but it won't download file trees and file contents for previous commits. Fetches to upstream commits will still be cheap.

https://stackoverflow.com/questions/1209999/using-git-to-get-just-the-latest-revision/69752584#69752584
