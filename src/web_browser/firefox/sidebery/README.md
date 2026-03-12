## How it started

morsch:

Have you tried the Sidebery vertical tabs extension for Firefox?

https://github.com/mbnuqw/sidebery

https://news.ycombinator.com/item?id=40055025

## Hide Firefox tabs and sidebar revamped

about:config

to hide vertical tabs:

sidebar.verticalTabs false

to disable sidebar icons on the left:

sidebar.revamp false

Hide native horizontal tabs <https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/hide_tabs_toolbar.css>

`Sideberry > Settings > Tabs > Position of new tab > Place new tab (general rule): after active tab`

Width of sidebar in userChrome.css

- <https://www.reddit.com/r/firefox/comments/1dnea2r/for_those_of_you_trying_to_enable_vertical_tabs/>
- <https://www.reddit.com/r/firefox/comments/1h1xkj1/how_to_remove_the_new_sidebar/>

## Toggle with Ctrl+e

`Settings > Keybindings > General > Open/Close sidebar panel > ^E`

## Add a close tree button to the menu

`Settings > Menu Editor > Tabs > click "Close branch"`

https://github.com/mbnuqw/sidebery/issues/436#issuecomment-2070786297

## Make active tab more visible

`Settings > Styles editor > Other > Active el shadow > 0px 0px 3px 3px rgba(0,0,255,0.322), inset 0 0 0 1px rgba(255,255,255,0.133)`

## Do not flip to the previous tab when clicking on the active tab

`Settings > Mouse > Tab actions > Activate previously active tab when clicking on the active tab (Tab flip) > off`

https://github.com/mbnuqw/sidebery/issues/1272#issuecomment-1772495028

## setting custom icon for panel

Works only with local file, does not work with url.

## beware of drag and drop panel to another panel

It will add all tabs as pinned tabs.

https://github.com/mbnuqw/sidebery/issues/1615#issuecomment-2102485286

## Place new tab openend from pinned tab

`Settings > Tabs > Position of new tab > Place new tab openend from pinned tab > panel end`

## Panel logos

- Look at icons directory
- https://github.com/neovim/neovim.github.io/blob/master/logos/neovim-mark-flat.svg
- https://github.com/ziglang/logo/blob/master/zig-mark.svg
- https://upload.wikimedia.org/wikipedia/commons/0/0a/LeetCode_Logo_black_with_text.svg
- https://pl.wikipedia.org/wiki/Plik:DB_Schenker_logo.svg
