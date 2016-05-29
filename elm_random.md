- http://package.elm-lang.org/packages/elm-lang/core/latest/Random
- http://guide.elm-lang.org/architecture/effects/random.html
- https://github.com/jcollard/random-examples
- Don't use the current time. It's not randomly distributed over the keyspace (of 32 bits, I think)
  - https://groups.google.com/forum/#!topic/elm-discuss/KHkBHaZGWks
  - This doc is wrong, wrong, wrong. As you've discovered, there isn't an easy way to get the current timestamp. Use `Math.floor(Math.random()*0xFFFFFFFF)` instead. This gives you a seed that is better sampled over the possible input space. http://stackoverflow.com/questions/35235708/elm-generate-random-number/35414047#35414047
  - http://stackoverflow.com/questions/28606248/what-is-the-correct-way-of-initializing-an-elm-application/
- https://github.com/TheSeamau5/elm-check/wiki/Guide-to-Writing-Your-Own-Random-Generators
- http://package.elm-lang.org/packages/elm-community/elm-random-extra/latest/Random-Array
- http://package.elm-lang.org/packages/mgold/elm-random-pcg/latest/
- https://github.com/blacktaxi/pwdgen-elm/tree/30b96b8e49d685e3bf3842f0353c399e26fe2dc4

## Random in 0.17 and purity

even if the function returns a Task or Cmd or Sub, the function is still side-effect free! It's just returning a value. You really can't write an Elm function that has side effects (without involving the Debug or Native modules), and that includes functions that return Task, Cmd, or Sub.

As it happens, the purpose of the values Cmd, Task, and Sub is to describe various effects that we'd like Elm's runtime to carry out eventually, but they are still just values nonetheless. Instantiating them is precisely as side-effectful as instantiating a String. ;)

https://groups.google.com/d/msg/elm-discuss/6ZupSXIIpX4/JujylEckCwAJ
