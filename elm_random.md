- http://package.elm-lang.org/packages/elm-lang/core/latest/Random
- http://guide.elm-lang.org/architecture/effects/random.html
- https://github.com/jcollard/random-examples
- Don't use the current time. It's not randomly distributed over the keyspace (of 32 bits, I think)
  - https://groups.google.com/forum/#!topic/elm-discuss/KHkBHaZGWks
  - http://stackoverflow.com/questions/35235708/elm-generate-random-number

## Random in 0.17 and purity

even if the function returns a Task or Cmd or Sub, the function is still side-effect free! It's just returning a value. You really can't write an Elm function that has side effects (without involving the Debug or Native modules), and that includes functions that return Task, Cmd, or Sub.

As it happens, the purpose of the values Cmd, Task, and Sub is to describe various effects that we'd like Elm's runtime to carry out eventually, but they are still just values nonetheless. Instantiating them is precisely as side-effectful as instantiating a String. ;)

https://groups.google.com/d/msg/elm-discuss/6ZupSXIIpX4/JujylEckCwAJ
