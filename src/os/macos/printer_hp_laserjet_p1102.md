## HP driver does not want to install, wants macos 12 or earlier. I have macos 12.2.1

`brew install --cask pacifist`

Go to <https://support.hp.com/us-en/drivers/selfservice/hp-laserjet-pro-p1102-printer-series/4110394/model/4110303>

Choose macos version, download driver, unpack dmg, run `pacifist > open package > select unpacked pkg > install with administrative privilieges > choose not to update files`.

`softwareupdate --install-rosetta --agree-to-license`

Go to printers, add, select driver for hp laserjet p1102

- you can use the demo version of Pacifist to install the drivers <https://discussions.apple.com/thread/253351919?answerId=256270737022#256270737022>

Note: Why need rosetta2?

This driver is for Intel architecture.

If `% tail -f /var/log/cups/error_log` shows:

```
execv failed: Bad CPU type in executable  
PID ... (hpRaster.bundle/.../rastertozjs) stopped with status 186 (Bad CPU type in executable)
```

It means, that rosetta is not installed

- <https://chatgpt.com/share/68efbd66-690c-800b-b535-a94bcf480026>
- <https://apple.stackexchange.com/questions/457472/how-to-install-rosetta-2-manually/457473#457473>
