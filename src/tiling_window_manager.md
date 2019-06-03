## xmonad

- https://xmonad.org/
- https://medium.com/@jD91mZM2/xmonad-vs-i3wm-797c37ec2a64
- https://blog.afoolishmanifesto.com/posts/hello-xmonad-goodbye-awesomewm/
- https://www.reddit.com/r/xmonad/comments/4c1ukl/why_is_i3_getting_more_popular_than_xmonad/

## wayland

- https://github.com/xmonad/xmonad/issues/38
- https://github.com/way-cooler/way-cooler
- https://github.com/swaywm/swa://github.com/swaywm/sway
  - https://drewdevault.com/2017/10/26/Fuck-you-nvidia.html
    - https://wiki.archlinux.org/index.php/wayland#Requirements
- https://github.com/waymonad/waymonad

## mulitiple screens and hdpi

What you're describing does exist, but as with most things GNU/Linux it's not user friendly in the slightest. What you need to do is to set your Xft DPI to a level that is comfortable for your HDPI monitor, then you need to 'upscale' your second non-HDPI by an equivalent amount. For example I have a 28" 4k monitor, and a 24" 1080p monitor, and I typically prefer a scaling factor of about 150%, so in my .Xresources I have 'Xft.dpi: 144' and I need to upscale the 1080p monitor with the following command:

xrandr --output DisplayPort-0 --auto --pos 0x0 --primary --output HDMI-A-0 --auto --pos 3840x540 --scale 1.5x1.5

Where HDMI-A-0 is the 1080p monitor. I've had a bug in the past where I would need to use the --panning option (e.g., --panning 2880x1620+3840+540) with the correct geometry to get everything working, but it seems to work fine now without that. If you do need to mess with the --panning option though may god help you.

https://news.ycombinator.com/item?id=20077119
