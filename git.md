- [A workshopper module for learning Git and GitHub](https://github.com/jlord/git-it)
- So you're rebasing and you resolve a conflict wrong? `git checkout --conflict=merge <FILE>` to get it back to its conflicted state https://twitter.com/maybekatz/status/677656507052392448
- https://xkcd.com/1597/
- http://think-like-a-git.net/
- extra commands https://github.com/alebcay/awesome-shell
- .gitignore http://stackoverflow.com/questions/5533050/gitignore-exclude-folder-but-include-specific-subfolder
- http://zachholman.com/talk/git-github-secrets/
- http://zachholman.com/talk/more-git-and-github-secrets/
- rewriting history
  - It also lets me commit whenever I want to during development, even if the build is broken. This is useful for finding bugs during development as you'll have more recorded states to, i.e., find the last working state when you screw something up. https://news.ycombinator.com/item?id=9745350
  - There's something to be said for having every commit pass tests/work https://news.ycombinator.com/item?id=9748339
  - Another nice side benefit is that you are able to use git bisect to find bugs more easily. If some of the commits fail the build then it becomes difficult to separate commits that actually introduce a bug from those that are just incomplete.
    The team I work with has recently started making sure every commit passes the build and it's had some fantastic results in our productivity.
    (...)
    Being able to compile the work-in-progress state for both components simultaneously is very useful to catch the kind of problems like incorrect const-qualifiers.
    https://news.ycombinator.com/item?id=9745616
  - Cleaning up your history before merging is important. For one, before you merge you should usually have someone do code review. No one wants to do a code review on a branch that has a bunch of false starts, typo fixups, debug print statements being added and removed, and so on. Code reviewing a branch that breaks something and then fixes it three commits later is a real pain; you sit there puzzling over the first commit, wondering how it could possibly work, and writing up a big explanation for why they need to fix something, then you go on to a later commit and realize they already fixed it.
    Furthermore, dirty branches lose you a lot of the power that having a good, clean history gives you. When you do a blame on a line of code, to figure out when the last change was, do you want to see the "fix whitespace to match style guide" commit that someone insert in the branch at the end, or the actual meaningful change that occurred earlier? If you don't squash your commits to deal with these kinds of issues, you lose a lot of the power and convenience that good history gives you.
    There's more. One of Git's most powerful tools is bisect, but even in a VCS without an automated bisect, doing it manually can be useful to (I've done this in SVN before). If you have a regression, but have no idea what caused it, it can be very useful to bisect your commits; find a known good version and a known bad version, then go to the commit halfway in between, test that, and depending on whether that commit is good or bad, test the one halfway between that and the known good or known bad commit. Keep doing this until you find the commit that broke your code. But this process is seriously impeded if you have a bunch of half-done commits that implement a part of a feature but break something else that's fixed up three commits later.
    The "history of experimentation" nature of VCS history is just not all that interesting. Think of your VCS history more as an extended form of comments, that document why everything is the way it is. If you actually wrote comments on every line describing why you had changed it in a particular way every time you changed it, your code would wind up being more than 90% comments in not too long. Most of the time, you don't need to see this; but when you are left wondering "hmm, why is this the way it is?", good history is invaluable. The experimental changes in between aren't all that useful; if you got any information from them, then feel free to summarize that in the cleaned up commit message after you've squashed them out.
    Now, that's not to say that you should always produce perfect history while working on a branch. Feel free, when you're in exploratory coding mode, to make lots of checkpoint commits, experiments, and so on. Just clean it up before you present it for review and merge. The nice thing about Git is that you have your own local branches that no one else ever has to see, clean things up quickly and easily with "git rebase -i", and present a much nicer history when it's ready for merge.
    https://news.ycombinator.com/item?id=6457450
  - Commits should be logical units of the codebase, not units of developer productivity over time https://news.ycombinator.com/item?id=6461562
  - I don't care to know that you merged 3 times from master yesterday before pushing your feature. Also I don't care to know details like you forgot to put a config file in your first commit and had to do a second one, or that it took you 3 commits to have the spelling alright in the UI. https://news.ycombinator.com/item?id=6456445
  - They claim that git bisect gets confused by merge-based workflows, and instead advocate rebase-based workflows without explicit feature branches. They're wrong. https://gist.github.com/canton7/3737126
- git flow
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
  - fter a release branch is announced, only serious bug fixes are included in the release branch. If possible these bug fixes are first merged into master and then cherry-picked into the release branch. This way you can’t forget to cherry-pick them into master and encounter the same bug on subsequent releases. This is called an ‘upstream first’ policy that is also practiced by Google and Red Hat. https://about.gitlab.com/2014/09/29/gitlab-flow/
- rebase doesn't work with empty commit message http://stackoverflow.com/questions/8542304/rebasing-a-git-history-with-empty-commit-messages
  - replace empty commit message
  - or use `git cherry-pick --allow-empty-message from^..to`
- replace CRLF to LF in all files in history http://superuser.com/questions/293941/rewrite-git-history-to-replace-all-crlf-to-lf
  - `git filter-branch --tree-filter 'git ls-files -z | xargs -0 dos2unix' -- --all`
- http://stackoverflow.com/questions/13064613/how-to-prune-local-tracking-branches-that-do-not-exist-on-remote-anymore
  - `git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d`
- graph in shell https://github.com/holman/spark/wiki/Wicked-Cool-Usage
  - git spark --days 14 Stegosaurus
- change author https://help.github.com/articles/changing-author-info/
