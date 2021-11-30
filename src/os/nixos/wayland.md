- https://github.com/NixOS/nixpkgs/issues?q=is%3Aissue+is%3Aopen+in%3Atitle+wayland
- [nixos/gdm: enable nvidiaWayland by default by fabianhjr · Pull Request #147153 · NixOS/nixpkgs](https://github.com/NixOS/nixpkgs/pull/147153)
- https://discourse.nixos.org/t/nvidia-users-testers-requested-sway-on-nvidia-steam-on-wayland/15264/42

## why wayland is under xserver?

GNOME uses Wayland by default (as long as your hardware has support) IIUC. So I use something like this.

```nix
services.xserver = {
	enable = true;
	displayManager.enable = true;
	desktopManager.gnome.enable = true;
};
```

The fact that this is under xserver is really just legacy. Other than XWayland I have no X.

https://www.reddit.com/r/NixOS/comments/r1djqy/comment/hly6o8i/

Currently desktopManagers and displayManagers are part of the serivces.xorg namespace

This is problematic as there are greeters such as slimd and greetd that support wayland and can run independently of x11

https://github.com/NixOS/nixpkgs/issues/102542

The GDM module was created at the time Wayland was not supported, probably still in the drawing board. As such it (and all the other display/desktop/window managers) were lumped under the services.xserver prefix. And when we added support for Wayland, it was conservative change, not messing around with the existing options.

I guess it would make sense to move services.xserver.displayManager to something like desktop.displayManager now.

https://discourse.nixos.org/t/newb-question-any-caveats-with-gnome-wayland-is-it-worth-moving-to-wayland-instead-of-x11/5370/14
