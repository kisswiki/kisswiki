```
marwatk commented 2 days ago

@craigloewen-msft Will the logs collect routing information from the VM and host? The issue (which I think is a duplicate of #4277) is that some corporate VPNs are configured to capture all routes and don't allow split tunneling. In this situation no Hyper-V network interface can talk over the VPN (or in my case to any host). Here's a good description, though in my case the workaround didn't work.

Docker gets around this with vpnkit and a socket to NAT the traffic through a userland process.
```

https://github.com/microsoft/WSL/issues/5068#issuecomment-681138926

## Tried this but didn't work

```powershell
PS C:\> Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect"} | Get-NetIPInterface
ifIndex InterfaceAlias                  AddressFamily NlMtu(Bytes) InterfaceMetric Dhcp     ConnectionState PolicyStore
------- --------------                  ------------- ------------ --------------- ----     --------------- -----------
21      Ethernet 2                      IPv6                                                                Persiste...
21      Ethernet 2                      IPv6                  1390              25 Enabled  Connected       ActiveStore
21      Ethernet 2                      IPv4                                     1                          Persiste....
21      Ethernet 2                      IPv4                  1390               1 Disabled Connected       ActiveStore
```

```powershell
PS C:\> netsh interface ip show interfaces
Idx     Met         MTU          State                Name
---  ----------  ----------  ------------  ---------------------------
  1          75  4294967295  connected     Loopback Pseudo-Interface 1
  8          35        1500  connected     Wi-Fi
 18          25        1500  disconnected  Local Area Connection* 1
 23          65        1500  disconnected  Bluetooth Network Connection
 10          25        1500  disconnected  Local Area Connection* 2
 21        4000        1390  connected     Ethernet 2
 12        5000        1500  connected     vEthernet (Default Switch)
 30        5000        1500  connected     vEthernet (WSL)
```

```bash
~/personal_projects$ ping 127.0.0.1
PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.166 ms
64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.038 ms
64 bytes from 127.0.0.1: icmp_seq=3 ttl=64 time=0.053 ms

$ ping wp.pl

$ sudo ip link set eth0 mtu 1390
$ sudo ip link show eth0
4: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1390 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 00:15:5d:e1:6b:fe brd ff:ff:ff:ff:ff:ff
```

```powershell
PS C:\> Get-NetIPInterface -InterfaceAlias "vEthernet (WSL)" | Set-NetIPInterface -InterfaceMetric 1
PS C:\> Get-NetAdapter | Where-Object {$_.InterfaceDescription -Match "Cisco AnyConnect"} | Set-NetIPInterface -InterfaceMetric 4000
PS C:\> netsh interface ip show interfaces
Idx     Met         MTU          State                Name
---  ----------  ----------  ------------  ---------------------------
  1          75  4294967295  connected     Loopback Pseudo-Interface 1
  8          35        1500  connected     Wi-Fi
 18          25        1500  disconnected  Local Area Connection* 1
 23          65        1500  disconnected  Bluetooth Network Connection
 10          25        1500  disconnected  Local Area Connection* 2
 21        4000        1390  connected     Ethernet 2
 12        5000        1500  connected     vEthernet (Default Switch)
 30           1        1500  connected     vEthernet (WSL)

PS C:\> Get-DnsClientServerAddress -AddressFamily IPv4 | Select-Object -ExpandPropert ServerAddresses
192.168.0.1
165.27.212.22
165.27.212.24
```

```bash
$ nslookup yahoo.com
Server:         192.168.0.1
Address:        192.168.0.1#53

Non-authoritative answer:
Name:   yahoo.com
Address: 98.137.11.164
Name:   yahoo.com
Address: 98.137.11.163
Name:   yahoo.com
Address: 74.6.231.21
Name:   yahoo.com
Address: 74.6.143.26
Name:   yahoo.com
Address: 74.6.143.25
Name:   yahoo.com
Address: 74.6.231.20
Name:   yahoo.com
Address: 2001:4998:24:120d::1:0
Name:   yahoo.com
Address: 2001:4998:44:3507::8001
Name:   yahoo.com
Address: 2001:4998:124:1507::f000
Name:   yahoo.com
Address: 2001:4998:124:1507::f001
Name:   yahoo.com
Address: 2001:4998:44:3507::8000
Name:   yahoo.com
Address: 2001:4998:24:120d::1:1
```
