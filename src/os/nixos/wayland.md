- https://github.com/NixOS/nixpkgs/issues?q=is%3Aissue+is%3Aopen+in%3Atitle+wayland

## How to set

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
