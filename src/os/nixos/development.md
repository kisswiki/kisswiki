- https://www.heinrichhartmann.com/posts/2021-08-08-nix-emacs/

## override

- https://nixos.org/manual/nixpkgs/stable/#chap-overrides
- https://discourse.nixos.org/t/how-to-override-package-version/2889/12
- https://nixos.wiki/wiki/Overlays
- https://nixos.wiki/wiki/Nixpkgs/Modifying_Packages
- https://stackoverflow.com/questions/65970915/how-can-i-override-a-package-source-in-nix
- https://ryantm.github.io/nixpkgs/using/overrides/
- https://ianthehenry.com/posts/how-to-learn-nix/overriding/
- https://stackoverflow.com/questions/36000514/how-to-override-2-two-packages-in-nixos-configuration-nix
- I've converted an overlay to a packageOverrides construct lately because the overlay took too much memory to evaluate https://github.com/NixOS/nixpkgs/issues/43266#issuecomment-407055671

## nix path-info

`ls $(nix path-info nixpkgs.gitFull)/libexec/git-core/git-gui`

https://github.com/NixOS/nixpkgs/issues/55071#issuecomment-461877147
