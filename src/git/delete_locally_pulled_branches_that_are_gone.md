This delete branch when it was deleted on remote even if it was not merged to master:

`git checkout master && git fetch -p --all && LC_ALL=C git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d`

This will delete only merged to master:

`git branch --merged | grep -v master | xargs git branch -d`

https://stackoverflow.com/questions/7726949/remove-tracking-branches-no-longer-on-remote

Marek's solution:

`git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d`
