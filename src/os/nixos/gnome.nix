## Turn of gnome-terminal sounds

There are many sounds when there is i.e. installation of mongodb and there are some warnings.

`gsettings set org.gnome.desktop.sound event-sounds false`

https://unix.stackexchange.com/questions/444681/how-to-turn-off-alert-sounds-sound-effects-on-gnome-from-terminal#comment1069287_444869

## Enable

Open gnome-extensions-app and enable extensions with global switch.

Then enable specific extensions. You may need to `alt+f2 > r` on xorg or relogin or reboot to enable extensions switch.

- https://www.reddit.com/r/NixOS/comments/nw5fp3/gnome_extensions/
- https://discourse.nixos.org/t/recommended-way-to-add-gnome-extensions/5589/3

## Extension from nix too old

The one installed from nix maybe too old for current gnome. Then install from https://extensions.gnome.org.

- https://unix.stackexchange.com/questions/437248/how-can-i-install-gnome-shell-extensions-from-extensions-gnome-org-through-firef/437249#437249
- https://discourse.nixos.org/t/cannot-enable-dash-to-dock-gnome-extension/16085
- https://discourse.nixos.org/t/gnome-extensions-updates-and-testing/16088/2
