>  Pull requests are tied to the remote branch they're opened from (the pull-request "head"). Just push to that branch again and GitHub will automatically figure it out. You can even force-push, of you need that.
>
> Will the PR be 'marked' as updated?
> Should show up as a new commit being pushed similar to this on https://github.com/github/hub/pull/173
> https://github.com/github/hub/issues/198

<br>

> If you're working in the shared repository model, we recommend that you use a topic branch for your pull request. While you can send pull requests from any branch or commit, with a topic branch you can push follow-up commits if you need to update your proposed changes.
> When pushing commits to a pull request, don't force push. Force pushing can corrupt your pull request.
> https://help.github.com/articles/about-pull-requests/

<br>

> The only danger of rewriting history comes when that history is being committed to by other people, which you can check in the network data on GitHub. No one has made commits based on your commits, so you're fine.
> http://stackoverflow.com/questions/20862196/collapse-git-commits-after-push-upstream-github

<br>

> If my memory serves me correctly, then if you force push or update the branch in question in any way, GitHub will automatically update the pull request. If doing the force push would result in the pull request not being possible, then GitHub will tell you this.
> You do not need to worry about updating the pull request as GitHub will take care of this for you.
> This being said, doing a git push --force on any remote branch can cause mayhem for your coworkers who are also currently working on this branch. So you are correct to be shying away from doing a force push, but fortunately a GitHub pull request is not your biggest problem.
> http://stackoverflow.com/questions/32346624/what-happens-if-you-force-push-to-a-branch-with-an-existing-pull-request
