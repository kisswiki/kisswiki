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
```
maybe should not modify this

>The 'slow' full screen transition is a security feature. If the transition was as fast as possible then malicious sites could fake the browser UI and a website below.
>https://www.reddit.com/r/firefox/comments/ajzzou/hey_guys_im_a_long_time_google_chrome_user_and/ef0tuid/

`full-screen-api.warning.timeout: 0`

- https://support.mozilla.org/pl/questions/1092730
- https://support.mozilla.org/pl/questions/1100620

## fullscreen F11 delay disable

`<profile>/chrome/userChrome.css`:

``` css
#navigator-toolbox[fullscreenShouldAnimate] {
    transition: none !important;
}
```

- https://www.reddit.com/r/firefox/comments/73ku5b/disabling_the_fullscreen_animation_in_quantum/dnr1zd1/
- http://kb.mozillazine.org/index.php?title=UserChrome.css

##

https://addons.mozilla.org/pl/firefox/addon/dont-touch-my-tabs

## max tabs and counter

https://addons.mozilla.org/en-US/firefox/addon/max-tabs-web-ext

## disable fullscreen hiding address bar and tabs

`about:config`

`browser.fullscreen.autohide: false`

## translate

- https://addons.mozilla.org/en-US/firefox/addon/traductor-de-google-firefox

## Container

- https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/
  - After uninstall and install of addon, I was able to click "Always open in default".
  - Press `+` longer to see menu with container types.
- https://addons.mozilla.org/en-US/firefox/addon/sticky-containers/
- https://addons.mozilla.org/en-US/firefox/addon/containers-on-the-go/
- https://addons.mozilla.org/en-US/firefox/addon/context-plus/

### Not tried yet

- https://addons.mozilla.org/en-US/firefox/addon/switch-container-plus/
- https://addons.mozilla.org/en-US/firefox/addon/close-container/

##

https://addons.mozilla.org/en-US/firefox/addon/lightbeam/

## faster scroll like in Google Chrome

```
general.smoothScroll.mouseWheel.durationMaxMS: 250
general.smoothScroll.currentVelocityWeighting: 0.15
general.smoothScroll.stopDecelerationWeighting: 0.8
mousewheel.min_line_scroll_amount: 40 (Try somewhere between 22 or 40, whatever feels most comfortable to you)
```

https://www.reddit.com/r/firefox/comments/ajzzou/hey_guys_im_a_long_time_google_chrome_user_and/ef1vlvh/

## Warn on quit

in about:config

```
browser.sessionstore.warnOnQuit true
browser.warnOnQuit true
```

- https://superuser.com/questions/1318336/how-to-disable-ctrlq-shortcut-in-firefox-on-linux/1352295#1352295

It does not warn when closing window with `ctrl+shift+w` when there are only pinned tabs:

- https://bugzilla.mozilla.org/show_bug.cgi?id=250983#c25
- https://bugzilla.mozilla.org/show_bug.cgi?id=587400#c113

And also you cannot override this shortcut https://superuser.com/questions/415773/disable-ctrlshiftw-shortcut-in-firefox-linux#comment1894710_415835

## Double-click in url to select segments

`browser.urlbar.doubleClickSelectsAll false`

https://bugzilla.mozilla.org/show_bug.cgi?id=611162

## offline mode for testing HTML5 cache

Not per tab like in Google Chrome. Only globally:

`☰ > Choose Developer > Work Offline`

- https://stackoverflow.com/questions/48393741/does-firefox-have-an-offline-throttling-mode-disable-network-feature
- https://stackoverflow.com/questions/2647272/simulate-offline-mode-for-html5-cache-testing

## close duplicate tabs

- https://addons.mozilla.org/en-US/firefox/addon/duplicate-tabs-closer/

## markdown url

https://addons.mozilla.org/en-US/firefox/addon/url2clipboard/