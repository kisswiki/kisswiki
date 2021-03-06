- http://guide.elm-lang.org/architecture/effects/random.html
- http://elm-lang.org/examples/random
- http://package.elm-lang.org/packages/elm-lang/core/latest/Random
- http://elmprogramming.com/commands.html#generating-random-numbers
- https://hub.packtpub.com/random-value-generators-elm/
- https://stackoverflow.com/questions/40206791/what-is-the-minimum-code-required-to-produce-random-numbers-in-elm
- http://blog.noredink.com/post/147949678708/functional-randomization
- https://www.packtpub.com/books/content/random-value-generators-elm
- provides cryptographically secure random number generation via JavaScript's `window.crypto.getRandomValues()` function http://package.elm-lang.org/packages/billstclair/elm-dev-random/latest
- https://www.reddit.com/r/elm/comments/43yon2/how_to_generate_a_random_int_within_a_range/
- https://github.com/jcollard/random-examples
- https://github.com/TheSeamau5/elm-check/wiki/Guide-to-Writing-Your-Own-Random-Generators
- http://package.elm-lang.org/packages/elm-community/elm-random-extra/latest/Random-Array
- http://package.elm-lang.org/packages/mgold/elm-random-pcg/latest/
- http://package.elm-lang.org/packages/mgold/Elm-Random-Sampling/latest/Random-Array
- https://github.com/blacktaxi/pwdgen-elm
- https://github.com/blacktaxi/elm-random-secure
- http://reversemicrowave.me/blog/2016/03/04/elm-secure-random/
- https://github.com/jcollard/elm-random
- https://github.com/jcollard/generator
- http://elm-by-example.org/chapter8circles.html
- https://github.com/NoRedInk/elm-random-extra
- https://www.reddit.com/r/elm/comments/3vpau7/randomrange_in_modern_elm/
- https://stackoverflow.com/questions/35235708/elm-generate-random-number

## Don't use the current time as seed

- It's not randomly distributed over the keyspace (of 32 bits, I think) https://groups.google.com/forum/#!topic/elm-discuss/KHkBHaZGWks
- This doc is wrong, wrong, wrong. As you've discovered, there isn't an easy way to get the current timestamp. Use `Math.floor(Math.random()*0xFFFFFFFF)` instead. This gives you a seed that is better sampled over the possible input space. http://stackoverflow.com/questions/35235708/elm-generate-random-number/35414047#35414047
- http://stackoverflow.com/questions/28606248/what-is-the-correct-way-of-initializing-an-elm-application/
- http://stackoverflow.com/questions/33855791/elm-random-generator-timestamp-as-initialseed/33858118#33858118

## Random in 0.17 and purity

even if the function returns a Task or Cmd or Sub, the function is still side-effect free! It's just returning a value. You really can't write an Elm function that has side effects (without involving the Debug or Native modules), and that includes functions that return Task, Cmd, or Sub.

As it happens, the purpose of the values Cmd, Task, and Sub is to describe various effects that we'd like Elm's runtime to carry out eventually, but they are still just values nonetheless. Instantiating them is precisely as side-effectful as instantiating a String. ;)

https://groups.google.com/d/msg/elm-discuss/6ZupSXIIpX4/JujylEckCwAJ
