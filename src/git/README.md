- [A workshopper module for learning Git and GitHub](https://github.com/jlord/git-it)
- So you're rebasing and you resolve a conflict wrong? `git checkout --conflict=merge <FILE>` to get it back to its conflicted state https://twitter.com/maybekatz/status/677656507052392448
- https://xkcd.com/1597/
- http://think-like-a-git.net/
- extra commands https://github.com/alebcay/awesome-shell
- .gitignore http://stackoverflow.com/questions/5533050/gitignore-exclude-folder-but-include-specific-subfolder
- http://zachholman.com/talk/git-github-secrets/
- http://zachholman.com/talk/more-git-and-github-secrets/
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
- revert multiple commits
  - `git revert --no-commit HEAD~2..` http://stackoverflow.com/questions/1463340/revert-multiple-git-commits#comment19940208_11743042
- extract domains from email
  - git log --format='%ae' | grep -Eo '[^@]+$'
  - group by some domain when we have `user1.example.com` etc: `git log --format='%ae' | grep -Eo '[^@]+$' | sed -e 's/.*\(example\.com\)/\1/g`
- remove some files from git history and not last commit, based on https://help.github.com/articles/removing-files-from-a-repository-s-history/

  ```shell
  git rebase -i <parent_sha>
  change `pick` to `edit`
  git rm --cached <file_to_remove>
  git commit --amend --no-edit
  git rebase --continue
  ```
- https://github.com/qw3rtman/git-fire
- https://github.com/jayphelps/git-blame-someone-else
- extract directory to new repository `git subtree split -P <name-of-folder> -b <name-of-new-branch>`
  - http://stackoverflow.com/questions/359424/detach-subdirectory-into-separate-git-repository/17864475#17864475
  - https://help.github.com/articles/splitting-a-subfolder-out-into-a-new-repository/
- To make script executable under windows (--add when it's a new file) `git update-index --add --chmod=+x <file>` http://stackoverflow.com/questions/6476513/git-file-permissions-on-windows
- https://wildlyinaccurate.com/a-hackers-guide-to-git/
- gitless https://www.reddit.com/r/programming/comments/558utp/purposes_concepts_misfits_and_a_redesign_of_git/

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

## crlf

- disable eol conversion: `* -text` in .gitattributes http://stackoverflow.com/questions/9933004/how-to-to-disable-git-end-of-line-crlf-to-lf-across-all-clones-machines
- https://github.com/rofrol/git-helpers/blob/master/git-crlf2lf
- hook to prevent committing crlf
  - http://stackoverflow.com/questions/3455772/make-sure-files-are-converted-crlf-into-lf-in-an-update-hook-is-there-a-perform
  - https://gist.github.com/benprew/6384274
  - https://gergap.wordpress.com/2010/05/12/git-crlf-hook/
  -

## Change author and commiter

`git -c user.name="New Author Name" -c user.email=email@address.com commit --amend  --author "New Author Name <email@address.com>"`

http://stackoverflow.com/questions/750172/change-the-author-of-a-commit-in-git

## force the user to always set user.email & user.name

If you do not want to have a default email address (email address links to a github user), you can use

```
[user]
    name = Your name
    email = "(none)"
```

http://stackoverflow.com/questions/4220416/can-i-specify-multiple-users-for-myself-in-gitconfig/32124169#32124169

or from git>=2.8

> The "user.useConfigOnly" configuration variable can be used to force the user to always set user.email & user.name configuration variables, serving as a reminder for those who work on multiple projects and do not want to put these in their $HOME/.gitconfig.
> - https://github.com/git/git/blob/master/Documentation/RelNotes/2.8.0.txt

## After git pull, git status shows changed files

`git config --global core.autocrlf input`

http://stackoverflow.com/questions/5009096/files-showing-as-modified-directly-after-git-clone

## speed up "git status" and similar index operations significantly

`git config --global core.untrackedCache true`

https://news.ycombinator.com/item?id=11388131

## git push -u origin HEAD

You don't need to specify branch name or using aliases like :

`pu = !"git push -u origin $(git symbolic-ref -q HEAD --short)"``

## Received HTTP code 503 from proxy after CONNECT

I looks like I can't connect when using git inside git bash.

- https://github.com/git-for-windows/git/issues/732
- http://stackoverflow.com/questions/36650023/why-git-doesnt-connect-from-git-bash-but-works-in-cmd-exe-503-from-proxy-afte

Solution:

~/.bashrc
alias git=~/AppData/Local/GitHub/PortableGit_25d850739bc178b2eb13c3e2a9faafea2f9143c0/cmd/git

I got error using git from github because they use credential manager that I don't have in path. So I need to use other. Notice using `--system`, because `--global` didn't work.

git config --system credential.helper wincred

Maybe need to analize openssl used http://serverfault.com/questions/678228/why-do-openssl-and-ssh-of-git-for-windows-report-different-versions-of-openssl

or cert http://askubuntu.com/questions/23680/problems-with-certificate-with-wget-and-github-lately

## Man pages on windows

Install man from man.md and

http://stackoverflow.com/questions/5517564/how-do-i-get-git-to-show-command-line-help-in-windows

Download and extract man pages for your `git version` https://www.kernel.org/pub/software/scm/git/ to `~/man`

http://www.codeography.com/2009/09/15/install-git-man-pages-the-easy-way.html

I couldn't make it to work with git like `git help config`

I've set `git config --global help.format man` but it doesn't work:

```
$ git help config
warning: failed to exec 'man': No such file or directory
fatal: no man viewer handled the request
```

## git log unknown date "format:%c"

Upgrade to git >= 2.6

> Git 2.6+ (Q3 2015) add a new option
> introduce "format" date-mode
> http://stackoverflow.com/questions/19742345/what-is-the-format-for-date-parameter-of-git-commit
