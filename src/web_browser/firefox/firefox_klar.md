## tracking and telemetry

You can disable it in the settings, and you can install Firefox Klar (the exact same code, but made for more privacy-consious countries) from FDroid[1] which has everything disabled by default.

- https://f-droid.org/packages/org.mozilla.klar/
	
piotrkubisa:

> " Firefox Klar is a version of Firefox Focus for Germany, Austria and Switzerland with user activity tracking disabled by default." [1]
> "For clients that have "send anonymous usage data" enabled Focus sends a "core" ping and an "event" ping to Mozilla's telemetry service. Sending telemetry can be disabled in the app's settings. Builds of "Focus for Android" have telemetry enabled by default ("opt-out") while builds of "Klar for Android" have telemetry disabled by default." [2]

[1]: https://f-droid.org/packages/org.mozilla.klar/
[2]: https://github.com/mozilla-mobile/focus-android/wiki/Telemetry

- https://news.ycombinator.com/item?id=15049171
- https://www.edge.org/response-detail/27195

## content blocker

I installed Firefox Focus for iOS simply for its content blocker. I still prefer using mobile safari, but augmented with three content blockers:
- Firefox Focus, which blocks all sorts of stuff
- 1Blocker, which blocks all sorts of stuff
- Unobstruct, which blocks Medium's "dickbar" popups.
reply

- https://news.ycombinator.com/item?id=15049171

## clear history

Focus does not seem to erase your history in a way you may expect. Try this on Android:
- Erase your history.
- Go to HN, click any link you haven't clicked before.
- Wait for it to load.
- Erase your history. Make sure you see the notification "Your browsing history has been erased".
- Go to HN again, and see the link you've just clicked still highlighted as 'visited'.
reply

It's likely that's because it currently uses the built-in Android WebView (which may store its own pseudo-history). That is a problem, but I believe their plans to replace WebView with Gecko will likely solve this problem. https://github.com/mozilla-mobile/focus-android/issues/13

- https://news.ycombinator.com/item?id=15049171

## alternatives

Can we have something similar for desktop as well?

You could, until mozilla decided to drop support for extensions that made this possible that is.

Alternatively there is waterfox + ublock origins.

Waterfox is firefox without the mozilla crap:

- Disabled Encrypted Media Extensions (EME)
- Disabled Web Runtime (deprecated as of 2015)
- Removed Pocket
- Removed Telemetry
- Removed data collection
- Removed startup profiling
- Allow running of all 64-Bit NPAPI plugins
- Allow running of unsigned extensions
- Removal of Sponsored Tiles on New Tab Page
- Addition of Duplicate Tab option
- Locale selector in about:preferences > General

Adding a bunch of legacy extensions to your Firefox is going to do the opposite of making it a fast, lightweight browser.

GNU IceCat does many of the same things. And you can get it on FDroid as IceCatMobile.

There is also the Brave browser, which I believe covers the same ground : https://play.google.com/store/apps/details?id=com.brave.browser

Brave goes further, it's https by default and even includes fingerprint blocking. It's been my default browser for while now and it's a joy to know I'm not feeding the beast.

- http://www.ericom.com/solutions/secure-browsing/
