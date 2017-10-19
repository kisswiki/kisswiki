> > I wonder how you query for authors in gerrit? when I write queries I
> only get owner and committer(uploader).
> Its not supported. There aren't any operators to search by author.
> -- https://groups.google.com/forum/#!topic/repo-discuss/CVegBAlkQag

## if anyone reviewed their own code (giving their own commit code-review +2)

`ssh user@gerrit git --git-dir=/home/user/etc/gerrit/git/project.git/ rev-list -1 --pretty=format:"Author:%an%nEmail:%ae" refs/changes/75/375/1`

http://stackoverflow.com/questions/16985686/how-to-get-patchset-author-out-of-gerrit

> In the latest version of Gerrit it's possible to include the author and committer of patch sets in the results returned by the REST API query.

`curl -n --digest "https://review.example.com/a/changes/?q=owner:self&o=CURRENT_REVISION&o=CURRENT_COMMIT"`

## cons

Moving on to Gerrit, Greg started to list its good points, but stopped short, saying he didn't know any. Actually, there was one: project managers love it, since it gives them the feeling that they know what is going on within the project. He noted that Google, which promotes Gerrit for use with the Android project, does not use it for any of its internal projects. Even with Android, Gerrit is not really needed; Greg pointed out that, in the complicated flow chart showing how to get a patch into Android, Gerrit has a small and replaceable role.

https://lwn.net/Articles/702177/
