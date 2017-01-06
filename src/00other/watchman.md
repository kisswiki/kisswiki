- https://facebook.github.io/watchman/
- https://facebook.github.io/watchman/docs/cli-options.html

## quick start

elm-make.sh:

```shell
#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR && elm-make src/Main.elm --output=elm.js --debug && mv elm.js dist/elm.js
```

```shell
watchman watch `pwd`/src
watchman trigger `pwd`/src elm-make '*.elm' -- sh `pwd`/elm-make.sh
tail -f /tmp/.watchman.<User>.log
```

```shell
watchman trigger-list `pwd`/src
watchman trigger-del `pwd`/src elm-make
watchman shutdown-server
```

Note: Watchman will start service if it's not started yet.

Note: triggers persist after shutdown.
