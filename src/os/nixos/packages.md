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

## Nix generally doesn’t do version management

> There is an official comparison method by nix builtins.parseDrvName to decide if one package is a more-up-to-date version of another package. […] However, many many packages seem to ignore this format entirely when setting their version.

This is because Nix generally doesn’t do version management. E.g., when you build a system with nixos-rebuild, you get a generation that contains the package versions that are provided by the nixpkgs revision that is used. So, there is no need to determine what packages should be upgraded, etc. Package versions are used as part of the output path. But other than that, they are largely metadata for the user.

https://discourse.nixos.org/t/clarification-on-package-names-and-versions/9819/2

## imperative package management

If you use nix-env -i. However, it has to evaluate all pname attributes in nixpkgs to find matching packages. So it is generally better to use nix-env -iA and specify an attribute, because then Nix only has to evaluate the attribute (and any transitive dependencies). This saves time and memory. That said, it is even better to not use nix-env at all, because it’s a form of imperative package management. Specifying the packages in configuration.nix or using something like home-manager allows to to set up a system or environment declaratively.

https://discourse.nixos.org/t/clarification-on-package-names-and-versions/9819/2

## pname

This is a historical artifact. In the past the name attribute was used for the package name plus version. Now name is generated from pname and version. But not all derivations have been updated yet to use pname + version.

name is generated from pname and version and should not be specified anymore in new derivations.

https://discourse.nixos.org/t/clarification-on-package-names-and-versions/9819/2

## flakes

> Can `nix-env -qa -f $commit` on one machine can have different output than `nix-env -qa -f $commit` on another machine/OS?

Yes, since the machine could have overlays or overrides defined. This is one one of the issues that flakes attempt to solve (avoiding that external state influences the evaluation).

https://discourse.nixos.org/t/clarification-on-package-names-and-versions/9819/2

## nix evaluation

Nix evaluation is pure (with some exceptions, such as built-in fetchers).

https://discourse.nixos.org/t/clarification-on-package-names-and-versions/9819/2
