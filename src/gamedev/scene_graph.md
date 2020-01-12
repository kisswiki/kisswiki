>This technique is actually [widely used in the game industry][scene]
>[scene]: http://en.wikipedia.org/wiki/Scene_graph

from https://github.com/elm/elm-lang.org/blob/216a36546c6132d4631468bc0b471768cb3b6daa/pages/news/blazing-fast-html.elm#L90

And then I read this

>However, this higher level organization is often waaay simpler than most UI frameworks and this is why I get a bit suspicious about most UI frameworks. Most Big Idea UI frameworks kinda feel like scene graphs to me (an old/failed/abandoned method of organizing 3D scenes), so it makes me suspicious that maybe the UI folks just haven't had complex enough cases to realize what a bad idea that is from both a performance and ergonomics standpoint (i.e. most UIs are just complex enough for scene graphs to seem like a good idea, but not complex enough to make it obvious that they are a bad idea), whereas the gaming folks dropped those kinds of ideas decades ago.

https://www.reddit.com/r/rust/comments/e04b1p/towards_a_unified_theory_of_reactive_ui/f8pz6q1/

>These particular "scene graphs" are outdated junk for modern games. There used to be a lot of them, and now they're not very popular (because they're evil). [Here's a not too old rant about them](https://tomforsyth1000.github.io/blog.wiki.html#%5B%5BScene%20Graphs%20-%20just%20say%20no%5D%5D).
>
>Because "scene graph" has become associated with this particular meaning, it's a good idea not to call your scene management structure a "scene graph" if it doesn't fit that description of storing render-states in the nodes of a DAG which propagate to child geometry.
Call it the transformation graph, or the visibility graph, etc, instead. Usually a modern scene will be represented via several specialized graphs (or flat lists!), not one of these traditional uber "scene graphs".

https://www.gamedev.net/forums/topic/464464-anti-scenegraphism-a-tale-of-tom-forsyths-scene-graphs-just-say-no/

Also this https://news.ycombinator.com/item?id=13912670
