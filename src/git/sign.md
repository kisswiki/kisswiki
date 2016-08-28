## Sign previous commits

```bash
$ git clone -b "pull-by-digest" git@github.com:ncdc/docker.git somewhere
$ cd somewhere
$ git rebase -i HEAD~3
# editor opens
# change each 'pick' to 'edit'
# save the file and quit
$ git commit --amend -s --no-edit
$ git rebase --continue # and repeat the amend for each commit
$ git push -f
```

https://github.com/docker/docker/pull/11109#issuecomment-76744766
