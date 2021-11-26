- https://nixos.wiki/wiki/Nvidia
  - https://nixos.org/manual/nixos/stable/#sec-x11-graphics-cards-nvidia
- https://discourse.nixos.org/t/getting-nvidia-to-work-avoiding-screen-tearing/10422/16
- https://github.com/asdrubalini/nixos-config/blob/298dc39381b041f7d197bee6813f12cff7d612e5/hardware/nvidia.nix#L10
- https://github.com/AusCyberman/nixos-config/blob/5deeb29a44f46fe7aa0b508e686b312fae6b5da5/systems/auspc/hardware-configuration.nix#L10
- https://github.com/AusCyberman/nixos-config/blob/5deeb29a44f46fe7aa0b508e686b312fae6b5da5/systems/auspc/configuration.nix
- [nixos/gdm: enable nvidiaWayland by default by fabianhjr · Pull Request #147153 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/pull/147153)

```bash
$ nix-env -iA nixos.glmark2
installing 'glmark2-2017-09-01'
these paths will be fetched (6.90 MiB download, 15.22 MiB unpacked):
  /nix/store/awfks5m44mqw1rs67vyj98s7sfnnp6j3-glmark2-2017-09-01
copying path '/nix/store/awfks5m44mqw1rs67vyj98s7sfnnp6j3-glmark2-2017-09-01' from 'https://cache.nixos.org'...
building '/nix/store/dx8ar3qs4dw57hp29rciy6razwx9c8ln-user-environment.drv'...
created 19 symlinks in user environment

[roman@msi-laptop:~]$ glmark2
=======================================================
    glmark2 2017.07
=======================================================
    OpenGL Information
    GL_VENDOR:     Intel
    GL_RENDERER:   Mesa Intel(R) UHD Graphics (CML GT2)
    GL_VERSION:    4.6 (Compatibility Profile) Mesa 21.1.4
=======================================================
[build] use-vbo=false: FPS: 4206 FrameTime: 0.238 ms
[build] use-vbo=true: FPS: 4199 FrameTime: 0.238 ms
[texture] texture-filter=nearest: FPS: 3763 FrameTime: 0.266 ms
[texture] texture-filter=linear: FPS: 3724 FrameTime: 0.269 ms
[texture] texture-filter=mipmap: FPS: 3588 FrameTime: 0.279 ms
[shading] shading=cel:^C

[roman@msi-laptop:~]$ nvidia-offload glmark2
=======================================================
    glmark2 2017.07
=======================================================
    OpenGL Information
    GL_VENDOR:     NVIDIA Corporation
    GL_RENDERER:   NVIDIA GeForce RTX 3060 Laptop GPU/PCIe/SSE2
    GL_VERSION:    4.6.0 NVIDIA 465.31
=======================================================
[build] use-vbo=false: FPS: 2826 FrameTime: 0.354 ms
[build] use-vbo=true: FPS: 3812 FrameTime: 0.262 ms
[texture] texture-filter=nearest: FPS: 3809 FrameTime: 0.263 ms
[texture] texture-filter=linear: FPS: 3806 FrameTime: 0.263 ms
[texture] texture-filter=mipmap: FPS: 3779 FrameTime: 0.265 ms
[shading] shading=gouraud:^C
```

- https://www.howtoforge.com/tutorial/linux-gpu-benchmark/
