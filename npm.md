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
  $ npm config set save-exact true # http://stackoverflow.com/questions/30656189/make-npm-install-save-add-a-strict-version-to-package-json
  ```
- npm3 dependencies https://docs.npmjs.com/how-npm-works/npm3
- show package versions: `npm show <pkg> versions; npm show <pkg> dist-tags; npm show <pkg> version; npm show <pkg> versions --json;`

## Update npm

`npm install npm@latest -g`

(`npm cache clean -f` may be needed)

http://stackoverflow.com/questions/6237295/how-can-i-update-node-js-and-npm-to-the-next-versions/29023180#29023180

https://docs.npmjs.com/getting-started/installing-node

Then verify version with `npm -v`. If it still shows old version, you probably use mingw (git bash etc.). In that case you need to set `%USERPROFILE%\AppData\Roaming\npm` to be at the beggining of `%PATH%`. Then verify it:

```shell
$ echo $PATH | tr ':' '\n' | grep npm
```

It works in `cmd.exe` without setting path.

- https://github.com/nodejs/node/issues/2951#issuecomment-197006582
- https://github.com/Alexpux/MSYS2-packages/issues/360#issuecomment-146185954
- https://github.com/npm/npm/wiki/Troubleshooting#upgrading-on-windows

## Speed

This may speed up installation:

`npm config set progress false`

To enable progress bar:

`npm config delete progress`

https://github.com/npm/npm/issues/11283

## Security

http://blog.npmjs.org/post/141702881055/package-install-scripts-vulnerability

## Check packages

https://github.com/dylang/npm-check

## node-gyp

https://github.com/nodejs/node-gyp/issues/629#issuecomment-153196245

https://github.com/atom/atom/issues/2614
