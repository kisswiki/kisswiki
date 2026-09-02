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

## ChatGPT answer

- Claim: Vulkan is newer, so applications should render directly to a Vulkan surface and control presentation.
  Counter: Wayland applications already render locally using Vulkan, OpenGL, or software rendering. They submit GPU buffers to the compositor. Vulkan cannot replace the compositor because something must coordinate overlapping windows, multiple monitors, cursors, scaling, HDR, and multiple GPUs.

- Claim: Applications should choose their own refresh-rate synchronization.
  Counter: They can express presentation preferences, including allowing tearing through `tearing-control-v1`. The compositor must retain final control because multiple applications can share one physical display. Fullscreen applications may use direct scanout.

- Claim: Wayland always prevents tearing.
  Counter: That was effectively the historical default, but modern Wayland supports asynchronous presentation where tearing is acceptable.

- Claim: Zink should handle OpenGL instead of Wayland providing OpenGL.
  Counter: Wayland does not provide OpenGL. Mesa or the driver does. Zink can already translate OpenGL to Vulkan while the application uses Wayland for window-system integration.

- Claim: Fractional scaling always renders at 2× and downsamples.
  Counter: This describes an older GNOME/XWayland approach. `fractional-scale-v1` lets native clients render directly at scales such as 150%. Legacy applications can still require inefficient scaling.

- Claim: Wayland compositors waste VRAM.
  Counter: Compositing, scaling, and multi-GPU transfers can consume substantial VRAM, especially with implementation or driver problems. But Windows and macOS compositors also require buffers. This is not necessarily a fundamental Wayland flaw.

- Claim: Client-side decorations force applications to use C/C++ libraries.
  Counter: They do not. Decorations can be implemented in any language. The valid criticism is that GNOME’s preference for client-side decorations shifts complexity to applications and encourages dependence on GTK or Qt.

- Claim: Wayland security broke screenshots, automation, input methods, and accessibility.
  Counter: Largely fair. X11 exposed powerful but insecure global access; Wayland removed it before complete secure replacements were available. Portals and PipeWire solve some cases, but accessibility, automation, and input-method support took far too long.

- Claim: Refresh timing is deliberately disturbed to prevent fingerprinting.
  Counter: That is more likely a browser or compositor-specific privacy mechanism, not a fundamental Wayland rule. The claim needs a concrete example.

- Claim: Vulkan, D3D12, and Metal are effectively identical.
  Counter: They belong to the same generation of explicit, low-level graphics APIs, but differ significantly in memory, synchronization, shaders, presentation, and OS integration.

- Claim: Linux will probably adopt Win32/DX12 because of Steam.
  Counter: Steam’s actual direction is Win32/D3D compatibility through Proton, DXVK, and vkd3d-proton, translating D3D to Vulkan. Gamescope itself is a Wayland compositor. This strengthens compatibility with Windows software, not native adoption of Win32/DX12.

Overall: The criticism of Wayland’s slow delivery, accessibility gaps, and implementation problems is reasonable. The central technical mistake is treating Vulkan as an alternative to Wayland, when they solve different layers of the graphics stack.

https://chatgpt.com/s/t_6a981031026081918ea3879e3e08bccf
