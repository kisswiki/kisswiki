- https://github.com/NixOS/nixpkgs
- https://search.nixos.org/
- https://repology.org/repositories/graphs
- https://repology.org/projects/b/?inrepo=nix_unstable&notinrepo=gnuguix&repos=3
- https://discourse.nixos.org/t/nixpkgs-has-been-the-largest-repository-for-months/10667/2
- https://distrowatch.com/weekly.php?issue=20170515#nixos
- https://distrowatch.com/table.php?distribution=nixos

## what is installed

To figure out what is installed on your system, you may run the following commands:

- `nix-env -q` to figure out what is installed in an imperative user environment.
- `nixos-option environment.systemPackages` to query the set of packages that will appear in `/run/current-system/sw` when - your configuration is built and activated. To quote its documentation, "These packages are automatically available - to all users."
- `nix-store -q --requisites /run/current-system ~/.nix-profile` the combined closure of dependencies of the current - system and your user profile
- `nix-store -q --references /run/current-system` direct dependencies of the current system

See `--query` section or nix-store `--help` for more options.

https://stackoverflow.com/questions/47953868/why-doesnt-nix-env-q-find-my-installed-packages-nixos-channels-profiles-a/47957142#47957142

## what will be installed

```bash
$ nixos-rebuild build
$ nix store diff-closures /var/run/current-system ./result
cpupower: 5.10.79 → 5.10.80
firefox: 94.0 → 94.0.2
firefox-unwrapped: 94.0 → 94.0.2, +49.2 KiB
initrd-linux: 5.10.79 → 5.10.80
libytnef: 1.9.3 → 2.0
linux: 5.10.79, 5.10.79-modules → 5.10.80, 5.10.80-modules, +13.1 KiB
nixos-system-msi-laptop: 21.05.4255.d5b65f812cd → 21.05.4349.09650059d7f
pipewire: 0.3.39 → ∅, +354.4 KiB
pipewire-media-session: 0.4.0 → 0.4.1
```

https://www.reddit.com/r/NixOS/comments/r0o829/comment/hlvmrs9/

## what was installed

```bash
$ nix profile diff-closures --profile /nix/var/nix/profiles/system
Version 85 -> 86:
  nodejs: 14.18.1 → ∅, -57897.0 KiB
  yarn: 1.22.10 → ∅, -5200.2 KiB

Version 86 -> 87:
  nodejs: 16.11.1 → 14.18.1, +8360.7 KiB

Version 87 -> 88:
  nodejs: 14.18.1 → 16.11.1, -8360.7 KiB

Version 88 -> 89:

Version 89 -> 90:

Version 90 -> 91:
  cpupower: 5.10.80 → 5.10.81
  initrd-linux: 5.10.80 → 5.10.81
  linux: 5.10.80, 5.10.80-modules → 5.10.81, 5.10.81-modules
  nixos-system-msi-laptop: 21.05.4349.09650059d7f → 21.05.4384.4f37689c8a2
```

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

## No easy pinning of package version

So, if I wanted ruby 2.6.7 and go 1.13 (neither are available in either 21.05 or 20.09), I would do what exactly? Or if I wanted ruby_2_6 (available in 21.05) and go_1_16 (available in 20.09)? All other package/dependency management tools don't even have such a problem.

https://news.ycombinator.com/item?id=28592368

- [Ditch your version manager | Hacker News](https://news.ycombinator.com/item?id=28565072)
- https://discourse.nixos.org/t/-larification-on-package-names-and-versions/9819/5
- https://search.nix.gsc.io/?q=name%20%3D%20%22&i=nope&files=.nix&repos=
- https://discourse.nixos.org/t/-ow-to-find-the-real-name-once-installed-of-a-package/6651
- [There isn't a clear canonical way to refer to a specific package version. · Issue #93327 · NixOS/nixpkgs](https://-ithub.com/NixOS/nixpkgs/issues/93327#issue-658861943)
- [There isn't a clear canonical way to refer to a specific package version. · Issue #93327 · NixOS/nixpkgs](https://-ithub.com/NixOS/nixpkgs/issues/93327)
- [Searching and installing old versions of Nix packages – Marcelo Lazaroni – Developing for the Interwebs](https://-azamar.github.io/download-specific-package-version-with-nix/)
- [Ditch your version manager | Lobsters](https://lobste.rs/s/emyfhx/ditch_your_version_manager#c_5acgpf)
- [There isn't a clear canonical way to refer to a specific package version. · Issue #93327 · NixOS/nixpkgs](https://-ithub.com/NixOS/nixpkgs/issues/93327#issuecomment-661986395)
- https://nixos.org/manual/nixpkgs/stable/#sec-versioning
- [Package ruby on Nix](https://pkgs.on-nix.com/nixpkgs/ruby/)
- [default.nix](https://gist.github.com/Arkham/31297c1d75fc59f723a50063bc0f5739)
- [There isn't a clear canonical way to refer to a specific package version. · Issue #93327 · NixOS/nixpkgs](https://-ithub.com/NixOS/nixpkgs/issues/93327)
- [No way to install/use a specific package version? · Issue #9682 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/-ssues/9682)
- https://nixos.wiki/wiki/FAQ/Pinning_Nixpkgs
- [There isn't a clear canonical way to refer to a specific package version. · Issue #93327 · NixOS/nixpkgs](https://-ithub.com/NixOS/nixpkgs/issues/93327)
- [I firmly believe that Nix (and/or Guix) are the future. I am going to use Nix as... | Hacker News](https://news.ycombinator.com/item?id=25191466)

## shared libraries

dnr

Packages as defined in nixpkgs don't depend on specific versions of shared libraries. They depend on the library by name, just as they do in any other OS. So a single update in nixpkgs addresses all packages on the system "for free", including ones defined outside of nixpkgs, because they're almost certainly going to depend on nixpkgs for those libraries (I mean, they could duplicate the definitions, but why would they?).

Built packages depend on specific versions. So you just have to be sure to update all your built packages. How does that happen? Well, packages are installed because they're requested by name somewhere, either NixOS system packages, or from home-manager, or from a dev environment. Those names point to packages in nixpkgs. So when you update your nixpkgs version (using nix-channel or flake update or however you're doing it), and then rebuild NixOS or update home-manager, you get updated versions of everything.

If you're using a nix-based dev environment with pinned nixpkgs (with niv or a flake or whatever), you'll have to update that pin as well, for each project. I suppose you could claim that this makes it easy to use old dependencies. Perhaps, but the entire point of pinning the nixpkgs version is to make everything 100% reproducible, bugs and all, all the way down your dependency stack. So you have to make a deliberate choice between trade-offs there, which seems fair.

As far as static linking, nix is essentially static linking, except that you still get the benefits of shared disk space and shared memory for .so files. "True" static linking might be simpler if your dependencies happen to be .so files that also have .a files, but many things aren't, e.g. dependencies among python modules, depending on other binaries to exec, data files, etc. Nix lets you "statically link" all of those too.

ochoseis

IIUC, it’s more nuanced than that. The shared library would be specified as a dependency to the packages that rely on it. Pushing a fix to the library would trigger a rebuild of all the downstream packages during the next upgrade. This also means updates to a popular dependency will cause long upgrades.

https://news.ycombinator.com/item?id=25194553
