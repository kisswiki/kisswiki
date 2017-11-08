## IPSEC

- Fortinet is just an IPSEC VPN server - you don't specifically need their client to connect to it https://serverfault.com/questions/152233/connect-to-a-fortinet-vpn-with-ubuntu/154384#154384
- http://www.ipsec-howto.org/
- https://www.mantykora.net/tunelvpn
- https://raymii.org/s/tutorials/IPSEC_vpn_with_Ubuntu_16.04.html
- https://github.com/libreswan/libreswan
- https://www.strongswan.org/

## forticlient

- https://hadler.me/linux/forticlient-sslvpn-deb-packages/
- https://gist.github.com/milanchheda/bb7f9e54e9f0912dbbee87771c203a22
- https://kb.arubacloud.pl/pl/computing/konsola-odzyskiwania/instalacja-i-polaczenie-forticlient-ssl-vpn-w-linuxie.aspx

```bash
$ /opt/forticlient-sslvpn/64bit/forticlientsslvpn
```

>This is the first time you run forticlient ssl vpn
>and you need the admin privilege to do some system configuration setup

```bash
$ sudo /opt/forticlient-sslvpn/64bit/forticlientsslvpn

(showlicense:6632): IBUS-WARNING **: The owner of /home/romanfrolow/.config/ibus/bus is not root!
```

```
$ su
Password: 
root@roman:/home/romanfrolow# /opt/forticlient-sslvpn/64bit/forticlientsslvpn

(forticlientsslvpn:6921): GLib-GIO-CRITICAL **: g_dbus_connection_register_object: assertion 'G_IS_DBUS_CONNECTION (connection)' failed

(forticlientsslvpn:6921): GLib-GIO-CRITICAL **: g_dbus_connection_register_object: assertion 'G_IS_DBUS_CONNECTION (connection)' failed

(forticlientsslvpn:6921): GLib-GIO-CRITICAL **: g_dbus_connection_get_unique_name: assertion 'G_IS_DBUS_CONNECTION (connection)' failed
```

## openfortigui

- https://hadler.me/linux/openfortigui/
- https://github.com/theinvisible/openfortigui

Adding ppa from https://styrion.at/apt/ doesn't show any openfortigui packages available to install:

```bash
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2FAB19E7CCB7F415
echo "deb http://styrion.at/apt/ ./" > /etc/apt/sources.list.d/styrion.list
```


## openfortivpn

https://github.com/adrienverge/openfortivpn
