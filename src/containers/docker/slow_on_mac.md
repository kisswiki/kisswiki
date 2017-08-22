Something is wrong with syncing the FS between docker and the host OS. We were using the latest Docker for Mac.

You should try dinghy. It replaces the default sync with a local NFS server and forwards fsevents. (I disabled its other features) https://github.com/codekitchen/dinghy

https://news.ycombinator.com/item?id=15049724
