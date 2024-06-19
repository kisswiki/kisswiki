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

## bind

`bind ? tabopen https://github.com/tridactyl/tridactyl/blob/master/src/lib/config.ts#220`

## Disable mode indicator

`:set modeindicator false`

Reload page.

https://github.com/tridactyl/tridactyl/issues/4738
