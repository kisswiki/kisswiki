How to search for something string in git history that is no longer here?

`git rev-list master | xargs -I{} git grep -i switch {} -- '*.elm' > search.txt`

Now in search.txt we can narrow our search.

When you find a file that contained this tring, you can find out when this string was deleted:

`git log -S SwitchCrossTab src/QueryBuilder.elm`

- https://git-scm.com/docs/git-grep
- https://stackoverflow.com/questions/13867705/git-grep-by-file-extensions
- https://stackoverflow.com/questions/2928584/how-to-grep-search-committed-code-in-the-git-history
- https://stackoverflow.com/questions/33661714/git-grep-search-a-specific-branch
- https://stackoverflow.com/questions/4404444/how-do-i-git-blame-a-deleted-line
