- http://stackoverflow.com/questions/40330759/yarn-global-installs-to-current-directory
- http://stackoverflow.com/questions/40102686/how-to-install-package-with-local-path-by-yarn-it-couldnt-find-package
- No support for private packages https://github.com/yarnpkg/yarn/issues/521
- http://stackoverflow.com/questions/40256897/how-to-create-run-configuration-with-yarn-instead-of-npm-in-webstorm-2016-2-3

## Upgrade packages

- `yarn global add <package>@latest` will upgrade a specific package http://stackoverflow.com/questions/40005233/how-can-i-update-global-packages-in-yarn/40394244#40394244
- upgrade all packages: `yarn upgrade-interactive` and then press `a` and `Enter` https://shift.infinite.red/npm-vs-yarn-cheat-sheet-8755b092e5cc

## upgrade yarn

`yarn self-update`

- https://yarnpkg.com/en/docs/cli/self-update
- https://github.com/yarnpkg/yarn/issues/1139

## Global install path

```
mkdir ~/yarn-global
yarn config set prefix ~/yarn-global
```

- http://stackoverflow.com/questions/40330759/yarn-global-installs-to-current-directory/40524116#40524116
- http://stackoverflow.com/questions/40258322/where-does-yarn-add-global-binaries-on-windows/42486420#42486420

## upgrade package

`yarn upgrade <package>`

`yarn upgrade-interactive` doesn't show all packages in `0.27.5`.
