>git uses the same merge-engine for rebase, and it's actually cherry-picking your stuff into the upstream branch. us = into, them = from
> https://stackoverflow.com/questions/27420165/git-rebase-deleted-by-us-and-deleted-by-them/36302032#36302032

>"deleted by us" are those that were deleted on the branch you are rebasing onto (the final branch), and files "deleted by them" are files that were deleted in the branch you are rebasing (the one that will be dropped).
https://stackoverflow.com/questions/27420165/git-rebase-deleted-by-us-and-deleted-by-them/27424658#27424658
