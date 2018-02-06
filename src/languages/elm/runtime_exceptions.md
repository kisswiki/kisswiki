it's possible to make them happen, but most of the time you have to really understand Elm to make them happen. Unless you're using Array or Regex, of course. Both of these can lead to runtime exceptions - e.g Regex.regex "[a". However, you'll not likely run into that in production - unless you are taking using input as regex input.. which probably isn't a good idea unless you're escaping things.

https://dev.to/rtfeldman/i-am-the-author-of-elm-in-action-ask-me-anything

##

- Elm does not guarantee "No Runtime Exceptions" https://www.reddit.com/r/elm/comments/6vaco9/elm_does_not_guarantee_no_runtime_exceptions/
- Just got a runtime exception from @elmlang https://twitter.com/axiologic/status/909462697846157312

##

While I’ve used String to keep this simple but this is dangerous.
If JavaScript, (in it’s infinite wisdom), decides to send something that’s not a string (like null, undefined, NaN, rubber duck, a function, etc.) then Elm will throw a run-time exception and stop it’s run loop.
This means Elm will not be able to accept any input or respond in any way. It’s dead.
The way to make your elm code bullet proof again to change the type of the port to a Value instead. This means that you’ll have to write a Json.Decoder for it. This way if JS decides to send you a bad value it will just return an Err instead of throwing an exception.

https://hackernoon.com/how-elm-ports-work-with-a-picture-just-one-25144ba43cdd
