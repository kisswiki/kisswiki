- Development environment with Nix Flakes and Direnv https://gist.github.com/sagittaros/32dc6ffcbc423dc0fed7eef24698d5ca
- [numtide/devshell: Per project developer environments](https://github.com/numtide/devshell)
- https://nixos.org/guides/dev-environment.html
- https://nixos.org/guides/ad-hoc-developer-environments.html
- https://nixos.wiki/wiki/Language-specific_package_helpers
- https://myme.no/posts/2020-01-26-nixos-for-development.html
  - https://lobste.rs/s/jevfaf/nixos_for_developers
- https://nixos.org/guides/nix-pills/developing-with-nix-shell.html
- https://nix.dev/tutorials/declarative-and-reproducible-developer-environments
- https://nix.dev/tutorials/ad-hoc-developer-environments
- https://cbailey.co.uk/posts/my_usage_of_nix_and_lorri__direnv
- https://dev.to/ronenl/how-nix-shell-saved-our-teams-sanity-101k
- https://nix-tutorial.gitlabpages.inria.fr/nix-tutorial/first-package.html#build-environment
- https://discourse.nixos.org/t/nix-direnv-guide-your-new-maintainers/15453
  - https://github.com/cab404/nixdirenv/
  - https://github.com/bobvanderlinden/templates/tree/master/dev-shell
  - https://github.com/edolstra/flake-compat/blob/master/default.nix
  - https://github.com/cab404/templates
  - https://github.com/NixOS/templates
- https://github.com/nix-community/todomvc-nix
- https://mudrii.medium.com/building-reproducible-development-environment-b1d4fb51a302
- https://mudrii.medium.com/vscode-remote-ssh-development-with-nix-50223f816216
- Create highly reproducible python environments https://github.com/DavHau/mach-nix
  - Mach-nix is superb! It would be even greater if it supported pep517/pep518
- https://github.com/nix-community/lorri
  - [lorri - Your project's nix env (NixCon 2019) - YouTube](https://www.youtube.com/watch?v=WtbW0N8Cww4)
  - https://www.youtube.com/watch?v=WtbW0N8Cww4
  - lorri vs flakes https://github.com/target/lorri/issues/460
- https://blog.ysndr.de/posts/guides/2021-12-01-nix-shells/

## nodejs, npm

- https://github.com/mmahut/nixpkgs/tree/master/pkgs/development/web
- Making Cypress Work in NixOS https://www.fbrs.io/cypress/
- https://nixos.org/manual/nixpkgs/stable/#node.js
- https://discourse.nixos.org/t/how-to-use-node2nix-in-nix-derivation-correctly/15321
- https://lastlog.de/blog/posts/nix-language-atlas-javascript.html
- https://www.breakds.org/post/nix-shell-for-nodejs/
- https://discourse.nixos.org/t/why-am-i-getting-an-older-version-of-npm-when-i-have-nodejs/16015
- https://github.com/nix-community/awesome-nix#nodejs
  - https://github.com/nix-community/npmlock2nix
- https://rgoswami.me/posts/nix-shell-node/
- https://discourse.nixos.org/t/future-of-npm-packages-in-nixpkgs/14285
  - npm2nix vs node2nix https://discourse.nixos.org/t/future-of-npm-packages-in-nixpkgs/14285/10
  - https://github.com/nix-community/npmlock2nix
  - fetchyarn https://github.com/NixOS/nixpkgs/pull/138233

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

## libuuid

```
Error: libuuid.so.1: cannot open shared object file: No such file or directory
    at Module._extensions..node (node:internal/modules/cjs/loader:1183:18)
    at Object.nodeDevHook [as .node] (/home/roman/projects/codecharm/nexus/node_modules/node-dev/lib/hook.js:60:7)
    at Module.load (node:internal/modules/cjs/loader:981:32)
    at Function.Module._load (node:internal/modules/cjs/loader:822:12)
    at Module.require (node:internal/modules/cjs/loader:1005:19)
    at require (node:internal/modules/cjs/helpers:102:18)
    at Object.<anonymous> (/home/roman/projects/codecharm/nexus/node_modules/canvas/lib/bindings.js:3:18)
    at Module._compile (node:internal/modules/cjs/loader:1101:14)
    at Module._extensions..js (node:internal/modules/cjs/loader:1153:10)
    at Object.nodeDevHook [as .js] (/home/roman/projects/codecharm/nexus/node_modules/node-dev/lib/hook.js:60:7)
[ERROR] 15:16:31 Error: libuuid.so.1: cannot open shared object file: No such file or directory
```

Solution:

shell.nix:

```
{ pkgs ? import <nixpkgs> { } }:
with pkgs; mkShell {
  name = "node-dev-shell";
  # Attributes aren't interpolated by the shell, so $LD_LIBRARY_PATH ends up verbatim in your environment. You could remove it (if no users of this expr need it) or convert it to an export statement in shellHook, which runs as regular bash, including interpolation. https://stackoverflow.com/questions/69953573/nodejs-headless-gl-null-in-nixos/69953610?noredirect=1#comment123682825_69953610
  # https://github.com/albertgoncalves/ranim/blob/e59ee646c155fefba69b6f3b9aaad0402d360c2e/shell.nix#L37
  # test with `echo $LD_LIBRARY_PATH` after entering with nix-shell
  APPEND_LIBRARY_PATH = "${libuuid.out}/lib:${lib.makeLibraryPath [ libGL libuuid ]}";
  shellHook = ''
    export LD_LIBRARY_PATH="$APPEND_LIBRARY_PATH:$LD_LIBRARY_PATH"
  '';
}
```

```bash
$ nix-shell

$ echo $LD_LIBRARY_PATH | tr ':' '\n'
/nix/store/8pj8n7g8cfbbra79lmhc93nk5nv92drk-util-linux-2.37.2/lib
/nix/store/5icl3gj83q5ar5klx2lc61qyll669inw-libGL-1.3.4/lib
/nix/store/yxflij8cg4fgnzqmda91jx4d94jvkjf5-util-linux-2.37.2-lib/lib
/nix/store/ikh86qfbsi23iajdpbrf642q6v612cw8-telepathy-glib-0.24.2/lib
/nix/store/m8bmifhlakz1mlsz37ki6cwfw2nxry66-telepathy-logger-0.8.2/lib
```

- https://discourse.nixos.org/t/node2nix-issues/10762/2
- https://github.com/Automattic/node-canvas/issues/1893
