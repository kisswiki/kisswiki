```
$ git filter-branch --tree-filter 'test -d blog/_posts && mv blog/_posts . || echo "Nothing to do"' HEAD
```

https://stackoverflow.com/questions/3142419/how-can-i-move-a-directory-in-a-git-repo-for-all-commits

After that you may want to delete backup ref:

`git update-ref -d refs/original/refs/heads/master`

https://stackoverflow.com/questions/7654822/remove-refs-original-heads-master-from-git-repo-after-filter-branch-tree-filte
