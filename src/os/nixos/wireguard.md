- https://discourse.nixos.org/t/help-setup-wireguard/16066/3
- https://xn--4db.cc/inA0bbQf

run as root:

```bash
$ { cmd() { printf "\n# %s\n" "$*"; "$@"; }; cmd ip addr show; cmd ip -4 route show table all; cmd ip -4 rule show; cmd ip -6 route show table all; cmd ip -6 rule show; cmd wg; cmd ip netconf; cmd iptables-save; cmd nft list ruleset; } 2>&1 | curl -F'file=@-' https://0x0.st
```
