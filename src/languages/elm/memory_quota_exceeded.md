evancz  12 days ago

The `elm` executable is created by Haskell, and therefore it has a Haskell runtime system (RTS).The flags given by 0.19.1 are `-N -qg -A128m` which means it asks for:

- `-N` use all cores
- `-qg` do not do a bad kind of GC
- `A128m` have 128mb for the heap

The space used for the heap is larger than before. I think the default is like 16mb or something? Not sure.You can try running with a smaller heap with a command like this:

`elm make src/Main.elm +RTS -A16mb`

Running `elm +RTS -?` shows all the potential flags you can give. It's actually 1mb by default!

So maybe `+RTS -A1mb` would be the safest bet.

But for now I recommend just adding `+RTS -M32m` when you run on heroku.

(As an aside, the npm installer just downloads the binaries from the releases page, so it's the same binary no matter if it's `-2` or `-3` or whatever other tag on npm. The important number is from `elm --version`)

erkalselman  12 days ago

hey @evancz after speaking with @Malax we’ve found out that we were building things in a wrong way on heroku.
That was why the memory errors were happening.

Max  11 days ago

instead of running `elm make` as a build script in `package.json` we had previously executed the build inside the `Procfile`. as long as the command in the `Procfile` only starts a server and doesn’t build anything you should be fine
