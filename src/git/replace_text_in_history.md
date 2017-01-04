usf `bfg` or

`git filter-branch --tree-filter "find . -name '*.*' -exec sed -i '' -e 's/OLDSTRING/NEWSTRING/g' {} \;" -f`

- http://stackoverflow.com/questions/4110652/how-to-substitute-text-from-files-in-git-history/
- https://gist.github.com/soheilpro/9756861
