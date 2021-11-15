- https://www.heinrichhartmann.com/posts/2021-08-08-nix-emacs/
- https://nixos.org/manual/nix/stable/introduction.html
- https://nixos.wiki/wiki/Nixpkgs/Update_a_package
- https://nix-tutorial.gitlabpages.inria.fr/nix-tutorial/first-package.html

## override

- [Overrides: In and Out (NixCon 2019) - YouTube](https://www.youtube.com/watch?v=6VepnulTfu8)
- https://nixos.org/manual/nixpkgs/stable/#chap-overrides
- https://discourse.nixos.org/t/how-to-override-package-version/2889/12
- https://nixos.wiki/wiki/Overlays
- https://nixos.wiki/wiki/Nixpkgs/Modifying_Packages
- https://stackoverflow.com/questions/65970915/how-can-i-override-a-package-source-in-nix
- https://ryantm.github.io/nixpkgs/using/overrides/
- https://ianthehenry.com/posts/how-to-learn-nix/overriding/
- https://stackoverflow.com/questions/36000514/how-to-override-2-two-packages-in-nixos-configuration-nix
- I've converted an overlay to a packageOverrides construct lately because the overlay took too much memory to evaluate https://github.com/NixOS/nixpkgs/issues/43266#issuecomment-407055671
- https://nixos.org/guides/nix-pills/override-design-pattern.html

## nix path-info

`ls $(nix path-info nixpkgs.gitFull)/libexec/git-core/git-gui`

https://github.com/NixOS/nixpkgs/issues/55071#issuecomment-461877147

## explore package and add some package

```bash
$ nix-shell -E 'with import <nixpkgs> {}; gnused.overrideAttrs (oldAttrs: { buildInputs = [ ctags ]: })'
$ unpackPhase
$ cd sed-4.8
$ configurePhase
$ buildPhase
```

https://stackoverflow.com/questions/63966084/what-is-the-equivilent-shell-nix-for-nix-shell-nixpkgs-a-gnused

## open nix file for package

`nix edit nixpkgs.gnused`

- https://stackoverflow.com/questions/63966084/what-is-the-equivilent-shell-nix-for-nix-shell-nixpkgs-a-gnused
- https://nixos.wiki/wiki/Nix_command/edit
- https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-edit.html

##

siraben

I found reading code from Nixpkgs to be very valuable as well, and can't recommend it enough. I managed to get by using NixOS without writing my own derivations for several months until I inevitably ran into a need to package something new. Even then, Nix Pills isn't a super useful reference, it's sort of like learning Git by understanding blobs, too focused on details.
Another pain point is looking for documentation of Nix library functions, I've solved this by using Manix[0]

[0] https://github.com/mlvzk/manix

alephu5

I find nix pills hard to digest since they use the repl, and for a newbie it's hard to see how they apply to real-world packing of something like a python application.
This video helped me a lot though, but unfortunately there are a few minutes of broken audio in the middle https://youtu.be/2mG0zM_wtYs

https://news.ycombinator.com/item?id=25191466
