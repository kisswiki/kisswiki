
## git flow

- GitFlow considered harmful http://endoflineblog.com/gitflow-considered-harmful
  - https://news.ycombinator.com/item?id=9744059
  - https://www.reddit.com/r/programming/comments/3ae2tx/gitflow_considered_harmful/
  - “Considered Harmful” Essays Considered Harmful http://meyerweb.com/eric/comment/chech.html
- The primary reason for moving away is that the git-flow process is hard to deal with in a continuous (or near-continuous) deployment model.
  Start with a model as simple as possible (like GitHub flow tends to be), and move towards a more complex model if you need to.   http://stackoverflow.com/questions/18188492/what-are-the-pros-and-cons-of-git-flow-vs-github-flow
- Git Branches Considered Harmful http://hintjens.com/blog:24
- a simple git branching model https://gist.github.com/jbenet/ee6c9ac48068889b0912
  - https://news.ycombinator.com/item?id=6456193
- https://about.gitlab.com/2014/09/29/gitlab-flow/
- http://scottchacon.com/2011/08/31/github-flow.html
- http://widgetsandshit.com/teddziuba/2011/12/process.html
  - http://programmers.stackexchange.com/questions/187512/is-a-merging-strategy-like-git-flow-really-an-anti-pattern#comment361190_187512
- How GitHub Uses GitHub to Build GitHub by Zach Holman https://www.youtube.com/watch?v=qyz3jkOBbQY&t=09m12s
- After a release branch is announced, only serious bug fixes are included in the release branch. If possible these bug fixes are first merged into master and then cherry-picked into the release branch. This way you can’t forget to cherry-pick them into master and encounter the same bug on subsequent releases. This is called an ‘upstream first’ policy that is also practiced by Google and Red Hat. https://about.gitlab.com/2014/09/29/gitlab-flow/

## north star

what I’d recommend as a north star for most teams. All works happens as close to master as possible and we have no (or very few – count them on 1 hand) long term development branches other than master. People create short lived topic branches, do their work and merge to master quickly. We “branch for release” by creating a new branch for each release we ship and all the servicing work for the release happens in the release branch.

https://blogs.msdn.microsoft.com/bharry/2017/05/24/the-largest-git-repo-on-the-planet/
