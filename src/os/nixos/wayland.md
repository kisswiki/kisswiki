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
