> speaking of my experience, I eventually found switching fast-forward to off was mostly helpful for git newcomers - however once the feel for workflows and concepts start to sink in you definitely want to avoid blurring your log graph with tons of pointless 'merged remote ..blarf' type commits. http://stackoverflow.com/questions/2500296/can-i-make-fast-forwarding-be-off-by-default-in-git/2500446#2500446

Below are some options but I haven't checked them thoroughly

All branches

`git config [--global] merge.ff only`

http://stackoverflow.com/questions/5519007/how-do-i-make-git-merges-default-be-no-ff-no-commit/10633995#10633995

For single branch

`git config [--global] branch.master.mergeoptions "--no-ff"`

http://stackoverflow.com/questions/2500296/can-i-make-fast-forwarding-be-off-by-default-in-git

`git config [--global] branch.master.rebase true`
`git config --global branch.autosetuprebase always`

http://kernowsoul.com/blog/2012/06/20/4-ways-to-avoid-merge-commits-in-git/
