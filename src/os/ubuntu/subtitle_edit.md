## Install

```bash
$ sudo apt install mono-complete libmpv1
# get location of so file
$ dpkg -L libmpv1
# subtitle edit searches for so, not so.1
$ sudo ln -s /usr/lib/x86_64-linux-gnu/libmpv.so.1 /usr/lib/x86_64-linux-gnu/libmpv.so
```

After that I have downloaded portable version `SE359.zip`.

To play video in subtitle edit, I needed to click some in bottom left corner, because play button was not visible. After that it was visible.

- https://askubuntu.com/questions/428264/how-to-install-subtitle-edit-3-3/616882#616882
- https://github.com/SubtitleEdit/subtitleedit/issues/2386#issuecomment-485996147

## Links

- https://lintut.com/best-subtitle-editors-for-linux/
