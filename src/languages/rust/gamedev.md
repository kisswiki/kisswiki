- wgpu is the future https://gfx-rs.github.io/2019/03/06/wgpu.html
  - https://news.ycombinator.com/item?id=19327043

Not only for web but native

- supports vulkan and metal https://github.com/gfx-rs/wgpu

- maybe addapt that https://github.com/bwasty/vulkan-tutorial-rs to vulkano?

- wgpu-rs uses Rendy from Amethyst's people https://www.reddit.com/r/rust_gamedev/comments/bv7w2f/wgpurs_now_uses_rendy_to_manage_memory_and/
  - https://github.com/amethyst/rendy

## Do you need to know Vulkan?

>Keep in mind that Vulkan is a spec, developed by Khronos Group. It meens that you should keep this link handy https://www.khronos.org/vulkan/ Especially https://www.khronos.org/registry/vulkan/specs/1.0/refguide/Vulkan-1.0-web.pdf and https://www.khronos.org/registry/vulkan/ because no matter what rust library for Vulkan you use, you'd have a moment when part of the functionality is not ported to rust (there is no binding for rust) and you'd have to implement it yourself by calling C functions from the native library. Where to get signatures for those functions? In spec

https://www.reddit.com/r/rust/comments/821vox/how_to_write_game_engine_with_rust_and_vulkan/dv75zlb/

## Vulkano obsolete

consider vulkano obsolete https://github.com/vulkano-rs/vulkano/issues/1241#issuecomment-543072371

>suitability of wgpu and rendy for use within here nannou-org/nannou#374 if interested. I do agree with rukai though that wgpu at least seems to have a much brighter future than vulkano in terms of maintenance and progress.

- https://github.com/vulkano-rs/vulkano/issues/1241#issuecomment-543270196
  - https://github.com/nannou-org/nannou/issues/374

## Ash probably too

- https://github.com/MaikKlein/ash
