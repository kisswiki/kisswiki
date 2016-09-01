## Install packages in home dir

```bash
npm config set prefix ~
echo export PATH=\$PATH:\~/bin >> ~/.bashrc
. ~/.bashrc
```

- http://stackoverflow.com/questions/10081293/install-npm-into-home-directory-with-distribution-nodejs-package-ubuntu/39280984#39280984
- http://stackoverflow.com/questions/19874582/change-default-global-installation-directory-for-node-js-modules-in-windows
