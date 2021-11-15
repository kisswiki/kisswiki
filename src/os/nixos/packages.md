- https://github.com/NixOS/nixpkgs
- https://search.nixos.org/
- https://repology.org/projects/b/?inrepo=nix_unstable&notinrepo=gnuguix&repos=3
- https://discourse.nixos.org/t/nixpkgs-has-been-the-largest-repository-for-months/10667/2
- https://distrowatch.com/weekly.php?issue=20170515#nixos
- https://distrowatch.com/table.php?distribution=nixos

## search

```bash
$ sudo nix-env -qaP nix
nixos.nix          nix-2.3.16
nixos.nixStable    nix-2.3.16
nixos.nixFlakes    nix-2.4pre20211006_53e4794
nixos.nixUnstable  nix-2.4pre20211006_53e4794
$ sudo nix-env -qaP > list.txt
$ $ sudo nix-env -qasP nix
-PS  nixos.nix          nix-2.3.16
-PS  nixos.nixStable    nix-2.3.16
--S  nixos.nixFlakes    nix-2.4pre20211006_53e4794
--S  nixos.nixUnstable  nix-2.4pre20211006_53e4794
```

Here, "I" indicates that the specified package is installed, "P" indicates the package is present on our system, and "S" indicates that whether there is a so-called substitute for the package.

`chromium`

Matches the package name chromium and any version.

`chromium-58.0`

Matches the package name chromium and version 58.0.

Example:

```bash
$ nix-env -qa chromium-58.0
gtk\\+
```

Matches the package name gtk+. The + character must be escaped using a backslash to prevent it from being interpreted as a quantifier, and the backslash must be escaped in turn with another backslash to ensure that the shell passes it on.

`.\*`

Matches any package name. This is the default for most commands.

`'.*zip.*'`

Matches any package name containing the string zip. Note the dots: '_zip_' does not work, because in a regular expression, the character \* is interpreted as a quantifier.

`'.*(firefox|chromium).*'`

Matches any package name containing the strings firefox or chromium.

- https://yoshuawuyts.gitbooks.io/knowledge/content/bin/nix.html
- https://ostechnix.com/getting-started-nix-package-manager/
