## find and exclude multiple directories

`find ~/personal_projects/ \( -path "*/.git" -o -path "*/elm-stuff" -o -path "*/node_modules" -o -path "*/vendor" \) -prune -false -o -type f -name LICENSE`

`-o` is needed to separate prunning from searching

`-print` is needed to show only not pruned, instead you can use `-exec bash -c 'echo "$0"' {} \;`

`-prune ` is better than `-not -path` because does not descend into directories

https://stackoverflow.com/questions/4210042/how-to-exclude-a-directory-in-find-command

## find all json files but exclude node_modules directories

`find . -type d -name 'node_modules' -prune -false -o -name '*.json'`

- Once you prune the contents of the directory you are still matched on the directory, so you have to add a -false to fail the test for the directory https://stackoverflow.com/questions/4210042/how-to-exclude-a-directory-in-find-command#comment82350374_4210072
- https://stackoverflow.com/questions/4210042/how-to-exclude-a-directory-in-find-command#comment70455585_4210072

### old

- ignore some directiores `find . -type f -name "*_peaks.bed" ! -path "./tmp/*" ! -path "./scripts/*"` http://stackoverflow.com/questions/14132210/use-find-command-but-exclude-files-in-two-directories
