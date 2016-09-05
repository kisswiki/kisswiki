## In Virtualbox

- enp0s3 is NAT
- enp0s8 is host-only

/etc/dhcpcd.conf

```
interface enp0s8
static ip_address=192.168.56.12/24
static routers=192.168.56.1
static domain_name_servers=192.168.56.1 8.8.8.8
```

```
systemctl start dhcpd
systemctl enable dhcpd
```

- https://wiki.archlinux.org/index.php/Dhcpcd#Static_profile
