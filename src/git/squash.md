- http://stackoverflow.com/questions/5189560/squash-my-last-x-commits-together-using-git
- https://github.com/rofrol/git-helpers/blob/master/git-squash

`git reset --hard devel && git merge --squash HEAD@{1} && git commit`

```bash
function git-squash () {
  git reset --hard "$1" && git merge --squash "HEAD@{1}" && git commit
}
```


##

Find fork point

`git merge-base --fork-point $1`

Create alias

```
child = "!bash -c 'git log --format=%H --reverse --ancestry-path ${1:-HEAD}..${2:\"$(git rev-parse --abbrev-ref HEAD)\"} | head -1' -"
```

```
touch ~/bin/git-squash
chmod +x ~/bin/git-squash
```

Content of `~/bin/git-squash`:

```bash
#!/bin/bash

REV="$1"
if [ -z "$REV" ]; then
  echo "Provide branch name/revision"
  exit 1
fi

FORK_POINT=$(git merge-base --fork-point $REV)
FIRST_COMMIT=$(git child $FORK_POINT)
COMMIT_MESSAGE=$(git log -n 1 --pretty=format:'%s' $FIRST_COMMIT)
git reset --hard "$REV" && git merge --squash HEAD@{1} && git commit -m "$COMMIT_MESSAGE"

# https://stackoverflow.com/questions/3357280/print-commit-message-of-a-given-commit-in-git/3357988#3357988
# https://stackoverflow.com/questions/1761825/referencing-the-child-of-a-commit-in-git/39558576#39558576
# https://stackoverflow.com/questions/11466991/git-aliases-command-line-autocompletion-of-branch-names/11469302#11469302
# https://stackoverflow.com/questions/5189560/squash-my-last-x-commits-together-using-git/5190323#5190323
```

Add bash completion in `~/.bashrc`

```
_git_squash() 
{
    _git_reset
}
```
