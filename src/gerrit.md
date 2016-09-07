> > I wonder how you query for authors in gerrit? when I write queries I
> only get owner and committer(uploader).
> Its not supported. There aren't any operators to search by author.
> -- https://groups.google.com/forum/#!topic/repo-discuss/CVegBAlkQag

## if anyone reviewed their own code (giving their own commit code-review +2)

`ssh user@gerrit git --git-dir=/home/user/etc/gerrit/git/project.git/ rev-list -1 --pretty=format:"Author:%an%nEmail:%ae" refs/changes/75/375/1`

http://stackoverflow.com/questions/16985686/how-to-get-patchset-author-out-of-gerrit

> In the latest version of Gerrit it's possible to include the author and committer of patch sets in the results returned by the REST API query.

`curl -n --digest "https://review.example.com/a/changes/?q=owner:self&o=CURRENT_REVISION&o=CURRENT_COMMIT"`
