
## Dark mode

- https://addons.mozilla.org/en-US/firefox/addon/owl/?src=search
- https://addons.mozilla.org/en-US/firefox/addon/darkreader/
- https://addons.mozilla.org/en-US/firefox/addon/nightreader
- https://addons.mozilla.org/pl/firefox/addon/dark-background-light-text
- https://addons.mozilla.org/pl/firefox/addon/simple-night-mode

### Dark about:blank

- https://github.com/overdodactyl/ShadowFox
- https://github.com/Izheil/Firefox-57-full-dark-theme-with-scrollbars
- https://addons.mozilla.org/en-US/firefox/addon/black-new-tab/

1. Open `about:profiles` in Firefox.
2. Open you profile directory.
3. Create `chrome/userContent.css` with content:

```css
@-moz-document url("about:newtab") {
    body {
        background-color: #000000 !important;
        background-image: url("image.png") !important;
        background-repeat: no-repeat !important;
        background-position: center !important;
    }
}
```

4. Restart Firefox.

- https://www.reddit.com/r/firefox/comments/693t7t/how_to_change_newtab_backgrounds_color/dh3uk8s/
- https://superuser.com/questions/603218/how-to-make-the-aboutblank-page-black-or-any-other-color-in-firefox

You can also install ext for new tab blank:

In Firefox 41 that browser.newtab.url pref is gone. That pref was being abused by malware so frequently that Mozilla decided to remove that pref to eliminate that type of hijack. You will need an extension such as this to restore it. https://addons.mozilla.org/en-US/firefox/addon/new-tab-override/

https://support.mozilla.org/en-US/questions/1087442

But then change in css to `url("about:blank")`.

## dark theme

`Add-ons > Themes > Dark > Enable`

`Extensions > Tree Style Tab > Preferences > Appearance > Plain Dark`
