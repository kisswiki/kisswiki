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
