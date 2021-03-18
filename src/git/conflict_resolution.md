## Selectively choose ours or theirs

```bash
git checkout --theirs path/to/the/conflicted_file.php
git add path/to/the/conflicted_file.php
```

https://stackoverflow.com/questions/10697463/resolve-git-merge-conflicts-in-favor-of-their-changes-during-a-pull/25080000#25080000

## Dealing with "deleted by us" and "deleted by them" conflicts

For some conflict notifications, Git will include a "Deleted by us" or "Deleted by them" message next to a file. That means that you modified a file in one branch and deleted it in another. Git has no way of knowing if you want to delete the file or modify it, so you need to make the choice yourself.

Dealing with this type of conflict is straightforward: you have to decide if the deleted file is still required. You can do that by opening the file and looking at its contents. If you want to keep the file deleted, use the `git rm` command. Otherwise, use the `git add` command to restore the file. This will resolve the conflict for that file.

http://support.beanstalkapp.com/article/986-how-do-i-deal-with-conflicts-in-my-git-repo
