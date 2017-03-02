## Global typescript

```
# show package versions
npm show typescript@* version
# show package versions including dev, interal, alpha, beta etc.
npm view typescript versions --json
# show which package can be updated
npm outdated -g
# update to latest version
npm update -g typescript
# remove
npm rm -g typescript
# update to specific version
npm update -g typescript@2.1.6
tsc -v
# show installed packages
npm list --depth=0 -g
```

- http://stackoverflow.com/questions/39677437/how-to-update-typescript-to-latest-version-with-npm
- http://stackoverflow.com/questions/10972176/find-the-version-of-an-installed-npm-package
- http://stackoverflow.com/questions/38750611/show-most-recently-published-versions-of-npm-package-including-beta-versions
