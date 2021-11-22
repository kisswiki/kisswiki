- https://github.com/NixOS/nixpkgs/blob/3b9d05e114550db6ea23befa078bd978371d863c/pkgs/build-support/docker/examples.nix

## run one-off image

abstract777

Have you used docker inside NixOS? And if so, why?

srid

To run an one-off image from Docker registry, like mysql or redis, specific to a project. Docker is generally not required on NixOS for creating reproducible environments.

https://lobste.rs/s/jevfaf/nixos_for_developers#c_bhpxj1

## user and tempfs size

```nix
{
  # Required because /run/user/1000 tempfs is too small for docker
  services.logind.extraConfig = ''
    RuntimeDirectorySize=8G
  '';
}
```

https://github.com/malloc47/config/blob/e5c68ed5bf8dcb8714bb6d6a0700e8dd0dfbf168/nixos/configuration.nix#L78
