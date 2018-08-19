## iphone connects to wifi, windows 10 does not

iphone got ip 192.168.3.196,Windows 192.168.0.30 (or similar).

- I clicked Properties on wifi which Windows connected to,
- IP settings -> Edit
- IP address 192.168.3.199
- Subnet prefix length 24 (for 255.255.255.0)
- Gateway 192.168.3.1
- Prefered DNS 8.8.8.8 (Google or can be Cloudflare 1.1.1.1)

And it worked.

- https://medium.com/@nykolas.z/dns-resolvers-performance-compared-cloudflare-x-google-x-quad9-x-opendns-149e803734e5
