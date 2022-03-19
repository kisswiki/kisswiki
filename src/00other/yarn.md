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

- https://github.com/yarnpkg/yarn/issues/3016#issuecomment-300467981

## why dependency was installed

`yarn why <package>`

https://medium.com/@dave_lunny/check-why-a-specific-dependency-is-installed-with-yarn-a7beea12b65c

## yarn version

```
$ which yarn
/tmp/fnm_multishells/46825_1635418982461/bin/yarn
$ jq -r .version /tmp/fnm_multishells/46825_1635418982461/lib/node_modules/yarn/package.json
1.22.15
```

though this show some bogus version:

```
$ yarn -v
3.0.0
```

There is no 3.0.0 tag on github, but 1.22.15 is
https://github.com/yarnpkg/yarn/releases/tag/v1.22.15

## info about package

`yarn info <package> [<field>]`

https://yarnpkg.com/cli/info

## yarn global

if you cd out of your project directory and run yarn --version again, you’ll once again get the global Yarn’s version number, 1.22.11 in this case. Every time you run yarn, you are using the globally installed version of the command. The global yarn command first checks to see if it’s in a Yarn project directory with a .yarnrc.yml file, and if it is, it hands the command off to the project-specific version of Yarn configured in the project’s yarnPath setting.

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-the-yarn-package-manager-for-node-js

## Usage Error: The nearest package directory doesn't seem to be part of the project

After `yarn set version latest` the error was more detailed. I needed to remove `~/package.json`.

https://stackoverflow.com/questions/64048830/yarn-2-init-add-failing

or maybe `touch yarn.lock` https://github.com/yarnpkg/berry/issues/625#issuecomment-1055033608
