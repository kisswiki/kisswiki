## dns over https and esni

https://torrentfreak.com/encrypted-dns-and-sni-make-pirate-site-blocking-much-harder-190702/

How to setup for cloudflare https://1.1.1.1/dns/

`Firefox > about:config > network.security.esni.enabled > true`

I have restarted the Firefox but only TLS 1.3 passed the test https://www.cloudflare.com/ssl/encrypted-sni/.

After turning off/on wire connection, DNSSEC test passed.

After `network.trr.mode 2` and Firefox restart all tests passed

- https://blog.cloudflare.com/encrypt-that-sni-firefox-edition/
- https://wiki.mozilla.org/Trusted_Recursive_Resolver
- If your web browser does not support ESNI https://github.com/jedisct1/dnscrypt-proxy

## ISP can do reverse lookups on ip address

Trolltaku

But what is useless is DNS encryption in general. Your ISP can just log the IP addresses you connect out to which you have looked up DNS entries for in secret, and do reverse lookups on those to find out what you requested in the first place.

What's the point of encrypted DNS when your ISP still ultimately has the full list of IP addresses you connected to?

evaryont

Well, there are VPNs for that particular problem.

However, the reality of the Internet today is that many websites do not have dedicated IP addresses - many sites are hosted on the same IP. So although the ISP may know which IP address you connected to, it doesn't necessarily know which website hosted on it you actually visited.

Obvious example: Cloudflare. They have a range of IP addresses that you hit for hundreds of websites. Not easy to figure out which one of those you visited.

https://www.reddit.com/r/privacytoolsIO/comments/7wakeh/dnscrypt_v2_vs_dnsoverhttp2/duikp2x/

### Solution: unbound?

Who do you not want to see your DNS requests? If you use either of these methods, a third party DNS service will see all your requests. Your ISP won't see them (encrypted), but you will immediately follow up your encrypted DNS with clear text requests for IP addresses, so your ISP will know where you are browsing anyway.

Since the ISP is going to see all your traffic anyway, there is no reason to hide the DNS requests from them. My recommendation would be to use [unbound](https://docs.pi-hole.net/guides/unbound/) as your local resolver. It doesn't use a third party DNS provider and it uses authentication to validate that the returned IP's from the name servers are un-altered. Plus, as you control the resolver, there is no filtering or re-directing.

Easy to set up using the guide you referenced.

With encrypted DNS, you need to trust two parties - the DNS provider and your ISP.

With unbound running locally, you only need to trust your ISP.

https://www.reddit.com/r/pihole/comments/9nkjzz/dnscryptproxy_vs_cloudflared_vs_unbound/e7my2hm/

Unbound is a caching DNS server that’s capable of securing the connection from the Pi to 1.1.1.1.

https://blog.thestateofme.com/2018/04/04/howto-secure-your-dns-with-a-raspberry-pi-unbound-and-cloudflare-1-1-1-1/

## OCSP Leaking

Ale nawet gdybyś korzystał z innych serwerów DNS (i nawet takich, które szyfrują zapytania i odpowiedzi), to dalej ISP będzie mógł ustalić domenę do której się łączyłeś — odczytując ją z certyfikatu używanego do negocjacji połączenia HTTPS.

https://niebezpiecznik.pl/post/co-wie-o-tobie-twoj-dostawca-internetu-i-jak-sprawic-aby-nie-widzial-tego-co-robisz-na-komputerze/

http://blog.seanmcelroy.com/2019/01/05/ocsp-web-activity-is-not-private/

https://bugzilla.mozilla.org/show_bug.cgi?id=1535235#c3

## verify your VPN doesn't leak DNS

https://www.dnsleaktest.com/

https://security.stackexchange.com/questions/122547/is-there-a-point-to-dnscrypt-when-using-vpn

## Windows 10 needs DNSCrypt

Windows 10 is so smart, that even if static dns resolvers are provided for the network adapter it ignores that and selects the local dns and its faster.

I solved this problem by using DNSCrypt proxy. Since it sends the dns request back to the same machine (127.0.0.1), windows thinks it is the fastest route and from there dns-crypt handles request.

https://security.stackexchange.com/questions/122547/is-there-a-point-to-dnscrypt-when-using-vpn/144859#144859

## find the fastest DNS resolver from the list for dnscrypt-proxy

https://askubuntu.com/questions/664790/dnscrypt-proxy-find-the-best-dns-resolver-and-update-the-dnscrypt-resolvers-li

## DNSSEC vs DNSCrypt

DNSSEC allows a resolver to verify the records received from authoritative servers. It ensures that these records are identical to what whoever controls the zone actually configured.

DNSCrypt allows a client to verify the records received from a resolver. It ensures that these records are identical to what the resolver sent.

If you are running a DNSSEC-validating resolver locally, and only sending queries to DNSSEC-signed domains, DNSCrypt is useless.

Problem is that DNSSEC is not widely deployed yet. Just like IPv6, the protocol has been around for ages, it works just fine, but as long as there is no urgency to use it (such as kitten videos accessible only over IPv6), people are too lazy to switch.

For non DNSSEC-signed domains, DNSCrypt at least prevents the guy sitting next to you at Starbucks and sharing the same network from hijacking your DNS queries. DNS is one of the easiest protocol to hijack on a local network, and there are even Android apps to do it.

https://www.reddit.com/r/sysadmin/comments/2hn435/dnssec_vs_dnscrypt/ckuhcbu/
