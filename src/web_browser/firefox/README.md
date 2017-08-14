# Firefox

## new page and new window empty package

Set homepage as `about:blank`.

1. In the Location bar, type about:config and press Enter. The about:config "This might void your warranty!" warning page may appear.
2. Click I'll be careful, I promise!, to continue to the about:config page.
3. Type browser.newtab.url in the search box.
4. Double-click the browser.newtab.url preference and change the url to about:blank

https://support.mozilla.org/en-US/questions/963855

## Reader View

- wider margins: install Better Reader. It enhances embeded Reader with more options
  - https://addons.mozilla.org/en-US/firefox/addon/better-reader/
  - http://www.ghacks.net/2015/11/07/better-reader-improves-firefoxs-reader-mode/
- https://userstyles.org/styles/114669/firefox-reader-custom-width-multi-column

## Dark mode

- https://addons.mozilla.org/pl/firefox/addon/dark-background-light-text
- https://addons.mozilla.org/pl/firefox/addon/simple-night-mode

### Dark about:blank

Install Stylish. Create new style:

```
@namespace url(http://www.w3.org/1999/xhtml);

@-moz-document url("about:newtab") {
  *{background-color:#000000;}
}
```

https://superuser.com/questions/603218/how-to-make-the-aboutblank-page-black-or-any-other-color-in-firefox

## Autohide address bar

https://addons.mozilla.org/pl/firefox/addon/aniverto/

## Container Tabs

- https://wiki.mozilla.org/Security/Contextual_Identity_Project/Containers
- https://news.ycombinator.com/item?id=13450143

## min tab width

```
about:config
browser.tabs.tabMinWidth
```

http://kb.mozillazine.org/Browser.tabs.tabMinWidth

## fullscreen video

`about:config`:

```
full-screen-api.transition-duration.enter: 0 0
full-screen-api.transition-duration.leave: 0 0
full-screen-api.warning.timeout: 0
```

- https://support.mozilla.org/pl/questions/1092730
- https://support.mozilla.org/pl/questions/1100620
