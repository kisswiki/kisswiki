https://dev.to/rtfeldman/i-am-the-author-of-elm-in-action-ask-me-anything/comments

@rtfeldman:

even after migrating a bunch of stuff to Webpack we're still dissatisfied with our build process overall—and not just with the Elm parts.

Webpack has been slow and crashy and I can't wait for us to stop using it.

The pain point that leaps immediately into my mind is build tools. I'm not gonna sugarcoat it: Webpack has been slow and crashy and I can't wait for us to stop using it.

@eeue56:

To expand on the Webpack issues:

- Webpack is very memory intensive
- If there are multiple entry points (i.e lots of bundles) then Elm is not very good at parallelizing shared asset control.
- Elm-make is slow, and if the dependency tree triggers an expensive change, then it's important to realise that Elm causes a slow re-compile - but webpack is responsible for filling up memory, and therefore slowing everything down
- Webpack can segfault (and does if you aren't careful)

I worked on this a bit to help fix it:

- https://github.com/elm-community/elm-webpack-loader/pull/82 limits the number of parallel builds, preventing collisions
- https://github.com/elm-community/elm-webpack-loader/pull/79 switches the way that node-elm-compiler was looking for dependencies, and helped fix a pretty bad problem of opening too many things.
- https://github.com/elm-community/elm-webpack-loader/pull/88 makes files be watched in a more sensible manner
