## find and exclude multiple directories

`find ~/personal_projects/ \( -path "*/.git" -o -path "*/elm-stuff" -o -path "*/node_modules" -o -path "*/vendor" \) -prune -o -type f -name LICENSE -print`

`-o` is needed to separate prunning from searching

`-print` is needed to show only not pruned, instead you can use `-exec bash -c 'echo "$0"' {} \;`

`-prune ` is better than `-not -path` because does not descend into directories

https://stackoverflow.com/questions/4210042/how-to-exclude-a-directory-in-find-command

### old

- ignore some directiores `find . -type f -name "*_peaks.bed" ! -path "./tmp/*" ! -path "./scripts/*"` http://stackoverflow.com/questions/14132210/use-find-command-but-exclude-files-in-two-directories
