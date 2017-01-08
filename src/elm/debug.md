- [Elm’s Time Traveling Debugger](http://debug.elm-lang.org/)
- it improves the time traveling debugger created by Laszlo Pandy and Evan Czaplicki, turning it into a practical development tool [source](http://elm-lang.org/blog/time-travel-made-easy)
- [yt > Bret Victor style reactive debugging ‒ Laszlo Pandy](https://youtu.be/lK0vph1zR8s)
- Elm needs to(/will hopefully) implement source map support at some point. That will allow you to debug from you favorite browsers debugger (or perphaps a decent IDE). https://groups.google.com/forum/#!topic/elm-discuss/CZxERFbHj6s

>values which aren't dependant on another value in the same scope get processed bottom-up. When a value relies on another value within the same scope, it is handled separately and put at the bottom.
>
>-- http://stackoverflow.com/questions/33476943/why-debug-log-prints-out-in-reversed-order-in-elm
