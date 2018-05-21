icebraining 2 days ago [-]

I say that's LFS' fault. Why do you even need a custom server? It should just be able to use any ol' file server or S3-API compatible service, and do everything on the client side.
I find git-annex a much better solution, it's a shame everyone went with LFS.

reply

	
rspeer 2 days ago [-]

My experience with git-annex is that it seems heavily designed for individuals and not for projects. The places it looks for files are often just a computer you were once developing on, and it sometimes expects you to go find that computer. It never forgets about any crazy place your files have been.
It was very hard to use in asymmetric cases where different people have different credentials, such as where one person has access to a computer and others don't, or where a couple of core developers have authenticated R/W access to a file server or an S3 bucket and everyone else just has HTTP.

reply

	
icebraining 2 days ago [-]

Git-annex doesn't look for files in random places. It uses the regular git remotes, plus something it calls "special remotes" which are basically accounts on file servers/S3/etc that you can manually add.
If Github et all thought this was confusing, they could have made a "beginner's mode" that auto-selected the storage server based on the git server, like LFS does. Which would still have been better, since it wouldn't have required a custom server API.

It was very hard to use in asymmetric cases where different people have different credentials

Right, but LFS can't be used in asymmetric cases at all - it assumes anyone with access to the git repository has access to the LFS storage area.

reply

	
rspeer 1 day ago [-]

> Right, but LFS can't be used in asymmetric cases at all - it assumes anyone with access to the git repository has access to the LFS storage area.
Wait, really? I thought that Git LFS let people with push access push files to the LFS area, which can then be read by anyone. That's asymmetric in the way everyone expects from GitHub. But I didn't use Git LFS because it's too expensive.

Yes, I probably encountered extra weirdness from git-annex, from the fact that the codebase was on GitHub, which doesn't support git-annex, so _everything_ in git-annex had to be on a different remote.

If it was meant to be used with the upstream as the only remote, that makes things make a lot of sense, and explains why my attempt to use it felt a lot like early Git, where there was no good upstream service like GitHub.

https://news.ycombinator.com/item?id=17103704