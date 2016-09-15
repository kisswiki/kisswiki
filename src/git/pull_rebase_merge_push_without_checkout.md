```bash
#!/bin/bash

echo
echo prmp means: pull, rebase, merge, push.
echo
echo Easy merging and push to master without switching branches
echo Save this script as git-prmp in some directory added to env variable \$PATH.
echo Usage: git prmp
echo

git fetch -f origin master:master
git rebase master
git fetch . HEAD:master
git push origin master

# If push is rejected, it means someone update origin/master in the meantime.
# You have to repeat above commands.
# - http://stackoverflow.com/questions/3216360/merge-update-and-pull-git-branches-without-using-checkouts
# - http://stackoverflow.com/questions/8676903/git-how-to-push-without-checking-out
```
