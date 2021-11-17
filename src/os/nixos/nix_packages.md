nixpkgs
While the Nix Expression Language is somewhat esoteric, the big ideas aren’t far removed from features in mainstream functional languages. nixpkgs in particular can be conceptualized as a single large map (called an Attribute Set or attrset in Nix) from keys to derivations:

```nix
{

# <snip>

tmux = callPackage ../tools/misc/tmux { };

# <snip>

}
```

You can see a meaty example of nixpkg’s package list here. This would normally be an unwieldy thing to build in memory on every interaction with the package manager, however Nix lazily loads the contents of this attrset. Nix even provides the option to make these attribute sets “recursive” allowing the values to reference sibling keys, e.g.

```nix
rec { a = 2; b = a+3; }
```

nixpkgs provides facilities to change or update existing packages with custom configuration, and add new entries to the package attrset. It does this by way of “overlays” which are a fixed point over the package attrset. Nix’s approach of effectively rebuilding a facsimile of the FHS on every run means that “manual” intervention to install things outside of a package manager (say, copying a ttf font into `/usr/share/fonts`) is not feasible, so having an easy way to fold your own set of custom packages into the package attrset is vital.

The other important aspect to nixpkgs is that it is versioned in git (conveniently alongside NixOS in the same repo). The Nix CLI tools can fetch and install the latest set of packages by rolling the local clone of nixpkgs forward and then rebuilding your packages. Such a rebuild can apply to all the packages on your entire system, or just a particular derivation’s local packages. This can work the other direction as well: If you prefer your package set to remain completely fixed, you can pin the nixpkgs clone to a particular git SHA. Stable releases of NixOS are handled as branches of the nixpkgs repo, which do get critical updates but avoid all the bleeding-edge changes that the master branch has.

https://www.malloc47.com/migrating-to-nixos/
