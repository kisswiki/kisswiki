- http://nolanlawson.com/2015/10/19/the-struggles-of-publishing-a-javascript-library/
- [remove confg entry](http://stackoverflow.com/questions/21228995/how-to-clear-https-proxy-setting-of-npm)
  - `npm config rm proxy`
- http://jonnyreeves.co.uk/2016/shrinkwrap-your-npm-dependencies/#shrinkwrap-your-npm-dependencies
- http://stackoverflow.com/questions/25997519/how-to-view-the-dependency-tree-of-a-given-npm-module
- http://stackoverflow.com/questions/23243353/how-to-set-shell-for-npm-run-scripts-in-windows
- install/uninstall from github
  - http://stackoverflow.com/questions/17509669/how-to-install-nodejs-package-from-github-directly
  - http://stackoverflow.com/questions/10386310/how-to-install-a-private-npm-module-without-my-own-registry
  - `npm i git+https://git@github.com/visionmedia/express.git#sha`
  - `npm rm express`
- http://stackoverflow.com/questions/25997519/how-to-view-the-dependency-tree-of-a-given-npm-module
- license
  - SPDX license expression syntax version 2.0 string https://docs.npmjs.com/files/package.json#license
  - http://npm1k.org/
  - https://spdx.org/licenses/
  - https://spdx.org/licenses/licenses.json
- defaults http://iamsim.me/set-your-npm-init-defaults/

  ```
  $ npm config set init.author.name "Simon Ljungberg"
  $ npm config set init.author.email hi@iamsim.me
  $ npm config set init.author.url http://iamsim.me/
  $ npm config set init.license Apache-2.0
  $ npm config set save-exact true
  ```
- npm3 dependencies https://docs.npmjs.com/how-npm-works/npm3
