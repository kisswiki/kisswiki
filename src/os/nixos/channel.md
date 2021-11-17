- https://dopp.sk/posts/NixOS_channels/
  - https://www.reddit.com/r/NixOS/comments/mrz46z/comment/gupjm73/

```bash
# nix-shell -p nix-info --run "nix-info -m"
$ nix-info -m
 - system: `"x86_64-linux"`
 - host os: `Linux 5.10.79, NixOS, 21.05.4116.46251a79f75 (Okapi)`
 - multi-user?: `yes`
 - sandbox: `yes`
 - version: `nix-env (Nix) 2.3.16`
 - channels(root): `"nixos-21.05.4116.46251a79f75"`
 - channels(roman): `""`
 - nixpkgs: `/nix/var/nix/profiles/per-user/root/channels/nixos`
```

- `host os` shows what version system is on
- `channels(root)` shows what is the updated channel version
- `channels(roman)` shows that user roman is not on a different channel than host

- https://dopp.sk/posts/NixOS_channels/

## nixos vs nixpkgs channels

https://nixos.org/channels/nixos-unstable

https://nixos.org/channels/nixpkgs-unstable

nixos is typically package set for NixOS, nixpkgs is package set when you have nix installed as package manager on non NixOS distro. They are built from the same repo.

https://stackoverflow.com/questions/41230430/how-do-i-upgrade-my-system-to-nixos-unstable#comment99809384_41230431

## revert channel update

`nix-channel --rollback`

- https://stackoverflow.com/questions/39090387/how-to-undo-nix-channel-update/39090719#39090719
- https://nixos.org/manual/nix/stable/#sec-nix-channel

## Which channel is right for me?

You probably want to use the current stable, ie: nixos-18.03.

nixos-18.03 comes from the `release-18.03` branch on GitHub. It maintains some package version stability over its six-month life, providing better guarantees that your system will keep working without major changes for the life of the release.

The stable branch also gets timely security patches delivered through channels.

The channels beginning with the `nixos-` prefix are thoroughly tested from the perspective of being an operating system. This means we test the X server, KDE, various servers, and lower level details like installing bootloaders and runnning the nixos installation steps. This is in contrast to the `nixpkgs-` channel prefix, where only limited testing is performed.

If you want to live on the bleading edge, perhaps `nixos-unstable` is right for you. It very frequently receives patches and updates that make larger version jumps than the stable branch.

The unstable branch also regularly receives security patches, however sometimes it can take several weeks for security patches to end up in the channels, due to test being broken.

If you are only using Nix as a package manager, perhaps the nixpkgs-unstable branch is better for you. This channel is very frequently updated, but does not receive the thorough testing the NixOS channels receive. DO NOT USE THIS FOR NIXOS.

from https://gist.github.com/grahamc/c60578c6e6928043d29a427361634df6#which-channel-is-right-for-me

and from https://discourse.nixos.org/t/difference-between-channels/579/3

https://discourse.nixos.org/t/why-there-are-branches-nixos-21-05-and-release-21-05/16116

All three of them are based on the nixpkgs master branch. Each of them advance only if all of their tests are passing. The only difference is the list of tests that each of them have. By convention the -small postfix is based on the the same test suite but with less tests in them so they advance faster.

See https://howoldis.herokuapp.com/ 111 for more details.

https://discourse.nixos.org/t/difference-between-channels/579/2

- https://nixos.wiki/wiki/Nix_channels
  - https://channels.nix.gsc.io/

The nixos channel also runs many more nixosTests as part of it jobset as well as constituents (required jobs for a channel release). And the nixos channel is the one which also creates the command database which is used for the command-not-found logic:

https://discourse.nixos.org/t/differences-between-nix-channels/13998/3

https://status.nixos.org/

nixos unstable is updated when nixos tests pass (e.g. installer works, kde works...).

nixpkgs unstable is updated when some critical packages build.

https://www.reddit.com/r/NixOS/comments/2gnlab/comment/ckl29cx/

https://discourse.nixos.org/t/why-is-there-no-rolling-stable-channel/3322

## multiple channels

You can use packages from different channels. So possibly keeping your default channel as stable, and just referencing particular packages from the unstable channel might be a better solution.

I have the following import in my config (using google-chrome from the channel I have assigned to unstable):

```nix
{ config, pkgs, ... }:


let
  unstable = import <unstable> {
    config = config.nixpkgs.config;
  };
in
{
   environment.systemPackages = with pkgs; [
     awscli
     google-cloud-sdk
     kubectl
     libreoffice
     # ...
     unstable.google-chrome
   ];
}
```

https://stackoverflow.com/questions/53532239/i-changed-my-nixos-channel-to-unstable-why-are-my-packages-still-not-updated/53545467#53545467
