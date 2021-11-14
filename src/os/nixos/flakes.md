- [divnix/digga: A a flake utility library to craft shell-, home-, and hosts- environments.](https://github.com/divnix/digga)
- [Flakes - NixOS Wiki](https://nixos.wiki/wiki/Flakes)

## About

pimeys

There are some new terms you hear when you first start using NixOS. One is flakes, that is very vague and academic at first, but when you understand what it does it is almost as hard to go back to Nix without them as it is for seasoned NixOS user to go back to using other operating systems. With flakes, you have two files:

- `flake.nix` lists inputs, such as git repositories, of nix build instructions for fetching packages and functions to your system.

- `flake.lock` is like your normal `Cargo.lock` that sets the exact commits of all inputs, freezing the versions of all software in your system.

This means I can mix things really nicely in my system. I can use the master branch of Sway, the pgtk version of Emacs with Wayland support from the emacs version control (not even master branch) and mix and match things from different NixOS versions. I can even fork the NixOS monorepo, do some changes and add them to all of my systems before my PR gets merged.

The `flake.lock`, which I commit to my repository, forces every single computer I have to use exactly these versions of the software with the configuration I give. It will always lead to the exact same result when I `nixos-rebuild switch`. When I want to update my packages, I go to the repo and say `nix flake update`, then switch to the new versions and only if everything worked with the new packages, I commit the `flake.lock` and it works everywhere else the same.

https://news.ycombinator.com/item?id=28796501

Tzarius

Yeah. I can imagine Flakes catching on with the data science people, especially with the Replication Crisis. Oh you want to start my years-old heavily customized Jupyter notebook, and run it to recreate my results? Literally one line on any Nix machine: nix run github:foo/bar

(Hopefully the Flakes version of Nix gets released soon, and JupyterWith gets [the flake treatment](https://github.com/tweag/jupyterWith/issues/99)!)

https://www.reddit.com/r/NixOS/comments/kpntby/comment/gi25s47/?utm_source=reddit&utm_medium=web2x&context=3

Zopieux

Want a quick fix in a package eg. version bump? Overlays still feel very cumbersome to use and PRs to upstream take months to get reviewed. Maybe flakes or something else will fix that eventually.

https://www.reddit.com/r/NixOS/comments/kpntby/comment/gi2r9u3/?utm_source=reddit&utm_medium=web2x&context=3
