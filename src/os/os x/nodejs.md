## nvm

```zsh
% brew install nvm
# add initialization to ~/.zprofile
% nvm install --lts
% node -p "process.arch"
arm64
```

- https://stackoverflow.com/questions/65342769/install-node-on-m1-mac/65449002#65449002
- https://stackoverflow.com/questions/64002438/installing-node-lts-with-nvm-on-windows/65532065#65532065

## Old: Node already installed, it's just not linked

`sudo chown -R $(whoami) $(brew --prefix)/*`

https://stackoverflow.com/questions/35249204/node-already-installed-its-just-not-linked/51044465#51044465
