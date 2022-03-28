`brew install keydb`

## launch

create ~/Library/LaunchAgents/homebrew.mxcl.keydb.plist (based on homebrew.mxcl.redis.plist)

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>KeepAlive</key>
	<true/>
	<key>Label</key>
	<string>homebrew.mxcl.keydb</string>
	<key>ProgramArguments</key>
	<array>
		<string>/opt/homebrew/opt/keydb/bin/keydb-server</string>
		<string>/opt/homebrew/etc/keydb.conf</string>
	</array>
	<key>RunAtLoad</key>
	<true/>
	<key>StandardErrorPath</key>
	<string>/opt/homebrew/var/log/keydb.log</string>
	<key>StandardOutPath</key>
	<string>/opt/homebrew/var/log/keydb.log</string>
	<key>WorkingDirectory</key>
	<string>/opt/homebrew/var</string>
</dict>
</plist>
```

validate with `plutil ~/Library/LaunchAgents/homebrew.mxcl.keydb.plist`

`RunAtLoad` will load service at macos start. https://superuser.com/questions/930389/how-to-start-a-service-using-mac-osxs-launchctl

curl -OJLN --output-dir /opt/homebrew/etc/ https://raw.githubusercontent.com/EQ-Alpha/KeyDB/v6.2.2/keydb.conf

launchctl load ~/Library/LaunchAgents/homebrew.mxcl.keydb.plist

## Restart

```
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.keydb.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.keydb.plist
```

- https://serverfault.com/questions/194832/how-to-start-stop-restart-launchd-services-from-the-command-line
- https://apple.stackexchange.com/questions/364094/

## clear database

`keydb-cli flushdb`

https://www.cyberciti.biz/faq/how-to-flush-redis-cache-and-delete-everything-using-the-cli/

## version

`keydb-cli --version`

## check health

```shel
% keydb-cli ping
PONG
```

## shutdown

`keydb-cli shutdown`

https://stackoverflow.com/questions/6910378/how-can-i-stop-redis-server/6910506#6910506
