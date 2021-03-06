- https://www.reddit.com/r/emacs/comments/8tovcg/ask_reddit_remacs_whos_using_remacs/

## To compile on Ubuntu 18.04 WSL

Install deps:


```
# https://stackoverflow.com/questions/19510522/in-centos-6-4-when-configure-emacs/33249788#33249788
# texinfo required for makeinfo https://stackoverflow.com/questions/338317/what-is-makeinfo-and-how-do-i-get-it
# gnutls-dev required for gnutls
# libncurses-dev required for tputs https://stackoverflow.com/questions/19510522/in-centos-6-4-when-configure-emacs/33249788#33249788
sudo apt install clang build-essential autoconf texinfo gnutls-dev libncurses-dev pkg-config
```

## Install locally

Installing it globally required cargo installed globally https://github.com/Wilfred/remacs/issues/1162

```bash
$ ./autogen.sh
$ ./configure --prefix=$HOME/installed/remacs
$ make
$ make install
```

You want to install in other directory, i.e. `~/installed/remacs` bc there is [problem with `make uninstall`](https://github.com/Wilfred/remacs/issues/779), you may need to change exec in remacs.desktop

and then to [validate and install it locally](https://askubuntu.com/questions/375975/how-to-force-unity-reload-local-share-applications):

`desktop-file-install --dir=$HOME/.local/share/applications ~/installed/remacs/share/applications/remacs.desktop`

And copy icons:

`cp -r ~/installed/remacs/share/icons/hicolor/ ~/.local/share/icons/`


You may also opt for creating native package, for example deb:

- https://blog.packagecloud.io/debian/debuild/packaging/2015/06/08/buildling-deb-packages-with-debuild/
- https://blog.packagecloud.io/eng/2016/12/15/howto-build-debian-package-containing-simple-shell-scripts/
- http://www.sj-vs.net/creating-a-simple-debian-deb-package-based-on-a-directory-structure/
- https://askubuntu.com/questions/146343/how-to-create-a-deb-package-that-installs-a-series-of-files
- https://fpm.readthedocs.io/en/latest/source/dir.html
- https://www.krakend.io/blog/automating-linux-packaging/


### Links

- https://askubuntu.com/questions/601000/difference-between-desktop-install-and-copying-desktop-file-to-applications-dire
- https://stackoverflow.com/questions/26080096/installed-desktop-file-to-have-users-home-directory-path-inserted
