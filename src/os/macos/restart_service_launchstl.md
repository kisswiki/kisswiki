`launchctl stop redis; launchctl start redis` didn't work.

I needed to

```
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
```

- https://serverfault.com/questions/194832/how-to-start-stop-restart-launchd-services-from-the-command-line
- https://apple.stackexchange.com/questions/364094/how-to-view-status-of-service-e-g-whether-its-running-in-a-format-similar-to
