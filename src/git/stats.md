- https://stackoverflow.com/questions/13182017/git-log-stat-summary-of-branch
- https://github.com/casperdcl/git-fame
- https://github.com/IonicaBizau/git-stats
  - https://fossbytes.com/git-stats-git-visualization/
- https://stackoverflow.com/questions/1265040/how-to-count-total-lines-changed-by-a-specific-author-in-a-git-repository
- https://github.com/tj/git-extras
- https://stackoverflow.com/questions/4589731/git-blame-statistics
- https://github.com/arzzen/git-quick-stats
- https://github.com/ejwa/gitinspector
- https://stackoverflow.com/questions/2528111/how-can-i-calculate-the-number-of-lines-changed-between-two-commits-in-git
- https://stackoverflow.com/questions/47954106/getting-accurate-total-line-count-of-a-git-repository-for-every-commit

## pager

`export GIT_PAGER=cat`

https://stackoverflow.com/questions/2183900/how-do-i-prevent-git-diff-from-using-a-pager

## query

- https://github.com/cloudson/gitql
- https://github.com/sqle/gitquery

## changelog

- https://github.com/saschagrunert/git-journal/
- https://github.com/clog-tool/clog-cli

## diff

```
git diff --stat dev..feature
git diff --shortstat dev..feature
```

## log file stats

`git log --pretty=tformat: --numstat`

https://stackoverflow.com/questions/19283764/git-log-pretty-format-with-lines-added-and-removed

## shortlog

```
$ git shortlog -n --since=2018-06-20
Roman Frolow (5):
      Use krisajenkins/remotedata in Store.Utils PLAT-312 (#849)
      Remove State and functions PLAT-312 (#855)
      Use RemoteData.map (#858)
      Tooltip on the left for export PLAT-362 (#861)
      Deactivation of Audience PLAT-306 (#868)
```

```
$ git shortlog -s -n
```

`git shortlog --numbered --summary`

## log

```bash
$ git log --pretty=format:"%h,%an,%ad,%s" --date=short --numstat --since=2018-06-01 --until=2018-06-20
bc63fe2,Roman Frolow,2018-06-20,remove State
4       4       components/Main.js.elm
```

https://stackoverflow.com/questions/13547838/git-weekly-activity/13548904#13548904

`git log --pretty=oneline --shortstat`

```bash
$ git log --pretty=format:"%h - %an (%ae): %s" --shortstat
bc63fe2 - Roman Frolow (rofrol@gmail.com): remove State
 37 files changed, 168 insertions(+), 193 deletions(-)

10552d9 - Roman Frolow (rofrol@gmail.com): Remove some functions from Store/Utils
 30 files changed, 134 insertions(+), 201 deletions(-)
```

```bash
$ git log --shortstat --pretty="%cE"
rofrol@gmail.com

 37 files changed, 168 insertions(+), 193 deletions(-)
rofrol@gmail.com
```

`git log --no-merges`

https://www.atlassian.com/git/tutorials/git-log

## how much lines (of code) are currently in the repository originating from each committer

```
git ls-tree -r -z --name-only HEAD -- */*.elm | xargs -0 -n1 git blame --line-porcelain HEAD |grep  "^author "|sort|uniq -c|sort -nr
```

https://stackoverflow.com/questions/4589731/git-blame-statistics/13687302#13687302
