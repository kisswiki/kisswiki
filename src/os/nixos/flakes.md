## RFC

### Summary

This RFC proposes a mechanism to package Nix expressions into composable entities called "flakes". Flakes allow hermetic, reproducible evaluation of multi-repository Nix projects; impose a discoverable, standard structure on Nix projects; and replace previous mechanisms such as Nix channels and the Nix search path.

### Motivation

Flakes are motivated by a number of serious shortcomings in Nix:

While Nix pioneered reproducible builds, sadly, Nix expressions are not nearly as reproducible as Nix builds. Nix expressions can access arbitrary files (such as ~/.config/nixpkgs/config.nix), environment variables, and Git repositories. This means for instance that it is hard to ensure reproducible evaluation of NixOS or NixOps configurations.

Nix projects lack discoverability and a standard structure. For example, it's just convention that a repository has a release.nix for Hydra jobs and a default.nix for packages.

There is no standard way to compose Nix projects. Typical ways are to rely on the Nix search path (e.g. import <nixpkgs>) or to use fetchGit or fetchTarball. The former has poor reproducibility, while the latter is bad UX because of the need to manually update Git hashes to update dependencies.

nix-channel needs a replacement: channels are hard to create, users cannot easily pin specific versions of channels, channels interact in ad hoc ways with the Nix search path, and so on.

The flakes mechanism seeks to address all these problems. This RFC, however, only describes the format and semantics of flakes; it doesn't describe changes to the nix command to support flakes.

https://github.com/NixOS/rfcs/pull/49

##

- https://serokell.io/blog/practical-nix-flakes
- https://www.tweag.io/blog/2020-07-31-nixos-flakes/
- [divnix/digga: A a flake utility library to craft shell-, home-, and hosts- environments.](https://github.com/divnix/digga)
- https://nixos.wiki/wiki/Flakes
- [gytis-ivaskevicius/flake-utils-plus: Use Nix flakes without any fluff.](https://github.com/gytis-ivaskevicius/flake-utils-plus)
- [Make JupyterWith a Flake · Issue #99 · tweag/jupyterWith](https://github.com/tweag/jupyterWith/issues/99)
- [rfcs/0049-flakes.md at 8c36f764fbae6a09b06fe2a35b5828e79e24d950 · NixOS/rfcs](https://github.com/NixOS/rfcs/blob/8c36f764fbae6a09b06fe2a35b5828e79e24d950/rfcs/- 0049-flakes.md)
- uses flakes and is simple https://github.com/srid/nixos-config

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

qqlq

It’s good the author addresses the value of pinning channels, such as nixpkgs. Otherwise the dependencies aren’t really deterministic as nix will use the latest version.

For me the biggest advantage of nix is that I can keep globally installed packages down to a minimum. Build dependencies are only installed/updated upon entering a nix shell.

myme

Initially I though this was just being overly cautious, especially for ad-hoc development environments for e.g. other people’s projects not catered for nix. In reality though, both projects and nixpkgs quickly advance enough to make this a legitimate problem. I’ve since started taking pinning more seriously and do for most of my projects. Especially considering an upgrade is a relatively easy task.

For my $HOME I’ve recently moved to https://github.com/rycee/home-manager - which is sweet. But still try to keep both my global system, and user environment down to a minimum. Nix shell (combined with direnv) makes adding whatever extra tools you need very easy imo.

danieldk

Thanks for the nice article!

In reality though, both projects and nixpkgs quickly advance enough to make this a legitimate problem.

I have encountered the same (in particularly nixpkgs-unstable) and have also started pinning in projects. Until flakes are adopted, I am using niv, which is really nice for adding package sets, pinning them, and updating them.

https://lobste.rs/s/jevfaf/nixos_for_developers#c_targav

## overlays or overrides defined

> Can `nix-env -qa -f $commit` on one machine can have different output than `nix-env -qa -f $commit` on another machine/OS?

Yes, since the machine could have overlays or overrides defined. This is one one of the issues that flakes attempt to solve (avoiding that external state influences the evaluation).

https://discourse.nixos.org/t/clarification-on-package-names-and-versions/9819/2

## monorepo vs flakes

I think that flakes are an official effort to move in that direction. The ability to include multiple repos eliminates the need for a mono repo.

https://www.reddit.com/r/NixOS/comments/j4k2zz/comment/g7m5igw/

## nix develop vs nix-shell

with flakes it’s better to use nix develop instead of nix-shell.

https://www.reddit.com/r/NixOS/comments/j4k2zz/comment/g94x37t/
