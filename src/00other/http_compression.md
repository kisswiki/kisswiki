- https://github.com/webpack-contrib/compression-webpack-plugin
- https://github.com/pierreinglebert/node-zopfli
- https://github.com/mynameiswhm/brotli-webpack-plugin
- https://github.com/topics/brotli?l=javascript
- Files are compressed in parallel https://github.com/silverwind/precompress
- [MayhemYDG/iltorb: Node.js module for brotli compression/decompression with native bindings](https://github.com/MayhemYDG/iltorb)
- https://github.com/jshttp/compressible
- https://webmasters.stackexchange.com/questions/22217/which-browsers-handle-content-encoding-gzip-and-which-of-them-has-any-special
- https://stackoverflow.com/questions/11653488/serving-gzipped-content-directly-bad-thing-to-do/11670562#11670562
- https://www.itworld.com/article/2693941/why-it-doesn-t-make-sense-to-gzip-all-content-from-your-web-server.html
- https://medium.com/@selvaganesh93/how-to-serve-webpack-gzipped-file-in-production-using-nginx-692eadbb9f1c
- https://stackoverflow.com/questions/35027028/when-should-javascript-not-be-gzipped
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Encoding
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Compression
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Encoding
- Works quite good https://github.com/gios/gzipper
- live-server does not support gzip https://github.com/tapio/live-server/issues/86

## deflate not needed

Looks like deflate is not needed:

- https://stackoverflow.com/questions/388595/why-use-deflate-instead-of-gzip-for-text-files-served-by-apache
- [option to disable DEFLATE encoding · Issue #25 · expressjs/compression](https://github.com/expressjs/compression/issues/25)
- deflate works in Safari 4.0 but is broken in Safari 5.1, it also always has issues on IE https://stackoverflow.com/questions/388595/why-use-deflate-instead-of-gzip-for-text-files-served-by-apache
- https://stackoverflow.com/questions/12467584/how-to-use-node-js-zlib-module-with-options

## nginx and brotli

- https://siipo.la/blog/poor-mans-brotli-serving-brotli-files-without-nginx-brotli-module
- ppa with brotli but without tls 1.3 https://github.com/cryptofuture/nginx-hda-bundle/issues/22#issuecomment-487590505
- compile nginx with brotli https://www.tinywp.in/nginx-brotli/
- https://medium.com/@wintermeyer/nginx-with-brotli-on-debian-stretch-2917b1147aec
- https://www.howtoforge.com/tutorial/how-to-install-nginx-with-brotli-compression-on-ubuntu-1804/
- https://www.vultr.com/docs/add-brotli-support-to-nginx-on-ubuntu-18-04
- brotli module for commercial nginx plus https://docs.nginx.com/nginx/admin-guide/dynamic-modules/brotli/
  - https://www.nginx.com/blog/whats-difference-nginx-foss-nginx-plus/

###

brotli requires ssl in web browsers

- https://stackoverflow.com/questions/43862412/why-is-brotli-not-supported-on-http
- https://letsencrypt.org/docs/certificates-for-localhost/
- https://www.howsmyssl.com/
- Browsing Experience Security Check https://www.cloudflare.com/ssl/encrypted-sni/

- http://www.benmccann.com/ssl-on-localhost-with-nginx/
- https://serverfault.com/questions/820601/nginx-ssl-on-localhost
- https://mozilla.github.io/server-side-tls/ssl-config-generator/
- https://www.gigaone.pl/wsparcie-techniczne/instalacja-certyfikatu-ssl/nginx
- https://www.digicert.com/csr-ssl-installation/nginx-openssl.htm
- https://nginx.org/en/docs/http/configuring_https_servers.html
- https://www.linode.com/docs/web-servers/nginx/enable-tls-on-nginx-for-https-connections/

## Internet Explorer and Developer Tools

>Internet Explorer's decompression logic happens at a level below the Developer Tools, so you may not see a Content-Encoding in the Developer Tools. You should consider using Fiddler to see what's actually on the wire. https://stackoverflow.com/questions/34006215/gzip-compression-not-working-in-internet-explorer-11-but-working-fine-in-chrome/38857977#38857977

## Test locally

Use nginx or http-server and make request with curl.

### nginx

localhost8080.conf:

```
server {
        # Enable static gzip
        gzip_static on;

        # Disable dynamic compression (optional, and not recommended if you're proxying)
        #gzip off;

        #sendfile on;

        listen 8080 default_server;
        listen [::]:8080 default_server;

        root /home/roman/projects/project1/frontend/build/App/Production;

        location / {
                try_files $uri /index.html =404;
        }
```

```bash
$ sudo ln -s $PWD/localhost8080.conf /etc/nginx/sites-enabled/
$ sudo systemctl start nginx
```

### http-server

	`npm i -g http-server; hs --gzip --proxy http://localhost:8080?`

- https://github.com/indexzero/http-server

### curl

```bash
$ curl -s -H "Accept-Encoding: gzip" http://localhost:8080/App.js | file -
/dev/stdin: gzip compressed data, from Unix

$ curl -s -H "Accept-Encoding: gzip" http://localhost:8080/App.js | file -
/dev/stdin: gzip compressed data, from Unix
```
