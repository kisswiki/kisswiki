`git show SHA -- file1.txt file2.txt | git apply -`

or all files from SHA

`git show SHA | git apply -`

Note that it is different than `git checkout SHA` which will load also previous commits.

https://stackoverflow.com/questions/5717026/how-to-git-cherry-pick-only-changes-to-certain-files/29788254#29788254
