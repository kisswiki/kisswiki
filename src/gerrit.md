> > I wonder how you query for authors in gerrit? when I write queries I
> only get owner and committer(uploader).
> Its not supported. There aren't any operators to search by author.
> -- https://groups.google.com/forum/#!topic/repo-discuss/CVegBAlkQag

## if anyone reviewed their own code (giving their own commit code-review +2)

`ssh user@gerrit git --git-dir=/home/user/etc/gerrit/git/project.git/ rev-list -1 --pretty=format:"Author:%an%nEmail:%ae" refs/changes/75/375/1`

http://stackoverflow.com/questions/16985686/how-to-get-patchset-author-out-of-gerrit
