- Development environment with Nix Flakes and Direnv https://gist.github.com/sagittaros/32dc6ffcbc423dc0fed7eef24698d5ca
- [numtide/devshell: Per project developer environments](https://github.com/numtide/devshell)
- https://nixos.org/guides/dev-environment.html
- https://nixos.org/guides/ad-hoc-developer-environments.html
- https://nixos.wiki/wiki/Language-specific_package_helpers
- https://myme.no/posts/2020-01-26-nixos-for-development.html
  - https://lobste.rs/s/jevfaf/nixos_for_developers
- https://nixos.org/guides/nix-pills/developing-with-nix-shell.html
- https://nix.dev/tutorials/declarative-and-reproducible-developer-environments
- https://cbailey.co.uk/posts/my_usage_of_nix_and_lorri__direnv
- https://dev.to/ronenl/how-nix-shell-saved-our-teams-sanity-101k
- https://nix-tutorial.gitlabpages.inria.fr/nix-tutorial/first-package.html#build-environment
- https://discourse.nixos.org/t/nix-direnv-guide-your-new-maintainers/15453
  - https://github.com/cab404/nixdirenv/
  - https://github.com/bobvanderlinden/templates/tree/master/dev-shell
  - https://github.com/edolstra/flake-compat/blob/master/default.nix
  - https://github.com/cab404/templates
  - https://github.com/NixOS/templates

## nodejs, npm

- https://github.com/mmahut/nixpkgs/tree/master/pkgs/development/web
- Making Cypress Work in NixOS https://www.fbrs.io/cypress/
- https://nixos.org/manual/nixpkgs/stable/#node.js
- https://discourse.nixos.org/t/how-to-use-node2nix-in-nix-derivation-correctly/15321
- https://lastlog.de/blog/posts/nix-language-atlas-javascript.html
- https://www.breakds.org/post/nix-shell-for-nodejs/
- https://discourse.nixos.org/t/why-am-i-getting-an-older-version-of-npm-when-i-have-nodejs/16015

##

nodejs nix code, for my shell.nix file that i use with my (lorri+direnv+emacs-direnv) setup, to work on node projects in an isolated nix environment in emacs:

```nix
{ pkgs ? import <nixpkgs> {} }:
with pkgs;
mkShell
{
  buildInputs = with pkgs;
  [
  (with nodePackages;
  [
    node2nix
    nodejs-12_x
    bash-language-server
    dockerfile-language-server-nodejs
    eslint
    typescript
    typescript-language-server
    vscode-css-languageserver-bin
    vscode-html-languageserver-bin
    bashInteractive
  ])
  ]; # end of buildInputs

  shellHook =
  ''
  export EDITOR=emacs;
  '';
} # end of mkShell
```

https://www.reddit.com/r/NixOS/comments/i3cz4d/comment/g0i8vgr/

## nix-shell vs nix run vs nix shell

- https://discourse.nixos.org/t/advice-for-when-to-use-nix-run-versus-nix-shell/3694/2
- https://discourse.nixos.org/t/difference-between-nix-shell-and-nix-run/2951
- https://nixos.wiki/wiki/Nix_command/shell
- https://github.com/nixcloud/nix-shell-workshop

## I would not use pkgs ? import <nixpkgs> {} for developing environments which are not tied to the current system you are running on

instead import e.g. in `let` area via a variable

https://stackoverflow.com/questions/66124085/how-to-find-the-commit-a-nix-channel-points-to/66720361#66720361
