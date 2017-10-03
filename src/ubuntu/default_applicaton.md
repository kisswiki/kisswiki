## xenial

`System Settings > System > Details > Default Applications`

https://askubuntu.com/questions/91701/how-do-i-set-vlc-media-player-as-default-video-player

### for files like m4a

```
cat /usr/share/applications/defaults.list | grep Totem >> ~/.local/share/applications/mimeapps.list
```

`%s/org.gnome.Totem.desktop/mpv.desktop/gc`

http://libre-software.net/change-the-default-application-linux-mint-ubuntu/
