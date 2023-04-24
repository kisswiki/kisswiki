Disable:

`sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist`

Enable:

`sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist`

Status of index on volume:

`mdutil -s /`

Disable the index:

`mdutil -i off /`

Enable the index:

`mdutil -i on /`

Erase the current Spotlight index:

`mdutil -E /`

https://gist.github.com/adamstac/1249295

Categories: `System Settings > Siri & Spotlight > Search results`

- https://apple.stackexchange.com/questions/424559/hide-safari-and-chrome-internet-results-in-spotlight-searches
  - https://support.apple.com/pl-pl/guide/mac-help/mchl62db64f5/mac
- https://apple.stackexchange.com/questions/265749/what-is-spotlight-indexing-and-should-i-turn-it-off
- https://apple.stackexchange.com/questions/388882/how-to-disable-spotlight-and-mds-stores-on-mac-os-catalina

## Alternative launcher

- https://apps.apple.com/us/app/l%D0%B0uncher/id1040928289
