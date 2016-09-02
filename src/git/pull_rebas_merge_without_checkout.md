```bash
git fetch -f origin master:master
git rebase master
git fetch . HEAD:master
git push origin master
```

If push is rejected, it means someone update origin/master in the meantime.
You have to repeat above commands.
