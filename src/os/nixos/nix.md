- https://github.com/tazjin/nix-1p

## short explanation

`:` indicates a function definition

`{}` is a data structure not a code block

`mkDerivation {}` is a function call where `{}` is passed to the function `mkDerivation`

https://www.reddit.com/r/NixOS/comments/c4cyw7/comment/es5m7ll/?utm_source=reddit&utm_medium=web2x&context=3

## nix vs guile

Nix has a few warts (such as the ? operator and some of its builtins), but overall seems like a fairly clean language to me.

There’s pros and cons to each of the two approaches here. For example, Guix gets namespaces for free from Guile, which means there is a defined and queryable package set (whereas Nix just has one big attribute set that you traverse).

The downside of this is that you now have a namespace, and declaring things into them becomes a side effect. In Nix it’s very easy (for people experienced with the language & tooling) to understand exactly which code is relevant, this becomes less clear once you have sequential execution, mutability and so on.

My ideal setup would probably be a language with the exact semantics of Nix (purely-functional, lazy) but an S-expression syntax. That’s easy to implement, but at the moment there’s more important things to work on in the ecosystem.

https://lobste.rs/s/jevfaf/nixos_for_developers#c_bojiua
