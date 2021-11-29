```nix
{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    minecraft
    jdk
  ];
}
```

https://www.reddit.com/r/NixOS/comments/r4jj6o/comment/hmh7vki/

## MultiMC

You can use an override to add the necessary secrets to support MS accounts

you can use a free microsoft account and log directly into the portal (https://portal.azure.com)

- https://gitlab.com/schmensch/multimc-flatpak-installer
- https://www.reddit.com/r/NixOS/comments/r4jj6o/comment/hmie3ve/
