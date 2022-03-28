native https://doesitarm.com/formula/redis/

`brew install redis`

## Restart

```
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
```

- https://serverfault.com/questions/194832/how-to-start-stop-restart-launchd-services-from-the-command-line
- https://apple.stackexchange.com/questions/364094/

## clear database

`redis flushdb`

https://www.cyberciti.biz/faq/how-to-flush-redis-cache-and-delete-everything-using-the-cli/
