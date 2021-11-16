- https://dopp.sk/posts/NixOS_channels/
  - https://www.reddit.com/r/NixOS/comments/mrz46z/comment/gupjm73/

```bash
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
