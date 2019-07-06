## traceroute-geolocation

`sudo nmap --traceroute --script traceroute-geolocation google.com`

Command from https://niebezpiecznik.pl/post/chiny-po-raz-kolejny-przejely-internetowy-ruch-z-europy/#comment-712604

The command does not work with nmap installed from snap in Ubuntu: `Couldn't open a raw socket. Error: Permission Denied (13)`.

I thought that it is because of this:

>Only processes with an effective user ID of 0 or the CAP_NET_RAW capability are allowed to open raw sockets

So I tried this:

`setcap cap_net_raw,cap_net_admin=eip /snap/bin/nmap`

as described on:

- https://secwiki.org/w/Running_nmap_as_an_unprivileged_user
- https://stackoverflow.com/questions/6826407/why-i-cant-create-raw-socket-in-ubuntu
- auto set `NMAP_PRIVILEGED` https://unix.stackexchange.com/questions/207863/how-to-see-if-a-file-has-cap-net-admin/207872#207872

But I could not do this on snap, only on normal files. Searching for extracting snap gave no result.

So instead I have `snap remov nmap` https://tutorials.ubuntu.com/tutorial/basic-snap-usage#3

Installed nmap from deb converted from rpm https://nmap.org/book/inst-linux.html . I needed to reinstall it, because somehow `/usr/share/nmap` was not installed.

After that I finally can run nmap but got error. Trying with `-d` got this output:

```
NSE: traceroute-geolocation against google.com (172.217.16.46) threw an error!
/usr/bin/../share/nmap/scripts/traceroute-geolocation.nse:138: bad argument #1 to 'format' (number expected, got table)
stack traceback:
	[C]: in function 'string.format'
	/usr/bin/../share/nmap/scripts/traceroute-geolocation.nse:138: in upvalue 'output_hop'
	/usr/bin/../share/nmap/scripts/traceroute-geolocation.nse:164: in function </usr/bin/../share/nmap/scripts/traceroute-geolocation.nse:150>
	(...tail calls...)
```

so I see ip addresses but without geolocation. Output should be like on example here https://nmap.org/nsedoc/scripts/traceroute-geolocation.html .

After using https://github.com/nmap/nmap/blob/74f1b37ff2c44378d587e35de6ab27551d387dfd/scripts/traceroute-geolocation.nse got the same error.

Trying from source https://nmap.org/book/inst-source.html

Got the same error.

I have opened the issue https://github.com/nmap/nmap/issues/1654 according to https://nmap.org/book/man-bugs.html .

## show on map

https://github.com/nmap/nmap/issues/575
