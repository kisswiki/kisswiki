Erm, what do you want to learn? Wayland dates to 2008--Vulkan dates to 2016. That's an EON in tech.

Wayland chose "we will control the compositing to avoid all tearing". This is suboptimal nowadays with monitors with multiple refresh rates some of which are on completely different graphics cards. It's better to let an application have a Vulkan (or equivalent) surface, draw to it, query, and choose its own linkage to the refresh rate. Also, nobody other than Wayland devs give one iota of damn about performance or tearing during resizes (see: macOS and Windows). There's also the issue of how much resource Wayland compositors have to overallocate in order to be able to composite everything. I have applications that regularly crash because Wayland chewed up too much VRAM and the application couldn't get sufficient VRAM resources.

It's better to let something like Zink handle OpenGL rather than try to provide an OpenGL interface. It's better to give something a surface and let Vulkan handle video rendering onto the surface (the application understands whether it needs to do something like sync to audio or whether it is just an animation). etc. This is even more especially true in the world of massive multicore/multithread.

Then there are the architectural decision that range from the silly to the flat out wrong. Fractional scaling is handled by doubling and shrinking--that's a huge waste of processing. Gnome idiocy around client-side decorations which are just a disaster because it forces everybody to link to C/C++ libraries even if they aren't using C/C++.

Security stuff that has been a disaster: Stopping or arbitrarily jiggling the refresh rate to prevent "application fingerprinting" is dumb and just pisses everybody off. Pointer and focus issues because you might figure out some way to intercept people typing. Screenshot/screencast is an absolute PITA because "security". Input Method and accessibility that threw out a ton of working stuff from X11 that still hasn't been replaced.

I mean, the Wayland developers are not wrong that these things are security issues ... but you can't let them continue to persist for more than a decade and then wonder why people think your project sucks. If you don't give them something, then don't complain when they go back to the old, shitty, insecure thing that works.

from hn:

As you can see, there are a LOT of corner cases to be covered. This is the primary problem. The video subsystem is a lot of fiddly work that very few people are qualified to do. Look at how much work Asahi Lina and Alyssa Rosenzweig had to do to make graphics work on Linux on Apple hardware. Now, multiply that out and you can see just what a mountain this stuff is.

Be aware that in the discussion above, Vulkan can be substituted with Direct12 or Metal which are effectively the exact same graphics API.

Which is actually probably the end result of all of this. We're probably going to wind up with some version of Win32/DX12 APIs on Linux thanks to Steam as that would give you portability betweeen Linux and the biggest OS platform. And, to be fair, most users would probably be happier...

<https://news.ycombinator.com/item?id=44307285>
