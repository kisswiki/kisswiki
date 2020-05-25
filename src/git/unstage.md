## changes to be committed

All commands failed to unstage directory, only this worked:

`git rm --cached . -r`

But this also removed all files in repository. After that I needed to `git checkout` and also restore some `.env` files.

https://stackoverflow.com/questions/348170/how-do-i-undo-git-add-before-commit/1876958#1876958