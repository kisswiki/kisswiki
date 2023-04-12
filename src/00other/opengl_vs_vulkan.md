jfontan

Very nice! Using Vulkan seems to be a lot of work compared to Opengl.

datenwolf

It is when just looking at "simple" stuff like a Hello Triangle, or a mere phong shaded simple scene. However, as soon as multi threading enters the scene, tight control over resource allocation and sharing are required OpenGL is very cumbersome to properly use and coerce into a fast path.

On a very coarse measure of lines of code, I'd say the break even point where it makes sense to switch to Vulkan is, all the OpenGL related code in a program hits the 5kLoC mark; that is assuming that OpenGL was used correctly everywhere and no ill-informed shortcuts taken.

https://www.reddit.com/r/Zig/comments/12h8jbt/comment/jfqwfmu/
