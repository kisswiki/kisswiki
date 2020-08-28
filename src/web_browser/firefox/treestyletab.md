## userChrome.css for hiding horizontal tabs and showing minimize, maximize, close buttons

```css
@-moz-document url(chrome://browser/content/browser.xhtml) {
/* CSS to hide Firefox's tab bar but keep macOS window buttons (close/minimize/maximize)
    https://gist.github.com/stevelandeyasana/bd1a1fe0a1adea0ef9ffa90b31f09aa1
    https://superuser.com/questions/1268732/how-to-hide-tab-bar-tabstrip-in-firefox-57-quantum
    https://superuser.com/questions/1424478/can-i-hide-native-tabs-at-the-top-of-firefox
    https://superuser.com/questions/1268732/how-to-hide-tab-bar-tabstrip-in-firefox-57-quantum
*/
/***** MCI: Hide tab bar *****/
/* https://www.reddit.com/r/FirefoxCSS/comments/e7br59/hide_titlebar_and_tabs_in_firefox_71/f9yta9s/ */
  #tabbrowser-tabs {
    visibility: collapse !important;
  }
  
  /***** MCI: Move min-max-close buttons *****/
  #nav-bar {
    border-top: 0px !important;
    margin-right: 144px;
    margin-top: -32px;
  }

  #TabsToolbar .titlebar-spacer {
      display: none !important;
  }
}
```

## thinner tabs

I've also changed the style of TSTs in the add-on settings (all the way at the bottom; not in userChrome.css) such that the tabs don't take up as much vertical space and to hide the close box button (and only show it on the mouse-over event):

```
.closebox {
    display: none
}

.tab:hover .closebox {
    display: block;
}

.tab {
    padding-top: 0px;
    padding-bottom: 0px;
}
```
You can make `.tab` even tighter:

```
.tab .icon {
    padding-top: 2px; /* reducing it by 2px */
    padding-bottom: 2px;
}

:root {
    --tab-height: 22px; /* reducing it by 4px */
}
```

https://news.ycombinator.com/item?id=15343940

##

- https://github.com/piroor/treestyletab/wiki/Code-snippets-for-custom-style-rules#restore-old-built-in-themes
- `F1` to toggle TreeStyleTabs
- https://github.com/piroor/treestyletab/blob/master/README.md#addons-that-extend-tst
- https://www.thewindowsclub.com/force-links-to-open-in-background-firefox-chrome
- https://addons.mozilla.org/en-US/firefox/addon/open-link-with-new-tab/
- https://addons.mozilla.org/en-US/firefox/addon/long_press_new_tab/
- add-on consumes ridiculous amounts of RAM, CPU and freezes https://github.com/piroor/treestyletab/issues/2424
- https://support.mozilla.org/en-US/kb/firefox-uses-too-much-memory-or-cpu-resources
  - about:memory > Minimize memory usage
