## mongodb service - defaults to version 3.x

```nix
      package = mkOption {
        default = pkgs.mongodb;
```

- https://github.com/NixOS/nixpkgs/blob/release-21.05/nixos/modules/services/databases/mongodb.nix

To use 4.2 we do this:

```nix
{
  environment.systemPackages = with pkgs; [
    #mongodb-4_2 # looks like this is not needed if there is services.mongodb
  ];

  # https://github.com/jordanisaacs/daysquare/blob/be8df7a44d79ed47da3730768b851cfd2a1c514f/flake.nix#L270
  services.mongodb = {
    package = pkgs.mongodb-4_2;
    #bind_ip = "0.0.0.0";
    enable = true;
  };
}
```

- https://nixos.org/manual/nixos/stable/options.html#opt-services.mongodb.package

## mongodb-4_2 long installation time

There is no binaries built by hydra, because it has changed licence from AGPL to SSPL which is considered non-free by OSI.

https://github.com/NixOS/nixpkgs/issues/83433

## exception in initAndListen: MustDowngrade: Collection does not have UUID in KVCatalog. Collection: admin.system.version, terminating

`systemctl status mongodb` showed above exception.

The quick solution is to remove data files:

`sudo rm -rf /var/db/mongodb/`

https://dba.stackexchange.com/questions/246862/unable-to-start-mongodb-as-a-service-exception-collection-does-not-have-uuid
