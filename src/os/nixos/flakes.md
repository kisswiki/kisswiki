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

## Links

- https://serokell.io/blog/practical-nix-flakes
- https://www.tweag.io/blog/2020-07-31-nixos-flakes/
- [divnix/digga: A a flake utility library to craft shell-, home-, and hosts- environments.](https://github.com/divnix/digga)
- https://nixos.wiki/wiki/Flakes
- [gytis-ivaskevicius/flake-utils-plus: Use Nix flakes without any fluff.](https://github.com/gytis-ivaskevicius/flake-utils-plus)
- [Make JupyterWith a Flake · Issue #99 · tweag/jupyterWith](https://github.com/tweag/jupyterWith/issues/99)
- [rfcs/0049-flakes.md at 8c36f764fbae6a09b06fe2a35b5828e79e24d950 · NixOS/rfcs](https://github.com/NixOS/rfcs/blob/8c36f764fbae6a09b06fe2a35b5828e79e24d950/rfcs/- 0049-flakes.md)
- uses flakes and is simple https://github.com/srid/nixos-config
- https://github.com/colemickens/nixos-flake-example
- [Intro to Flakes](https://www.youtube.com/watch?v=K54KKAx2wNc)
- [Moving Nixos System Configuration Into A Flake](https://www.youtube.com/watch?v=mJbQ--iBc1U)
- https://github.com/edolstra/flake-compat/blob/master/default.nix
- https://github.com/cab404/templates
- https://github.com/NixOS/templates
- https://www.reddit.com/r/NixOS/comments/on2u08/users_who_have_transitioned_to_flakesnixunstable/
- https://discourse.nixos.org/t/manage-whole-system-with-flakes/16114
  - https://mudrii.medium.com/nixos-native-flake-deployment-with-luks-drive-encryption-and-lvm-b7f3738b71ca
  - https://mudrii.medium.com/nixos-home-manager-on-native-nix-flake-installation-and-configuration-22d018654f0c
  - https://www.tweag.io/blog/2020-07-31-nixos-flakes/
  - https://github.com/hlissner/dotfiles/

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

https://www.reddit.com/r/NixOS/comments/kpntby/comment/gi25s47/

Zopieux

Want a quick fix in a package eg. version bump? Overlays still feel very cumbersome to use and PRs to upstream take months to get reviewed. Maybe flakes or something else will fix that eventually.

https://www.reddit.com/r/NixOS/comments/kpntby/comment/gi2r9u3/

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

I would point out that there are some oddities about flakes still (recently someone asked why local flakes are copied into the nix store constantly, for example, which causes tons of write and disk usage overhead for the smallest change).

They’ll probably get ironed out over time, but this may be a long process. The UX isn’t perfect yet, so going into it expecting perfection may leave you disappointed - and trying to get someone who objects to the usage of nix in the first place (as is more likely when you’re not in these parts) to accept flakes may be utterly impossible.

Figuring out how flakes work and how to use them also took a deep dive into nixpkgs for me, which made me finally learn how it all works, but may also be mildly frustrating, especially since documentation is sparse.

I keep meaning to write a basic set of goal-oriented “howtos” to try and document the what and how of flakes.

All of that said, personally, I think flakes are a much more explicit way of managing the things nix can do, and they are very nice for a wide range of use cases non-flake nix only marginally supports. I think it would be a major step backwards to not continue stabilizing the feature.

https://discourse.nixos.org/t/about-the-gap-of-nix/16098/3

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

## deploy-rs

w00t_loves_you

As I understand it, flakes pin a configuration and all dependencies, right?

So how does deploy-rs work with flakes? Did you need to do anything special, or do the flakes do the heavy lifting and you needed to make sure the tool was aware of them?

balsoft

Not really, we just use some flake-specific features to make sure deployments are more reproducible (because of pinning and pure mode), convinient (because of new nix UI) and safe (thanks to nix flake check).

https://www.reddit.com/r/NixOS/comments/k0utpw/comment/gdlb9ey/

## quick start

Following https://serokell.io/blog/practical-nix-flakes

github:nixos/nixpkgs points to master

```
$ nix flake show github:nixos/nixpkgs
github:nixos/nixpkgs/75b645529450fd4bac3b897dc1fab1701ade3465
├───checks
│   └───x86_64-linux
│       └───tarball: derivation 'nixpkgs-tarball-21.11pre20211116.75b6455
#...
$ nix flake show github:nixos/nixpkgs/nixpkgs-unstable
github:nixos/nixpkgs/5cb226a06c49f7a2d02863d0b5786a310599df6b
├───checks
│   └───x86_64-linux
│       └───tarball: derivation 'nixpkgs-tarball-21.11pre20211114.5cb226a'
$ nix flake metadata nixpkgs
Resolved URL:  github:NixOS/nixpkgs
Locked URL:    github:NixOS/nixpkgs/75b645529450fd4bac3b897dc1fab1701ade3465
Description:   A collection of packages for the Nix package manager
Path:          /nix/store/wcx0dv7pzadcnvvg7d62c2q6q6db1yaa-source
Revision:      75b645529450fd4bac3b897dc1fab1701ade3465
Last modified: 2021-11-16 21:50:30
Inputs:

$ nix flake metadata nixpkgs/nixpkgs-unstable
Resolved URL:  github:NixOS/nixpkgs/nixpkgs-unstable
Locked URL:    github:NixOS/nixpkgs/5cb226a06c49f7a2d02863d0b5786a310599df6b
Description:   A collection of packages for the Nix package manager
Path:          /nix/store/r85b90gdvvpfl04rnn2aisr6jggi2pp0-source
Revision:      5cb226a06c49f7a2d02863d0b5786a310599df6b
Last modified: 2021-11-14 11:40:46
Inputs:
```
