```bash
# brief and color
$ ip -4 -br -c a
$ route -n
$ ip -4 -br -c r | column -t
$ ip route show default | column -t
$ a as addr, -4 for ipv4
$ ip -4 -o a | column -t
```

- [There are real reasons for Linux to replace ifconfig, netstat, etc | Hacker News](https://news.ycombinator.com/item?id=17151046)
  - https://linoxide.com/wp-content/uploads/2014/05/Linux-Nettools-vs-Iproute2.png
- https://www.linux.com/learn/replacing-ifconfig-ip
- https://stackoverflow.com/questions/8529181/which-terminal-command-to-get-just-ip-address-and-nothing-else/26694162#26694162
- https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf
- homepage.smc.edu/morgan_david/cs70/ip-cref.pdf
- https://www.cyberciti.biz/faq/linux-ip-command-examples-usage-syntax/
- https://serverfault.com/questions/912650/ip-command-equivalent-to-ifconfig-lo-x-x-x-x-up
- https://www.tecmint.com/ifconfig-vs-ip-command-comparing-network-configuration/

## How to get IP address

`ip -4 -j a | jq -r '.[] | select(.operstate=="UP") | .addr_info[].local'`

or

`ip -j route get 8.8.8.8 | jq -r '.[] | select(length>0) | .prefsrc'`

https://unix.stackexchange.com/questions/8518/how-to-get-my-own-ip-address-and-save-it-to-a-variable-in-a-shell-script
