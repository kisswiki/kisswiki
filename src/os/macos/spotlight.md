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

## Categories

`System Settings > Siri & Spotlight > Search results`
