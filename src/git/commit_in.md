## in branch or tag


Only list (local) branches which contain the specified commit.

`git branch --contains <commit>`

`git tag --contains <commit>`

Lists remote tracking branches as well:

`git branch -r --contains <commit>`

- http://stackoverflow.com/questions/5549479/git-check-if-commit-xyz-in-remote-repo
- https://coderwall.com/p/7fp5dg/finding-git-branches-which-contain-the-specified-commit
- http://stackoverflow.com/questions/1419623/how-to-list-branches-that-contain-a-given-commit

> Note that you need git 2.0.x (Q3 2014) in order to list all tags for a certain commit if you have a large repo
> In large repos, the recursion implementation of contains(commit, commit_list) may result in a stack overflow. Replace the recursion with a loop to fix it.
> This problem is more apparent on Windows than on Linux, where the stack is more limited by default.
> http://stackoverflow.com/questions/7923091/how-to-list-all-tags-that-contain-a-commit/24974192#24974192
