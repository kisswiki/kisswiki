- https://github.com/jonringer/nixpkgs-config
- https://github.com/pimeys/nixos
- https://github.com/ttuegel/nixos-config
- template for NixOS users, with consideration for common tools like home-manager, devshell, and more https://github.com/divnix/devos
  - https://www.reddit.com/r/NixOS/comments/j4k2zz/comment/g94wjsc/
    - https://github.com/divnix/devos/issues?page=2&q=is%3Aissue+is%3Aopen
  - https://devos.divnix.com/concepts
- https://github.com/jtojnar/nixfiles
- [nix-community/home-manager: Manage a user environment using Nix \[maintainer=@rycee\]](https://github.com/nix-community/home-manager)
- https://github.com/k4leg/nixos-configuration
- uses flakes and is simple https://github.com/srid/nixos-config
  - https://lobste.rs/s/jevfaf/nixos_for_developers#c_0pcwut
- https://discourse.nixos.org/t/where-does-personal-configuration-go/7646
- https://discourse.nixos.org/t/how-do-you-organize-your-configuration/7306/7
- https://nixos.wiki/wiki/Configuration_Collection

## no system packages

myme

I go for a middle ground here. I basically have no system packages. This is just to keep the /etc/nixos/configuration.nix down to a minimum. Two reasons for wanting that: it requires superuser to change and more importantly it’s not portable to non-NixOS systems.

I use home-manager to port my user profile across systems. I install quite a bit of software in my user profile of course. That’s everything from editors, language servers, browsers, shell utilities, and whatnot. I also have one version of python, node, and the likes for the occasional time I need to just try stuff in a repl or other tiny experiments. However, my threshold is really low for just doing echo "use_nix -p <pkgs...>" > .envrc into a directory to give me a quick and dirty local environment to contain deps. I don’t really care that much about garbage collection and disk utilization, but having these experiments local somewhere ensures that the tools pulled in for the session are wiped at some point.

For projects I actually work on, I always try to define my dependencies locally to that project. For projects which aren’t mine and where I don’t want to force nix on the upstream, I have a nix-utils repository where I gather .nix files which I symlink or import in the other projects.

https://lobste.rs/s/jevfaf/nixos_for_developers#c_rmnad0
