```nix
(chromium.override {
  commandLineArgs = [
    "--enable-features=UseOzonePlatform"
    "--ozone-platform=wayland"
  ];
})
```

this only rebuilds the wrapper script, does not rebuild Chromium.

https://discourse.nixos.org/t/chromium-with-wayland-switches/15635/2?u=rofrol
