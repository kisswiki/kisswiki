```bash
git fetch -f origin master:master
git rebase master
git fetch . HEAD:master
git push origin master
```

If push is rejected, it means someone update origin/master in the meantime.
You have to repeat above commands.

- http://stackoverflow.com/questions/3216360/merge-update-and-pull-git-branches-without-using-checkouts
- http://stackoverflow.com/questions/8676903/git-how-to-push-without-checking-out
