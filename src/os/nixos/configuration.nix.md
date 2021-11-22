`man configuration.nix`

For my NixOS config, I’ve created a base configuration.nix file that contains common options that I want set across all my machines (abbreviated example here):

```nix
{ config, pkgs, ... }:
{
  time.timeZone = "America/Chicago";
  environment.systemPackages = with pkgs; [feh vim wget];
  programs.zsh.enable = true;
  users.users.johndoe.shell = pkgs.zsh;
  # <snip>
}
```

I then import this common file into host-specific files that each contain options specific to that particular machine, e.g. a VM host:

```nix
{ config, pkgs, ... }:
{
  imports = [ ./configuration.nix ];
  services.vmwareGuest.enable = true;
  users.users.johndoe.shell = mkOptionDefault pkgs.bash;
  # <snip>
}
```

Note the mkOptionDefault function that reduces the priority of the pkgs.bash value from the default of 100 to 1500. Had I left off mkOptionDefault, NixOS would complain that johndoe.shell was declared twice. However, by reducing its priority, the configuration.nix’s definition of johndoe.shell = pkgs.zsh will take priority, despite it not being the “last” merged. In actuality, NixOS builds the configuration as a whole without any notion of ordering, and will fail loudly if it gets two property values with equal priority.

https://www.malloc47.com/migrating-to-nixos/

## Single derivation

Your configuration.nix is responsible for configuring and building a single derivation which is your Linux machine that you're using right now. So when you perform those overlays inside configuration,nix, you're only changing the outcome of that single derivation, which is your working machine.

https://www.reddit.com/r/programming/comments/qg72gi/comment/hi78lr5/?utm_source=reddit&utm_medium=web2x&context=3
