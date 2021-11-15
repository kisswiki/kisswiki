- [numtide/devshell: Per project developer environments](https://github.com/numtide/devshell)
- https://nixos.org/guides/dev-environment.html
- https://nixos.org/guides/ad-hoc-developer-environments.html
- https://nixos.wiki/wiki/Language-specific_package_helpers
- https://myme.no/posts/2020-01-26-nixos-for-development.html
  - https://lobste.rs/s/jevfaf/nixos_for_developers
- https://nixos.org/guides/nix-pills/developing-with-nix-shell.html

## nodejs, npm

- https://github.com/mmahut/nixpkgs/tree/master/pkgs/development/web
- Making Cypress Work in NixOS https://www.fbrs.io/cypress/
- https://nixos.org/manual/nixpkgs/stable/#node.js
- https://discourse.nixos.org/t/how-to-use-node2nix-in-nix-derivation-correctly/15321
- https://lastlog.de/blog/posts/nix-language-atlas-javascript.html
- https://www.breakds.org/post/nix-shell-for-nodejs/

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
