## Error: insufficient privileges to access the ebtables rulesets

`sudo apt upgrade`

https://bugs.launchpad.net/ubuntu/+source/ebtables/+bug/1774120

## Why

WSL does not implement all Linux ABI surface. Doesn't even pretend to, per the FAQ. Aspires to, hopefully.

#1451 is AF_NETLINK. Which is not AF_UNIX. Which is not AF_PACKET. And, is not AF_INET per #767.

https://github.com/Microsoft/WSL/issues/3274#issuecomment-394426061

## Solution

`sudo apt-mark hold ebtables`

https://github.com/Microsoft/WSL/issues/1761#issuecomment-392608892

or this https://github.com/Microsoft/WSL/issues/1761#issuecomment-392578042