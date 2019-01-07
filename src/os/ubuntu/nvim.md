```bash
$ (cd ~/bin && curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage)
$ chmod u+x nvim.appimage
$ echo "alias nvim='~/bin/nvim.appimage'" >> ~/.bashrc
```

To easy update:

```bash
$ echo 'alias updnvim="(cd ~/bin && rm nvim.appimage && curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage && chmod +x nvim.appimage)"' >> ~/.bashrc
$ source ~/.bashrc
$ updnvim
```

- https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package
