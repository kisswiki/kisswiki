## Deprecated?

- no longer actively developed by its original author https://users.rust-lang.org/t/glium-post-mortem/7063/1
- Other people are working on it though and SHAR is using it https://www.reddit.com/r/rust_gamedev/comments/66wuk2/choosing_the_right_libraries_for_building_a_game/dgqwcgm/

## vs gfx-rs

> The architecture of gfx-rs makes the opengl backend require more overhead.

It's nice to talk about overhead without benchmarks backing it, amiright? Glium does some weird stuff at runtime that also introduces overhead, e.g. each time bind_uniforms is called, it searches each parameter by name in the hash maps. That's something we do only once at the program initialization. We also provide multi-threading out of the box... so I'd say the performance numbers would heavily depend on the use case.

> if your choice of opengl is dictated by the goal of supporting as many previous-gen systems as possible then you might as well not use an api that only supports opengl as a fallback

This is misleading. GL is still the main backend for gfx-rs. We support GL starting from 2.1 as well as GLES 2 for mobile.

https://www.reddit.com/r/rust_gamedev/comments/6dtnlc/ggez_03_released/

## sRGB

Turns out that glium by default sets the default framebuffer with with glEnable (GL_FRAMEBUFFER_SRGB) at the beginning of the program. If I enable this option on the other test programs the performance is comparable to glium. I'm not sure exactly why this affects performance as all it's doing each frame is clearing the framebuffer, not going through any shader programs.

This is not the first time that glium's "SRGB" by default has caused problems for me (shader programs need to set outputs_srgb to prevent color values from being converted).

https://www.reddit.com/r/rust_gamedev/comments/6f6oix/why_is_glium_so_much_slower_for_a_trivial_frame/

I think the problem was that the system didn't have sRGB capable framebuffers, so GL_FRAMEBUFFER_SRGB didn't do anything. I ended up having to do the conversion myself in the shaders, with code like

`out_color = pow(color, vec4(1.0/2.2,1.0/2.2,1.0/2.2,1.0));`

https://github.com/glium/glium/issues/805



