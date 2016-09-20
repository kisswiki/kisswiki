> Od tego są trasy. Adresy służbowe kierujesz na bramę VPN. W Windows wygląda to tak:
route -p add 192.168.1.1 mask 255.255.255.255 192.168.4.254, gdzie 1.1 jest pożądanym adresem a 4.254 bramą VPN.
Oczywiście wcześniej rezygnujesz z bramy VPN jako domyślnej (ustawienia połączenia)
> -- http://www.spidersweb.pl/2016/09/opera-darmowy-vpn.html#comment-2906313949

- http://serverfault.com/questions/485933/specifying-gateway-for-vpn-connection
- http://superuser.com/questions/991646/client-to-client-route-on-windows-vpn
- http://superuser.com/questions/457020/openvpn-only-route-a-specific-ip-addresses-through-vpn
- http://superuser.com/questions/12022/how-can-i-make-the-windows-vpn-route-selective-traffic-by-destination-network
