- https://bitbucket.org/julien1001/guix-packages
- https://www.gnu.org/software/guix/blog/2018/a-packaging-tutorial-for-guix/
- `./pre-inst-env guix` [Re: Guix packaging tutorial with hand holding](https://lists.gnu.org/archive/html/help-guix/2019-05/msg00496.html)
- temporary place for videos https://archive.org/details/guix-videos

## pin

> How can I fix this — how to get conkeror installed properly again?

Right. You can pin it by running something like

`./pre-inst-env guix environment --root=~/.config/guix/conkeror --ad-hoc conkeror`

in a git checkout that still has conqueror.

https://lists.gnu.org/archive/html/help-guix/2019-06/msg00021.html

## Guix matters

- https://gitlab.com/ambrevar/ambrevar.gitlab.io/tree/master/source/guix-matters
  - https://lists.gnu.org/archive/html/help-guix/2020-01/msg00002.html
  - https://ambrevar.xyz/guix-matters
  - https://www.reddit.com/r/GUIX/comments/esdhui/why_gnu_guix_matters/

## Linux kernel with non-free firmware

- https://gitlab.com/nonguix/nonguix

## Tutorials

- https://zge.us.to/guix.html
  - https://www.reddit.com/r/linux/comments/dkm7u4/attempting_to_use_gnu_guix/
  - https://www.reddit.com/r/GUIX/comments/dkq2zr/attempting_to_use_gnu_guix/

## Some package does not build anymore

I'm not familiar with the fenics package, but presumably it built just fine when it was committed, and you could still build and install it today using that commit.

They don't do this for every package update, but for larger disruptive changes they do try to minimize breakage. As a small volunteer project though, they do tolerate some broken packages to avoid grinding development to a halt.

https://www.reddit.com/r/GUIX/comments/dkq2zr/attempting_to_use_gnu_guix/f4kcsbz/

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
