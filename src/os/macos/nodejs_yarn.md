## nvm

```zsh
% brew install nvm
# add initialization to ~/.zprofile
% nvm install --lts
% node -p "process.arch"
arm64
% nvm install stable --reinstall-packages-from=current
```

- https://stackoverflow.com/questions/65342769/install-node-on-m1-mac/65449002#65449002
- https://stackoverflow.com/questions/64002438/installing-node-lts-with-nvm-on-windows/65532065#65532065
- there is also https://github.com/jasongin/nvs
- https://stackoverflow.com/questions/34810526/how-to-properly-upgrade-node-using-nvm/34810922#34810922

## yarn

```zsh
% corepack enable
% cd
% yarn set version berry
➤ YN0000: Retrieving https://repo.yarnpkg.com/3.1.1/packages/yarnpkg-cli/bin/yarn.js
➤ YN0000: Saving the new release in .yarn/releases/yarn-3.1.1.cjs
➤ YN0000: Done in 0s 364ms
% yarn --version
3.1.1
```

- https://yarnpkg.com/getting-started/install
- https://yarnpkg.com/getting-started/migration

## Old: Node already installed, it's just not linked

`sudo chown -R $(whoami) $(brew --prefix)/*`

https://stackoverflow.com/questions/35249204/node-already-installed-its-just-not-linked/51044465#51044465
