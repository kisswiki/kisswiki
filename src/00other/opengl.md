I knew that OpenGL drivers were crippled with bugs when I started glium, but I didn't know at which
degree. Glium was supposed to be a safe layer above the drivers and fix all the safety bugs that
are encoutered. That's why glium contains lots of codes like this1.3k
or this593.

In reality the situation is too catastrophic, and it's almost impossible to keep that initial goal
of fixing driver errors. I have the feeling that some driver writers barely read the specifications,
and the fact that online documentation (like docs.gl) is filled with mistakes doesn't help.

An anecdote is that the first time I ran unit tests with vulkano I was amazed by the mere fact that
it worked. Glium's tests happen to randomly fail because of driver bugs.

The more recent the OpenGL feature the more likely it has bugs in it, even with major vendors.
Some very recent extensions are barely usable with some drivers.

I should have accepted that situation and sticked with well-established OpenGL features that are
known to work well everywhere, instead of exposing the entirety of OpenGL.

https://users.rust-lang.org/t/glium-post-mortem/7063
