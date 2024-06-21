## vertical tabs

I see that tree vertical tabs like TreeStyleTabs or Sidebery does not work for me when using vim keybindings. Flat structure seems better. So I am using using Sidetabs.

## key mappings

- `f` - same tab
- `F` - new tab in background
- `;t` - new tab in foreground
- `d` - close tab (`cmd+w`)
- `u` - undo close tab (`cmd+shift+t`)
- `b` - buffers (tabs) in current window
- `B` - buffers (tabs) in all windows

- https://cheatography.com/goumlechat/cheat-sheets/tridactyl/

### Help

`bind ? tabopen https://github.com/tridactyl/tridactyl/blob/master/src/lib/config.ts#220`

### Switching J with K makes more sense

`bind --mode=normal K tabprev`

`bind --mode=normal J tabnext`

### Restricted sites

Going prev and next tab does not work on all tabs, for example suport.mozilla.com, addons.mozilla.org or extension pages. So I am using `cmd+opt+left/rigth`.

Setting this `Extensions > Tridactyl > Setttings > Run on sites with restrictions: Allow` or
`extensions.quarantinedDomains.enabled` in `about:config` didn't allow key bindings on these sites.

- https://support.mozilla.org/en-US/kb/quarantined-domains

## close tab and go to next on the right

I have installed https://addons.mozilla.org/en-US/firefox/addon/select-after-closing-current/ with settings:

- after closing select right: tab
- left: tab Shortcut 1: cmd+shift+e

I wanted also binding to to to next tab after closing with tridactyl:

`bind D composite tabprev; tabclose #`

But it looks like it is by default with D.

`js tri.excmds.composite('tabprev;', 'tabclose #')` https://github.com/tridactyl/tridactyl/blob/507ea9d8be4a4987f72ad15f24e1908d6e92c22b/src/lib/config.ts#L267

This does not work:

`bind D composite tabnext | tabclose #`

> # is the index for the previously used tab https://github.com/tridactyl/tridactyl/issues/337#issuecomment-385102092

- https://github.com/tridactyl/tridactyl/wiki/Adding-your-own-functionality
- How to add new commands to Tridactyl https://lacamb.re/blog/tridactyl_commands.html
- https://www.ghacks.net/2018/09/12/configure-what-firefox-does-when-you-close-a-tab/
- example bind command with tabprev https://elonwoo.com/blog/20210120_tridactyl%20-on-firefox/
- https://tridactyl.xyz/build/static/docs/modules/_src_excmds_.html#command
- https://tridactyl.xyz/build/static/docs/modules/_src_excmds_.html#composite
- moz-extension://06b6b31e-1989-46d3-8b36-e07c9b388ac8/static/docs/modules/_src_excmds_.html#jsb
- new API https://qiita.com/piroor/items/ea7e727735631c45a366
- https://raw.githubusercontent.com/arimasou16/dotfiles/master/.tridactylrc
- http://snippets.cacher.io/snippet/680be444961d1a3e0459
- function tabclose https://github.com/tridactyl/tridactyl/blob/507ea9d8be4a4987f72ad15f24e1908d6e92c22b/src/excmds.ts#L3008
- https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/API/tabs/create
- https://support.mozilla.org/en-US/kb/keyboard-shortcuts-perform-firefox-tasks-quickly

## bind ? for help

`bind ? tabopen https://github.com/tridactyl/tridactyl/blob/master/src/lib/config.ts#220`

## Disable mode indicator

`:set modeindicator false`

Reload page.

https://github.com/tridactyl/tridactyl/issues/4738

## delay when using key binding

@PurpleRamen

Can native message fix the fundamental problems in keyhandling? Meaning it can react to keys without the site fully loaded? Work on all sites and dialogs? Have a predictable behaviour instead of timing-problems which can happen now if you type to fast? For example, opening the commandline and typing something to fast can have the effect that the typed text does not end in the commandline but instead is handled outside of it.

@Jaepa

Sadly no. There are some issues still that may not ever be addressable with how Firefox's WebExtensions currently exist.

Some things have Bugzilla tickets to fix in a future release, but something just won't be possible as it stands today.

https://news.ycombinator.com/item?id=17363415

## bind

In tridactyl, every keypress is bound to an ex command. If you want to know what : is bound to, you need to run `bind :`. This will tell you that `:` is bound to `fillcmdline_notrail`. You can then bind `;` to `fillcmdline_notrail` with `bind ; fillcmdline_notrail`.
If you'd rather have `;` be translated to `:` for all default bindings, you can use `:keymap`, like this: `keymap : ;`. I believe `:keymap` only works in normal mode for now though.

to switch `:` with `;`:

```
keymap ; :
keymap : ;
```

The order is important - you won't be able to open the command line if you run the second command first.

https://github.com/tridactyl/tridactyl/issues/1367#issuecomment-464599820
