## The required dependency 'apt(>=2.1.10ubuntu0.3)' is not installed

> There is no supported release-upgrade path from 20.10 to 22.04, so it's unclear what you did. There used to be a path 20.10 to 21.04 to 21.10 to 22.04, but that path closed when the intermediate releases reached End Of Standard Support. Consider backing up your data and doing a fresh install of Ubuntu 22.04. It's likely to be the fastest and easiest way to get you there. https://askubuntu.com/questions/1485951/trying-to-upgrade-to-ubuntu-22-04-lts-apt-2-1-10ubuntu0-3#comment2602247_1485951

The repositories for older releases that are not supported (like 11.04, 11.10 and 13.04) get moved to an archive server. There are repositories available at http://old-releases.ubuntu.com.

The reason for this is that it is now out of support and no longer receiving updates and security patches.

I would urge you to consider a supported distribution. If your computer is too old in terms of memory or processor then you should consider a distribution such as Lubuntu or Xubuntu.

If you want to continue using an outdated release then edit /etc/apt/sources.list and change archive.ubuntu.com and security.ubuntu.com to old-releases.ubuntu.com.

You can do this with sed:

`sudo sed -i -re 's/([a-z]{2}\.)?archive.ubuntu.com|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list`

then update with:

`sudo apt-get update && sudo apt-get dist-upgrade`

To upgrade to a new release:

Once you have performed the above steps to switch to the old-releases mirrors, update the Update Manager and then do do-release-upgrade:

```
sudo apt-get update
sudo apt-get install ubuntu-release-upgrader-core
sudo do-release-upgrade
```

https://askubuntu.com/questions/91815/how-to-install-software-or-upgrade-from-an-old-unsupported-release/91821#91821

I have done `do-release-upgrade'  multiple  times until I got to Ubuntu 22.04

## screen glitches in settings - shows on mouse hover

Just update /etc/environment

`GSK_RENDERER=gl`

and restart.

https://askubuntu.com/questions/1511575/ubuntu-24-04-screen-glitches-on-gnome-apps-after-install

## extra display None-1-1

`echo 'GRUB_CMDLINE_LINUX_DEFAULT="$GRUB_CMDLINE_LINUX_DEFAULT initcall_blacklist=simpledrm_platform_driver_init"' | sudo tee /etc/default/grub.d/99_disable_simpledrm.cfg && sudo update-grub`

Disable simpledrm with kernel parameter https://askubuntu.com/questions/1509661/could-not-switch-the-monitor-configuration-on-none-1-1-connected-output/1514074#1514074

There is video about simpledrm https://www.youtube.com/watch?v=laFx6RQ3XJ4 - [source](https://www.reddit.com/r/pop_os/comments/1bvguqd/comment/ky1z1wn/)

This also worked for me, to disable this extra display with xorg, but kernel parameter seems better https://askubuntu.com/questions/1516532/how-do-disable-get-rid-of-prime-display/1516571#1516571

> I have updated my kernel to 6.9.3-76060903-generic which seems to have fixed this issue https://github.com/pop-os/pop/issues/3257#issuecomment-2179857725

## homebrew

`brew install neovim lazygit gdu`

`go-gdu`

I wanted to install neovim 0.10 but in Ubuntu there is 0.9.5. This thread suggested couple of ways https://www.reddit.com/r/neovim/comments/173sorr/the_neovim_ubuntu_ppa_is_a_year_behind/.

- compiling from source https://github.com/wookayin/dotfiles/blob/master/etc/linux-locals.sh#L314-L370
- bob - neovim version manager https://github.com/MordechaiHadad/bob
- appimage but no automatic updates https://github.com/neovim/neovim/blob/master/INSTALL.md#appimage-universal-linux-package
- pacstall but not tracked by repology https://repology.org/repository/pacstall
- asdf https://github.com/richin13/asdf-neovim
- brew https://docs.brew.sh/Homebrew-on-Linux
- unstable neovim ppa but it has v0.10-dev https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable
- mpr https://docs.makedeb.org/using-the-mpr/installing-packages/

Many people recommended brew to have up-to-date kubernetes etc. Also here https://news.ycombinator.com/item?id=31509790.

I've done comparision of brew and mpr:

- neovim 0.10 on brew and mpr https://repology.org/project/neovim/versions
- lazygit 0.42 on brew and mpr https://repology.org/project/lazygit/versions
- kubernetes 1.30.1 on brew and 1.26.3 on mpr https://repology.org/project/kubernetes/versions

More links:

- https://docs.makedeb.org/makedeb/comparisons-to-other-tools/
- https://stackoverflow.com/questions/77530952/how-to-fix-the-version-issue-between-neovim-and-lazyvim-on-ubuntu-20-or-22-versi

## gnome terminal

Alt+number to switch to tabs

ctrl+click on link

ctrl+shift+c to copy

ctrl+shift+v to paste

Can't map in neovim to using `<C-number>` because it strangely mapped https://vi.stackexchange.com/questions/19358/cannot-map-ctrl-number-except-6-or/19359#19359

## SymbolsNerdFontMono-Regular.ttf

https://github.com/ryanoasis/nerd-fonts/releases > NerdFontsSymbolsOnly.tar.xz > SymbolsNerdFontMono-Regular.ttf

## github ssh

I needed to update ssh keys to newer crypto

## Firefox

- Couldn't sync - too old version

### userChrome.css

`about:profiles`

`ln -s ~/.mozilla/firefox/shared/chrome ~/snap/firefox/ ~/snap/firefox/common/.mozilla/firefox/4nponp9u.default/`

`about:config`

`toolkit.legacyUserProfileCustomizations.stylesheets` to `true`

https://www.userchrome.org/how-create-userchrome-css.html

## kitty

- https://sw.kovidgoyal.net/kitty/binary/
