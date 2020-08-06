1. Create userChrome.css https://www.userchrome.org/how-create-userchrome-css.html
2. Paste this:

```css
@-moz-document url(chrome://browser/content/browser.xhtml) {
/* REMOVE MEGABAR START
* VERSION 1.0.4
* CODE AT: http://userchrome.wesleybranton.com/megabar
* RELEASE NOTES: http://userchrome.wesleybranton.com/notes/megabar */
/* DISABLE EXPANDING START */
#urlbar[breakout][breakout-extend] {
    top: calc((var(--urlbar-toolbar-height) - var(--urlbar-height)) / 2) !important;
    left: 0 !important;
    width: 100% !important;
}

#urlbar[breakout][breakout-extend] > #urlbar-input-container {
    height: var(--urlbar-height) !important;
    padding-block: 0 !important;
    padding-inline: 0 !important;
}

#urlbar[breakout][breakout-extend] > #urlbar-background {
    animation-name: none !important;
    box-shadow: 0 1px 4px rgba(0, 0, 0, .05) !important;
}
/* DISABLE EXPANDING END */

/* REMOVE URL RESULT PADDING START */
.urlbarView {
    margin-inline: 0 !important;
    width: 100% !important;
}

.urlbarView-row {
    padding-block: 0 !important;
}
/* REMOVE URL RESULT PADDING END */

/* MOVE URL RESULT TYPE ICON TO LEFT START */
.urlbarView-type-icon {
    min-width: 16px !important;
    height: 16px !important;
    margin-bottom: 0 !important;
    margin-inline-start: 0 !important;
}

.urlbarView-favicon {
    margin-inline-start: 20px !important;
}
/* MOVE URL RESULT TYPE ICON TO LEFT END */

/* DISPLAY GO BUTTON WHEN TYPING START */
#urlbar-input-container[pageproxystate="invalid"] #urlbar-go-button {
    display: block !important;
}
/* DISPLAY GO BUTTON WHEN TYPING END */

/* ALWAYS SHOW PAGE ACTIONS START */
/* DISABLED BY DEFAULT - UNCOMMENT TO ENABLE */
/*#pageActionButton {
    display: block !important;
}*/
/* ALWAYS SHOW PAGE ACTIONS END */
/* REMOVE MEGABAR END */
}
```

- https://github.com/WesleyBranton/Remove-Firefox-Megabar/blob/master/remove_megabar.css
- https://support.mozilla.org/en-US/questions/1283911#answer-1303777
- https://support.mozilla.org/en-US/questions/1274579
- https://www.userchrome.org/firefox-changes-userchrome-css.html