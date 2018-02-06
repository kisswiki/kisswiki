- https://github.com/eeue56/elm-html-test
- Elm test runner https://github.com/benansell/lobo
- https://github.com/rogeriochaves/elm-test-bdd-style
- https://github.com/avh4/elm-testable
- https://github.com/rtfeldman/node-test-runner
- Idea: Wrap up Expect.* functions to make parentheses in elm-test omittable https://groups.google.com/forum/#!topic/elm-discuss/g5eqSiOJhZ4
- Fuzz Testing: How to write 500 tests in 5 minutes https://youtu.be/rpnmCM9uzzw
- Verify examples in your docs https://github.com/stoeffel/elm-verify-examples

## elm-test - Access is denied

I get this error: `elm-package.exe: mgold-elm-random-pcg-bc3f173: MoveFileEx "mgold-elm-random-pcg-bc3f173" "mgold\\elm-random-pcg\\4.0.2": permission denied (Access is denied.)`

i deleted the main `elm-stuff` folder, i deleted the holde` tests `folder. I ran `elm package install` on the main project folder and then
`elm-test init` and then
`elm-test`
Now it works. It's some wired interactionss between the 2 elm-stuff folders i think (the one in `tests/elm-stuff` and the `projectFolder/elm-stuff`). It's not the first time i see this error.

"I found out that functions imported in elm-test are not kept in sync with the ones present in the src modules. This example reproduces the issue." https://github.com/AIon-Gbbe/reproduce-elm-test-compiler-bug

## no autoadd tests to runner

As primarily Javascript developers we are used to JS testing frameworks that automatically pick up new tests written in a spec file. With elm-test we had to remember to add newly created tests to a test suite.

The manual part of this lesson learned is more understandable. Nonetheless, we're used to an ecosystem where newly added unit tests are automatically picked up by a test runner.

https://www.reddit.com/r/elm/comments/5o5p63/experiences_with_elm_on_a_small_production/
