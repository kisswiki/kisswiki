@jnordwick

hot reloading is omly useful is a very very small context. it needs to be a server far enough along to be actually up and running, have to be written in a way that the underlying program can handle having code and data structures changed out from under it (eg, if you are keeping instances of struct around, you can't just hotload a new struct definition - you need to restart), cannot be debugging memory issues (process memory might be corrupted), cant' be hotloading new network code with active connections, ...

and it needs to be actually easier and less error prone than just restarting. Is the comparative benefit of hot reloading over restarting better than what could have been done with all those development hours that could have been directed elsewhere - that's the correct question to ask.

The list goes on and one. there is such an absolutely tiny portion of programs this helps, that I can't for the life of me figure out why zig is willing to die on this hill.

@p-rimes

One example is embedded programming, where the "target" is not the CPU that has done the compiling. Computers that are interacting with real physical objects cannot just "restart" trivially / abstractly as other domains that use software (e.g. web requests, or batch executables).

By way of extension, gaming (a virtual world), also has the same property: the concept of "just restart" incurs a cost, where "things" have to be reset.

Finally, in a "bottom up" vs "top down" way, the notion of hot reloading is completely intuitive, in that you don't physically disconnect your computer's power cable when trying new code. So how do you justify a line that is arbitrarily drawn at recompile time requiring a restart?

@jnordwick

hot reloading is NOT for release code, only debugging. That and incremental compilation produce orders of magnitude slower code. Often you can't even run games in debug because they are slow to to the point of being unusable even for testing. (I just had this convo the other day here and the other person defending incre compilation and hotreloading said "who could possible think they would use this in production".)

The game example even makes less sense because the client and server side code have to be kept in sync since client prediction is necessary to cover network lag for even the most basic arpg/fps/stategy games.

I don't even understand your embedded example. You aren't restarting hardware, but reflashing, and I'm not sure hotloadng will work with that - it would be a hardware specific solution. The reason it will work on a PC is the virtual memory and OS's ability to map a file directly into memory. If you are flashing the code, you aren't going to be able to hot reload it.

You can't just make arbitrary changes, and the program has to be written in a way that having a function just change underneath it is fine (eg, can't change a hash function in the middle of code because you'll lose track of current things in the hash). Can't change a struct definition. Can't change network code. The program to be at a steady state and can't be "in motion" . There are so many restriction on what you can do that it wind up not being very useful.

These two things have been around for many years already, but hardly anybody uses them because they aren't what people expect.

https://www.reddit.com/r/Zig/comments/1cq4beo/will_zig_eventually_enter_the_industry/
