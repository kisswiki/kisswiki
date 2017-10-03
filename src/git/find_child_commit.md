git alias

`child = "!bash -c 'git log --format=%H --reverse --ancestry-path ${1:-HEAD}..${2:\"$(git rev-parse --abbrev-ref HEAD)\"} | head -1' -"`

https://stackoverflow.com/questions/1761825/referencing-the-child-of-a-commit-in-git/39558576#39558576
