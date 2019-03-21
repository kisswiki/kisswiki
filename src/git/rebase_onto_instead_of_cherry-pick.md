featureB is based on featureA, however, we realize featureB is not dependent on any of the changes in featureA and could just be branched off master.

`git rebase --onto master featureA featureB`

or when I want to rebase on `origin/master`:

`git rebase -X ours --onto origin/master master`

- https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase
- https://stackoverflow.com/questions/29914052/i-cant-understand-the-behaviour-of-git-rebase-onto
