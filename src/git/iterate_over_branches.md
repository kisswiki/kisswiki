`for i in `git for-each-ref --format='%(refname:short)' refs/heads/feature/`; do git branch -D $i; done`

- https://stackoverflow.com/questions/26724818/for-loop-over-all-git-branches-with-certain-name
- https://stackoverflow.com/questions/3846380/how-to-iterate-through-all-git-branches-using-bash-script
- `bash/string_contains.md`
