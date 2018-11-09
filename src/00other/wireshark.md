## learn

- https://en.wikiversity.org/wiki/Wireshark/HTTP

## display filter

- `http and ip.src==127.0.0.1` https://wiki.wireshark.org/DisplayFilters
- http://www.thegeekstuff.com/2012/07/wireshark-filter/
- AND: `&&`
- OR: `||`
- filter only http: `http`
- filter http and filter out `protocol==SSDP` and `protocol==TLSV1`: `http && !udp && !ssl`
  - http://serverfault.com/questions/216814/wireshark-display-filter-protocol-tlsv1-and-packetlength
  - http://serverfault.com/questions/686595/how-can-the-ssdp-protocol-be-filtered-out-of-wireshark-view
- domain http://stackoverflow.com/questions/22028943/filtering-by-domain: `http.host contains "wp.pl"`

## Windows

Install npcap then install wireshark so you don't install winpcap.

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

## SSL

you do not need to reboot. To activate either:

- set environment variable e.g. SSLKEYLOGFILE to %USERPROFILE%\sslkeysENV.pms
- run chrome with argument e.g.: "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --ssl-key-log-file=%USERPROFILE%\sslkeysARG.pms

Open Wireshark, go to Edit > Preferences > Protocols > SSL. Under the option for ‘(Pre)Master-Secret log file name’ – Browse to your log file location (so e.g. /home/m00nie/master.txt).

`SSLKEYLOGFILE=$HOME/sslkeysENV2.pms curl ...`

- https://stackoverflow.com/questions/42332792/chrome-not-firefox-are-not-dumping-to-sslkeylogfile-variable
- https://jimshaver.net/2015/02/11/decrypting-tls-browser-traffic-with-wireshark-the-easy-way/
- https://www.m00nie.com/2015/05/decrypt-https-ssltls-with-wireshark/
- https://www.veritas.com/support/en_US/article.100044199

## HAR

- https://osqa-ask.wireshark.org/questions/43731/unable-to-open-or-import-http-archive-files-har-generated-by-chrome
- https://stackoverflow.com/questions/12330927/easiest-way-to-convert-pcap-to-json
- http://pcapperf.appspot.com/
  - https://github.com/andrewf/pcap2har
- https://github.com/jmatj/har2pcap

Line-based text data: application/json

## Line-based text data: application/json

I got this because I stringified already stringified json.

## data and no json

That's because there was no header `content-type: application/json`.

To read it you can `Follow HTTP` or sth.
