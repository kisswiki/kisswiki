```nix
{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.services.auto-cpufreq;
in {
  options = {
    services.auto-cpufreq = {
      enable = mkEnableOption "auto-cpufreq daemon";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.auto-cpufreq ];

    systemd = {
      packages = [ pkgs.auto-cpufreq ];
      services.auto-cpufreq = {
        # Workaround for https://github.com/NixOS/nixpkgs/issues/81138
        wantedBy = [ "multi-user.target" ];
        path = with pkgs; [ bash coreutils ];
      };
    };
  };
}
```

- https://sourcegraph.com/github.com/NixOS/nixpkgs/-/blob/nixos/modules/services/hardware/auto-cpufreq.nix?L13:31
- https://github.com/NixOS/nixpkgs/issues/81138
