chriswarbo

I’ve found that the Nixpkgs approach to Haskell packages (choosing a subset of Hackage packages, picking one version of each which mostly work together) can often require a lot of overriding. Even worse, the error messages only appear after (re)compiling a bunch of dependencies, making each iteration painfully slow.

IOHK’s Haskell infrastructure takes the opposite approach: running cabal or stack to solve the dependencies, then fetching and building whichever versions were chosen (unless they’re already in /nix/store, of course). I’ve found this works quite well: it requires a larger up-front build time, but is more reliable so doesn’t need hand-holding.

https://lobste.rs/s/jevfaf/nixos_for_developers#c_txgw2e
