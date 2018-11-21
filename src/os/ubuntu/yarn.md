go back to version 0.27.5:

```bash
sudo apt remove yarn -y
wget https://github.com/yarnpkg/yarn/releases/download/v0.27.5/yarn_0.27.5_all.deb
sudo dpkg -i yarn_0.27.5_all.deb
rm yarn_0.27.5_all.deb
```

## ERROR: There are no scenarios; must have at least one.

```bash
$ yarn
00h00m00s 0/0: : ERROR: There are no scenarios; must have at least one.
```

```bash
$ sudo apt remove cmdtest
```

Install yarn like described here https://yarnpkg.com/lang/en/docs/install/#debian-stable

- https://github.com/yarnpkg/yarn/issues/3189#issuecomment-305028973
