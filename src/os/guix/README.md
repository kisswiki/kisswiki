- https://bitbucket.org/julien1001/guix-packages
- https://www.gnu.org/software/guix/blog/2018/a-packaging-tutorial-for-guix/
- `./pre-inst-env guix` [Re: Guix packaging tutorial with hand holding](https://lists.gnu.org/archive/html/help-guix/2019-05/msg00496.html)
- temporary place for videos https://archive.org/details/guix-videos

## pin


> How can I fix this — how to get conkeror installed properly again?

Right.  You can pin it by running something like

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
