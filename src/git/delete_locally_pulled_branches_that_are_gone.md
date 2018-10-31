This delete branch when it was deleted on remote even if it was not merged to master:

`git checkout master && git fetch -p --all && LC_ALL=C git branch -vv | awk '/: gone]/{print $1}' | xargs -r git branch -d`

This will delete only merged to master:

`git branch --merged | grep -v master | xargs git branch -d`

https://stackoverflow.com/questions/7726949/remove-tracking-branches-no-longer-on-remote

Marek's solution:

`git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs -r git branch -d`

## github

You may also see https://github.com/<organization>/<project>/branches for your branches.

Also there is `hub sync`:

>If the branch seems merged and its upstream branch was deleted, delete it.

https://github.com/github/hub/blob/ce24b1cf7e964d7f5571c5e4baa2414d3f62a61d/commands/sync.go
