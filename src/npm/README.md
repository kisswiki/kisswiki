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
- npm3 dependencies https://docs.npmjs.com/how-npm-works/npm3
- show package versions: `npm show <pkg> versions; npm show <pkg> dist-tags; npm show <pkg> version; npm show <pkg> versions --json;`

## Update npm

Is `npm@latest` needed?

`sudo npm install npm -g`

(`npm cache clean -f` may be needed)

- http://stackoverflow.com/questions/23393707/how-to-update-npm/24760147#24760147
- http://stackoverflow.com/questions/6237295/how-can-i-update-node-js-and-npm-to-the-next-versions/29023180#29023180
- https://docs.npmjs.com/getting-started/installing-node

Then verify version with `npm -v`. If it still shows old version, you probably use mingw (git bash etc.). In that case you need to set `%USERPROFILE%\AppData\Roaming\npm` to be at the beggining of `%PATH%`. Then verify it:

```shell
$ echo $PATH | tr ':' '\n' | grep npm
```

It works in `cmd.exe` without setting path.

- https://github.com/nodejs/node/issues/2951#issuecomment-197006582
- https://github.com/Alexpux/MSYS2-packages/issues/360#issuecomment-146185954
- https://github.com/npm/npm/wiki/Troubleshooting#upgrading-on-windows

### Windows

Install with `npm install npm@latest -g` and change `%PATH%`

https://github.com/npm/npm/wiki/Troubleshooting#upgrading-on-windows

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

GYP_MSVS_VERSION

'auto': ('14.0', '12.0', '10.0', '9.0', '8.0', '11.0'),
'2005': ('8.0',),
'2005e': ('8.0',),
'2008': ('9.0',),
'2008e': ('9.0',),
'2010': ('10.0',),
'2010e': ('10.0',),
'2012': ('11.0',),
'2012e': ('11.0',),
'2013': ('12.0',),
'2013e': ('12.0',),
'2015': ('14.0',),

https://github.com/nodejs/node-gyp/blob/master/gyp/pylib/gyp/MSVSVersion.py#L413

## Versioning and semver

You should check out https://docs.npmjs.com/cli/version .
It's super useful npm subcommand for releasing new versions!
It automatically creates the corresponding commit and tag.
Actually I'd even go so far to say that this should be the only way to create new versions!
Then it's also impossible to create invalid version numbers

https://github.com/rtfpessoa/diff2html/issues/74#issuecomment-217633109
