- https://askubuntu.com/questions/544254/which-image-viewers-in-linux-support-the-webp-image-format/982955#982955
- gthumb supports webp http://www.ktechpit.com/linux/use-webp-images-ubuntu-linux/
- https://itsfoss.com/webp-ubuntu-linux/
- https://www.reddit.com/r/linuxquestions/comments/5ymj6d/no_webp_support_in_eye_of_gnome/
- Eye of GNOME doesn't support WebP https://en.m.wikipedia.org/wiki/Eye_of_GNOM://en.m.wikipedia.org/wiki/Eye_of_GNOME
- [[feature request] add support for webp (#103) · Issues · GNOME / gdk-pixbuf · GitLab](https://gitlab.gnome.org/GNOME/gdk-pixbuf/issues/103)
- Webp (shared-mime-data) image format missing? RESOLVED FIXED https://bugs.freedesktop.org/show_bug.cgi?id=41155

## Nautilus thumbnailer

```
$ sudo apt instal webp
$ sudo vim /usr/share/thumbnailers/webp.thumbnailer`
```

with the content:

```
[Thumbnailer Entry]
Exec=/usr/bin/dwebp %i -scale 100 100 -o %o
MimeType=image/x-webp;image/webp;
```

Restart nautilus

`nautilus -q`

https://askubuntu.com/questions/617047/how-to-preview-dds-and-webp-images-on-nautilus/617068#617068
