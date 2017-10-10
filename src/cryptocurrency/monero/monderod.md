- https://monero.stackexchange.com/questions/4458/how-can-i-really-run-a-remote-node/4469

## limit network speed

`./monerod --limit-rate=1024`

or

`./monerod --limit-rate-up=512 --limit-rate-down=2048`

These values correspond to kB/s, so the above example specifies a one megabyte per second bandwidth limit.

https://www.antanst.com/blog/2015/05/22/setting-up-a-full-monero-node-in-ubuntu-14.04/

I would suggest setting your upload limit to something slow like 10 KB/s. Setting it to 0 would make it hard (maybe even impossible!) for you to find other peers to download from.

- https://monero.stackexchange.com/questions/3460/monerod-using-all-server-bandwidth
- https://monero.stackexchange.com/questions/3185/can-i-change-limit-up-speed
- https://www.reddit.com/r/Monero/comments/6ly1jq/gui_wallet_bandwidth_usage/
