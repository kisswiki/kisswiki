Since I found this question in a search, the accepted answer didn't work for me, and I eventually found a solution that did, I figured I'd share:

`gitk --argscmd='git for-each-ref --format="%(refname)" refs/heads'`

It will even update if you add a branch and then refresh a running gitk with F5. You can include tags as well with:

`gitk --argscmd='git for-each-ref --format="%(refname)" refs/heads refs/tags'`

Or using rev-list (shorter, but slightly cheating):

`gitk --argscmd='git rev-list --no-walk --branches --tags'`

https://stackoverflow.com/questions/10095205/how-to-make-gitk-show-only-local-branches/16946671#16946671