Steam Deck LCD as a 4K video player on a TV (docked)

## Checked on a Deck LCD (2026-10-01)

`vainfo` lists `VAProfileAV1Profile0 : VAEntrypointVLD`, so VA-API exposes AV1 hardware decoding on the LCD model (Van Gogh, VCN 3.1.0). Three Gemini answers claimed there is no AV1 decode; they were wrong. A greyed-out AV1 option in Steam Link Remote Play is a separate thing.

Not verified yet: that Kodi actually uses it (press `O` during playback and look at the codec info), HDR10 passthrough to the TV, TrueHD/Atmos bitstreaming.

## Install vainfo (not shipped with SteamOS)

```shell
# only needed once; skip if the deck user already has a password
passwd
sudo steamos-readonly disable
sudo pacman-key --populate holo
sudo pacman -S libva-utils
vainfo | grep -i av1
sudo steamos-readonly enable
```

- `signature from "GitLab CI Package Builder ... steamos.cloud" is unknown trust` means the Valve keys are missing: `--populate holo` fixes it. The `archlinux` keyring was not needed (see `ki-editor_and_ghostty.md`, which does the same).
- `error: failed to init transaction (unable to lock database): Read-only file system` means `steamos-readonly disable` was not run (or `enable` was run too early). The pacman change is wiped by a SteamOS update.
- No deck password set yet: `passwd` asks for a new password directly. If one was set and forgotten, there is no simple reset; installing packages is not needed for the Kodi route below.

## Setup suggested by the models (untested by me)

- Player: Kodi from Flathub (Discover in Desktop mode), add as a non-Steam game, enable VAAPI. Control with Steam Input or the Kore/Yatse phone app. The dock has no CEC.
- mpv (`--hwdec=auto --vo=gpu-next`) is better for testing HDR and tone mapping; VLC is weaker as a couch UI.
- HEVC 8/10-bit, VP9 and AV1 decode in hardware; dock output is 4K60 over HDMI 2.0. Dolby Vision does not work fully: profile 8 falls back to HDR10, profile 5 shows wrong colours.
- Files: USB SSD in the dock, or an SMB/NFS share. Wi-Fi N 5 GHz gives roughly 50-150 Mbit/s, which is too little for peaks of 4K remuxes (average 50-80, peaks above 100): use the dock's gigabit Ethernet and wire the server too.
- Jellyfin is not needed for this: Kodi reads SMB/NFS shares and keeps metadata and watched state locally. You lose cross-device sync and web access.
- Exit playback before suspending the Deck; sleep during playback can desync audio or crash the session.
