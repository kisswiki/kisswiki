## display filter

- https://wiki.wireshark.org/DisplayFilters
- http://www.thegeekstuff.com/2012/07/wireshark-filter/
- AND: `&&`
- OR: `||`
- filter only http: `http`
- filter http and filter out `protocol==SSDP` and `protocol==TLSV1`: `http && !udp && !ssl`
  - http://serverfault.com/questions/216814/wireshark-display-filter-protocol-tlsv1-and-packetlength
  - http://serverfault.com/questions/686595/how-can-the-ssdp-protocol-be-filtered-out-of-wireshark-view
- domain http://stackoverflow.com/questions/22028943/filtering-by-domain: `http.host contains "wp.pl"`

## Windows

Install npcap

- https://wiki.wireshark.org/CaptureSetup/Loopback
  - https://nmap.org/npcap/
- https://ask.wireshark.org/questions/29211/how-can-wireshark-capture-local-host-traffic-on-windows

## gzip

- https://stackoverflow.com/questions/12925769/wireshark-doesnt-decode-gziped-http-traffic-on-windows
- https://osqa-ask.wireshark.org/questions/6598/how-to-decompress-gzipped-contents

## http/2

- https://react-etc.net/entry/dump-and-debug-http-2-traffic-with-a-reverse-proxy-h2a-or-wireshark
- https://github.com/summerwind/h2a
- https://wiki.wireshark.org/HTTP2