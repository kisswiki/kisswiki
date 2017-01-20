```shell
git branch -d -r origin/<remote branch name>
# and reset the configuration
git config --unset branch.<branch>.remote
git config --unset branch.<branch>.merge
# or
git branch --unset-upstream <branch>
```

http://stackoverflow.com/questions/3046436/how-do-you-stop-tracking-a-remote-branch-in-git
