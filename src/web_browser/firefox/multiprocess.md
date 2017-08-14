`about:support` to check:

`Multiprocess Windows 	0/1 (Disabled by add-ons)`

Install [Add-on Compatibility Reporter](https://addons.mozilla.org/en-US/firefox/addon/add-on-compatibility-reporter/) to see which add-ons disabled Multiprocess.

If you still has `Disabled by add-ons`, force multiprocess:

In `about:config` create boolean `browser.tabs.remote.force-enable` adn set it to `true`.

Monitor performance in `about:performance`.

- https://fossbytes.com/how-to-make-firefox-faster-by-enabling-multi-process-e10s-manually/
- https://www.reddit.com/r/firefox/comments/50ma2r/electrolysis_is_disabled_by_addons_but_which_ones/


