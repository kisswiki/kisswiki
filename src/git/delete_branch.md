Deleting a remote branch

```
git push origin --delete <branch>  # Git version 1.7.0 or newer
git push origin -d <branch>        # Shorter version (Git 1.7.0 or newer)
git push origin :<branch>          # Git versions older than 1.7.0
```

Deleting a local branch

```
git branch --delete <branch>
git branch -d <branch> # Shorter version
git branch -D <branch> # Force-delete un-merged branches
```

Deleting a local remote-tracking branch

```
git branch --delete --remotes <remote>/<branch>
git branch -dr <remote>/<branch> # Shorter

git fetch <remote> --prune # Delete multiple obsolete remote-tracking branches
git fetch <remote> -p      # Shorter
```

If you cannot delete remote branch, maybe it is set as main branch on github etc.

To delete all remote-tracking branches that are no longer on remote:

`git remote prune origin` 

- https://stackoverflow.com/questions/2003505/how-do-i-delete-a-git-branch-locally-and-remotely/23961231#23961231
