That's another of those things that I _really_ don't want to see -
github creates absolutely useless garbage merges, and you should never
ever use the github interfaces to merge anything.

This is the complete commit message of that merge:

> Merge branch 'torvalds:master' into master

Yeah, that's not an acceptable message. Not to mention that it has a
bogus "github.com" committer etc.

github is a perfectly fine hosting site, and it does a number of other
things well too, but merges is not one of those things.

Linux kernel merges need to be done _properly_. That means proper
commit messages with information about what is being merged and _why_
you merge something. But it also means proper authorship and committer
information etc. All of which github entirely screws up.

We had this same issue with the ksmbd pull request, and my response is
the same: the initial pull often has a few oddities and I'll accept
them now, but for continued development you need to do things
properly. That means doing merges from the command line, not using the
entirely broken github web interface.

- https://lore.kernel.org/lkml/CAHk-=wjbtip559HcMG9VQLGPmkurh5Kc50y5BceL8Q8=aL0H3Q@mail.gmail.com/
  - via https://www.reddit.com/r/programming/comments/pjggh0/linus_github_creates_absolutely_useless_garbage/
    - via https://www.reddit.com/r/programming/top/

### more github rebase

Any actual rebase destroys the signature. But if you do it locally, your git client can automatically re-sign the new commits. And that's fine. As long as the end result is both authentic and signed, the result is good.

GitHub can not re-sign, because they don't have the private key.

The claim here is that GitHub performs a rebase, even if it should be a no-op. Like have commit abc123 as child of tip commit xyz456. Then rebase-and-merge will rebase abc123 onto xyz456, even if that does nothing, but unnecessarily destroys the signatures in the process.

https://www.reddit.com/r/programming/comments/pjggh0/linus_github_creates_absolutely_useless_garbage/hbxabw9/?utm_source=reddit&utm_medium=web2x&context=3
