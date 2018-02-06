- https://pages.github.com/
- https://stackoverflow.com/questions/24851824/how-long-does-it-take-for-github-page-to-show-changes-after-changing-index-html
  - https://help.github.com/articles/about-supported-custom-domains/
- http://kb.porkbun.com/article/64-how-to-connect-your-domain-to-github-pages
- https://typeofweb.com/2018/01/31/react-js-na-github-pages-dzieki-create-react-app/

## deploy

Use this script, change default repository branch to devel on github.com

```bash
#!/bin/bash
set -e # stop on error

echo bulid client ...

mkdir -p build
cp index.html build/
cp CNAME build/

echo reset master branch to devel ...
git fetch -f . devel:master
git checkout master
echo add build folder
git add -f build
echo commit changes
git commit -m "deploy to master"
echo push to remote master
git push origin `git subtree split --prefix build`:master --force
echo checkout branch devel
git checkout devel
echo All done!
```

- User / Organization pages live in a specially named repository called username.github.io, and publish from the master branch https://stackoverflow.com/questions/25559292/github-page-shows-master-branch-not-gh-pages
- https://gist.github.com/cobyism/4730490#gistcomment-1374989
- https://gist.github.com/cobyism/4730490#gistcomment-1928142
- https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/
- https://stackoverflow.com/questions/42469817/host-github-pages-from-dist-folder-in-master-branch
- https://github.com/jimafisk/gh-pages_deploy/blob/master/pre-push