## rewriting history

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

## Rebase or merge, rewrite or not

Ostatnio zawrzała dyskusja https://www.facebook.com/groups/257881290932879/permalink/955179261203075/ czy rebasować czy nie

### Rewriting

Commits should be logical units of the codebase, not units of developer productivity over time https://news.ycombinator.com/item?id=6461562

I don't care to know that you merged 3 times from master yesterday before pushing your feature. Also I don't care to know details like you forgot to put a config file in your first commit and had to do a second one, or that it took you 3 commits to have the spelling alright in the UI.
https://news.ycombinator.com/item?id=6456445

Cleaning up your history before merging is important. For one, before you merge you should usually have someone do code review. No one wants to do a code review on a branch that has a bunch of false starts, typo fixups, debug print statements being added and removed, and so on. Code reviewing a branch that breaks something and then fixes it three commits later is a real pain; you sit there puzzling over the first commit, wondering how it could possibly work, and writing up a big explanation for why they need to fix something, then you go on to a later commit and realize they already fixed it.
    Furthermore, dirty branches lose you a lot of the power that having a good, clean history gives you. When you do a blame on a line of code, to figure out when the last change was, do you want to see the "fix whitespace to match style guide" commit that someone insert in the branch at the end, or the actual meaningful change that occurred earlier? If you don't squash your commits to deal with these kinds of issues, you lose a lot of the power and convenience that good history gives you.
There's more. One of Git's most powerful tools is bisect, but even in a VCS without an automated bisect, doing it manually can be useful too.
https://news.ycombinator.com/item?id=6457450

### Rebase

One interesting "mix" of the workflows that I practice rebasing feature branches on top of master and then doing a non-ff merge back into master, noting the branch name. It keeps the history cleaner, makes bisecting easy, and makes it significantly easier to keep the history independent for each feature. http://programmers.stackexchange.com/questions/218801/why-do-so-many-websites-prefer-git-rebase-over-git-merge/218807#comment435184_218807

Rebasing destroys bisect's utility at times. Except for the head commits of a rebase, the commits from a rebase may not be runnable. Example: You branched at A and made B,C, D, someone pushed E. You're B and C and work but rebased on E, you're B and C are unrunnable or are runnable and don't work. Best case is you give up, worst case you think B or C contains the issue when in reality it is D http://programmers.stackexchange.com/questions/218801/why-do-so-many-websites-prefer-git-rebase-over-git-merge/218839#comment526777_218839

making it conflict-prone to pull directly from a colleague without going through the "central" server. http://programmers.stackexchange.com/questions/218801/why-do-so-many-websites-prefer-git-rebase-over-git-merge/218807#218807

The "evil merges" that mmutz was describing have nothing to do with git bisect alone. It happens when feature A changes a function that feature B also uses. All tests will pass in both A and B prior to the merge, but after the merge tests can break due to incompatible changes between A and B - but git bisect can't partially apply one branch to another, so its only clue is that the merge commit is when the bug was introduced. http://programmers.stackexchange.com/questions/72632/are-there-any-flaws-with-this-git-branching-model#comment373489_72634

Why not test merging commit? ^^^ So maybe this situation may apply when you introduce some test later on. And even then bisect will point to the merge commit as failing so you could sort things out.

### Merge commits

Jeśli chodzi o merge commity (--no-ff) to bisect też je rozumie https://gist.github.com/canton7/3737126

Zalety merge commitów to że można krok po kroku prześledzić w którym etapie zrobiliśmy błąd jak pracowaliśmy nad jakimś feature. Oraz można łatwo revertować cały feature składający się z kilku commitów.

Jednak trzeba pilnować żeby nie krzyżowały się takie dwa merge.

### Every commit pass tests/work

https://news.ycombinator.com/item?id=9748339

Another nice side benefit is that you are able to use git bisect to find bugs more easily. If some of the commits fail the build then it becomes difficult to separate commits that actually introduce a bug from those that are just incomplete.
The team I work with has recently started making sure every commit passes the build and it's had some fantastic results in our productivity.
(...)
Being able to compile the work-in-progress state for both components simultaneously is very useful to catch the kind of problems like incorrect const-qualifiers.
https://news.ycombinator.com/item?id=9745616

### Git flow

I generalnie nie wrąbywać się w skomplikowane git-flow:

The primary reason for moving away is that the git-flow process is hard to deal with in a continuous (or near-continuous) deployment model.
Start with a model as simple as possible (like GitHub flow tends to be), and move towards a more complex model if you need to.
http://stackoverflow.com/questions/18188492/what-are-the-pros-and-cons-of-git-flow-vs-github-flow

Dlatego polecam a simple git branching model
https://gist.github.com/jbenet/ee6c9ac48068889b0912
https://news.ycombinator.com/item?id=6456193

GitFlow considered harmful
http://endoflineblog.com/gitflow-considered-harmful
- https://news.ycombinator.com/item?id=9744059
- https://www.reddit.com/r/programming/comments/3ae2tx/gitflow_considered_harmful/
Issues with git-flow http://scottchacon.com/2011/08/31/github-flow.html
Who Needs Process? http://widgetsandshit.com/teddziuba/2011/12/process.html

Ciekawe jest też podejście żeby nie używać feature branchy ale forków:
Git Branches Considered Harmful http://hintjens.com/blog:24

### Hotfixy najpierw do master

After a release branch is announced, only serious bug fixes are included in the release branch. If possible these bug fixes are first merged into master and then cherry-picked into the release branch. This way you can’t forget to cherry-pick them into master and encounter the same bug on subsequent releases. This is called an ‘upstream first’ policy that is also practiced by Google and Red Hat.
https://about.gitlab.com/2014/09/29/gitlab-flow/

### Tags

Uważam że powinno się robić commity typu: "Preparing for release" i wtedy commituje się jakiś plik gdzie zapisujemy numer wersji. Dzięki temu jak coś się z tagami stanie to będziemy mogli odtworzyć to miejsce.

### Śmietnik

I generalnie nie róbcie śmietnika z gita. Niektórzy traktują to jako narzędzie do pilnowania kiedy programista zaczął pracę na featurem i nie można rebasować.

Albo ludzie od budowania wrzucają tagi na gdzie zrobili builda.

Niektórze jeszcze wrzucają dist/build do drzewa. W repo nie powinien się znajdować kod który można wygenerować.

### Humor

- https://devhumor.com/media/i-fucked-up-git-so-bad-it-turned-into-guitar-hero
- https://xkcd.com/1597/
