- <https://bitbucket.org/julien1001/guix-packages>
- <https://www.gnu.org/software/guix/blog/2018/a-packaging-tutorial-for-guix/>
- `./pre-inst-env guix` [Re: Guix packaging tutorial with hand holding](https://lists.gnu.org/archive/html/help-guix/2019-05/msg00496.html)
- temporary place for videos <https://archive.org/details/guix-videos>

## pin

> How can I fix this — how to get conkeror installed properly again?

Right. You can pin it by running something like

`./pre-inst-env guix environment --root=~/.config/guix/conkeror --ad-hoc conkeror`

in a git checkout that still has conqueror.

<https://lists.gnu.org/archive/html/help-guix/2019-06/msg00021.html>

## Guix matters

- <https://gitlab.com/ambrevar/ambrevar.gitlab.io/tree/master/source/guix-matters>
  - <https://lists.gnu.org/archive/html/help-guix/2020-01/msg00002.html>
  - <https://ambrevar.xyz/guix-matters>
  - <https://www.reddit.com/r/GUIX/comments/esdhui/why_gnu_guix_matters/>

## Linux kernel with non-free firmware

- <https://gitlab.com/nonguix/nonguix>

## Tutorials

- <https://zge.us.to/guix.html>
  - <https://www.reddit.com/r/linux/comments/dkm7u4/attempting_to_use_gnu_guix/>
  - <https://www.reddit.com/r/GUIX/comments/dkq2zr/attempting_to_use_gnu_guix/>

## Some package does not build anymore

I'm not familiar with the fenics package, but presumably it built just fine when it was committed, and you could still build and install it today using that commit.

They don't do this for every package update, but for larger disruptive changes they do try to minimize breakage. As a small volunteer project though, they do tolerate some broken packages to avoid grinding development to a halt.

<https://www.reddit.com/r/GUIX/comments/dkq2zr/attempting_to_use_gnu_guix/f4kcsbz/>

## Links

- [Proprietary nvidia driver : GUIX](https://www.reddit.com/r/GUIX/comments/lhpg87/proprietary_nvidia_driver/)
- [nvidia libs (!72) · Merge requests · Nonguix / nonguix · GitLab](https://gitlab.com/nonguix/nonguix/-/merge_requests/72)
- [nongnu/packages/nvidia.scm · master · Nonguix / nonguix · GitLab](https://gitlab.com/nonguix/nonguix/-/blob/master/nongnu/packages/nvidia.scm)
- [Add Nvidia drivers (#31) · Issues · Nonguix / nonguix · GitLab](https://gitlab.com/nonguix/nonguix/-/issues/31)
- [guix-channel/README.org at master · lihebi/guix-channel · GitHub](https://github.com/lihebi/guix-channel/blob/master/README.org)
- [Guix doesn't package proprietary software. | Hacker News](https://news.ycombinator.com/item?id=19807442)
- [This is trivial to do on NixOS: services.xserver.videoDrivers = \[ &quot;nvidia&quot; \]; Fo... | Hacker News](https://news.ycombinator.com/item?id=19809419)
- [guix.git - GNU Guix and GNU Guix System](https://git.savannah.gnu.org/cgit/guix.git/commit/gnu/packages/gimp.scm?id=0cb4ef1c7f8b2f14f1dfa588949fb16b918731c5)
- [gimp packages - Repology](https://repology.org/project/gimp/packages)
- [Re: WebP in GIMP](https://lists.gnu.org/archive/html/help-guix/2020-02/msg00004.html)
- [Guix issue tracker](https://issues.guix.gnu.org/search?query=gtk+is%3Aopen)
- [History for gnu/packages/gimp.scm - guix-mirror/guix](https://github.com/guix-mirror/guix/commits/0cb4ef1c7f8b2f14f1dfa588949fb16b918731c5/gnu/packages/gimp.scm)
- [Steam does not see all directories (#142) · Issues · Nonguix / nonguix · GitLab](https://gitlab.com/nonguix/nonguix/-/issues/142)
- [nongnu/packages/steam-client.scm · master · Nonguix / nonguix · GitLab](https://gitlab.com/nonguix/nonguix/-/blob/master/nongnu/packages/steam-client.scm)
- [nongnu/packages/steam-client.scm · master · Nonguix / nonguix · GitLab](https://gitlab.com/nonguix/nonguix/-/blob/master/nongnu/packages/steam-client.scm)
- [Index of /steam/archive/precise/](http://repo.steampowered.com/steam/archive/precise/)
- [My Year With GNU Guix - Elais Codes](https://elais.codes/my-year-with-gnu-guix.html)
- [Haunt — dthompson](https://dthompson.us/projects/haunt.html)
- [Sites (Haunt Reference Manual)](https://dthompson.us/manuals/haunt/Sites.html#Sites)
- [Skribilo User Manual](http://www.nongnu.org/skribilo/doc/user-3.html#skribe-syntax)
- [guix-users/guix-nonfree: Unofficial collection of packages that are not going to be accepted in to guix](https://github.com/guix-users/guix-nonfree)
- [Post your custom free and non free channels! : GUIX](https://www.reddit.com/r/GUIX/comments/d22ve3/post_your_custom_free_and_non_free_channels/)
- [BIMSBbioinfo/guix-bimsb-nonfree: GNU Guix package definitions for proprietary software, or software with unclear licenses.](<https://github.com/BIMSBbioinfo/-> guix-bimsb-nonfree)
- [thomassgn/guixsd-configuration: Configuration files for GuixSD. @ e8404bd617547b41d57bceaaa880ca8109360e03 - NotABug.org: Free code hosting](<https://notabug.org/-> thomassgn/guixsd-configuration/src/e8404bd617547b41d57bceaaa880ca8109360e03/modules/linux-nonfree.scm)
- [Installing Guix as a Complete GNU/Linux System - System Crafters](https://systemcrafters.cc/craft-your-system-with-guix/full-system-install/)
- [Guix: A most advanced operating system](https://ambrevar.xyz/guix-advance/)
- [Is it possible to run only specific non-free firmware with the libre-kernel? : GUIX](<https://www.reddit.com/r/GUIX/comments/nvvfdq/-> is_it_possible_to_run_only_specific_nonfree/)
- [Why GNU Guix matters](https://ambrevar.xyz/guix-matters/index.html)
- [Solene'% : Extend Guix Linux with the nonguix repository](https://dataswamp.org/~solene/2021-05-27-guix-non-free.html)
- [Issues · Nonguix / nonguix · GitLab](https://gitlab.com/nonguix/nonguix/-/issues)
- [steam does not render large mode (#139) · Issues · Nonguix / nonguix · GitLab](https://gitlab.com/nonguix/nonguix/-/issues/139)
- [Guix: The most advanced operating system | Lobsters](https://lobste.rs/s/dsqbcn/guix_most_advanced_operating_system)
- [Installing Guix as a Complete GNU/Linux System • EasyTuto](https://easytuto.net/installing-guix-as-a-complete-gnu-linux-system/)
- [Elias Mårtenson: &quot;I'm trying out Guix. Are there third-party reposi…&quot; - Functional Café](https://functional.cafe/@loke/101880283824975257)
- [GNU Guix - Wikipedia](https://en.m.wikipedia.org/wiki/GNU_Guix)
- [dotfiles/latitude.scm at master · tauoverpi/dotfiles](https://github.com/tauoverpi/dotfiles/blob/master/latitude.scm)
- [dotfiles/thinkpad.scm at master · tauoverpi/dotfiles](https://github.com/tauoverpi/dotfiles/blob/master/thinkpad.scm)
- [dotfiles/tuxedo.scm at master · tauoverpi/dotfiles](https://github.com/tauoverpi/dotfiles/blob/master/tuxedo.scm)
- [GNU Guix Cookbook](https://guix.gnu.org/en/cookbook/en/guix-cookbook.html)
- [Getting Started (GNU Guix Reference Manual)](https://guix.gnu.org/manual/en/html_node/Getting-Started.html)
- [guix home: How it works internally? - YouTube](https://www.youtube.com/watch?v=t3zRzQnarUI)
- [Invoking guix home (GNU Guix Reference Manual)](https://guix-home.trop.in/Invoking-guix-home.html)
- [guix home: on-reconfigure and symlink-manager - YouTube](https://www.youtube.com/watch?v=ZRQtCvo8MoM)
- [Guix replacement for home manager : GUIX](https://www.reddit.com/r/GUIX/comments/ojl86n/guix_replacement_for_home_manager/)
- [Re: Updates on the guix home manager](https://lists.gnu.org/archive/html/guix-devel/2019-09/msg00218.html)
- [awesome-guix: Awesome things built with or for GNU Guix](https://sr.ht/~lle-bout/awesome-guix/)
- [&gt; - I don't see a word about GuixSD there - what's the status of this? Is it als... | Hacker News](https://news.ycombinator.com/item?id=19811015)
- [nonguix vs Home Manager using Nix - compare differences and reviews?](https://www.libhunt.com/compare-nonguix-vs-home-manager)
- [roptat : &quot;So, I've written this small extension to #guix la…&quot; - Framapiaf](https://framapiaf.org/@roptat/102338659868214361)
- [Best way to do declarative package management - Learn - NixOS Discourse](https://discourse.nixos.org/t/best-way-to-do-declarative-package-management/7920)
- [guix-users/guix-nonfree: Unofficial collection of packages that are not going to be accepted in to guix](https://github.com/guix-users/guix-nonfree)
- [Post your custom free and non free channels! : GUIX](https://www.reddit.com/r/GUIX/comments/d22ve3/post_your_custom_free_and_non_free_channels/)
- [BIMSBbioinfo/guix-bimsb-nonfree: GNU Guix package definitions for proprietary software, or software with unclear licenses.](<https://github.com/BIMSBbioinfo/-> guix-bimsb-nonfree)
- [thomassgn/guixsd-configuration: Configuration files for GuixSD. @ e8404bd617547b41d57bceaaa880ca8109360e03 - NotABug.org: Free code hosting](<https://notabug.org/-> thomassgn/guixsd-configuration/src/e8404bd617547b41d57bceaaa880ca8109360e03/modules/linux-nonfree.scm)
- [Installing Guix as a Complete GNU/Linux System - System Crafters](https://systemcrafters.cc/craft-your-system-with-guix/full-system-install/)
- [Guix: A most advanced operating system](https://ambrevar.xyz/guix-advance/)
- [Is it possible to run only specific non-free firmware with the libre-kernel? : GUIX](<https://www.reddit.com/r/GUIX/comments/nvvfdq/-> is_it_possible_to_run_only_specific_nonfree/)
- [Why GNU Guix matters](https://ambrevar.xyz/guix-matters/index.html)
- [Solene'% : Extend Guix Linux with the nonguix repository](https://dataswamp.org/~solene/2021-05-27-guix-non-free.html)
- [Issues · Nonguix / nonguix · GitLab](https://gitlab.com/nonguix/nonguix/-/issues)
- [nvidia-driver fails to build with linux 5.13 (#130) · Issues · Nonguix / nonguix · GitLab](https://gitlab.com/nonguix/nonguix/-/issues/130)
- [steam does not render large mode (#139) · Issues · Nonguix / nonguix · GitLab](https://gitlab.com/nonguix/nonguix/-/issues/139)
- [Guix: The most advanced operating system | Lobsters](https://lobste.rs/s/dsqbcn/guix_most_advanced_operating_system)
- [Installing Guix as a Complete GNU/Linux System • EasyTuto](https://easytuto.net/installing-guix-as-a-complete-gnu-linux-system/)
- [Elias Mårtenson: &quot;I'm trying out Guix. Are there third-party reposi…&quot; - Functional Café](https://functional.cafe/@loke/101880283824975257)
- [GNU Guix - Wikipedia](https://en.m.wikipedia.org/wiki/GNU_Guix)
- [dotfiles/latitude.scm at master · tauoverpi/dotfiles](https://github.com/tauoverpi/dotfiles/blob/master/latitude.scm)
- [dotfiles/thinkpad.scm at master · tauoverpi/dotfiles](https://github.com/tauoverpi/dotfiles/blob/master/thinkpad.scm)
- [dotfiles/tuxedo.scm at master · tauoverpi/dotfiles](https://github.com/tauoverpi/dotfiles/blob/master/tuxedo.scm)
