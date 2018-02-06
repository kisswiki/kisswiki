On the other hand we ripped out channels and went back to mutexes. And my experienced Go-developer friends seem to have all the same reluctance to use channels after ending up in channel hell.
There are good aspects of Go concurrency like how the whole ecosystem is async by default (like Node's), but truly praising the model is something I mainly hear from beginners.

This is something I noticed with Go. Channels are great and all and occupy a decent chunk of the tutorials and whatnot, but they see to be rarely used apart from a fairly cumbersome way of handling timeouts and cancellation. It seems if you stick concurrency in your libraries you end up in knots, and its left up to the code that uses the libraries to wire up all the synchronous & blocking bits.

https://news.ycombinator.com/item?id=16203785