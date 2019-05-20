- https://github.com/webpack-contrib/compression-webpack-plugin
- https://github.com/pierreinglebert/node-zopfli
- https://github.com/mynameiswhm/brotli-webpack-plugin
- https://github.com/topics/brotli?l=javascript
- Files are compressed in parallel https://github.com/silverwind/precompress
- [MayhemYDG/iltorb: Node.js module for brotli compression/decompression with native bindings](https://github.com/MayhemYDG/iltorb)
- https://github.com/jshttp/compressible
- https://webmasters.stackexchange.com/questions/22217/which-browsers-handle-content-encoding-gzip-and-which-of-them-has-any-special
- https://stackoverflow.com/questions/11653488/serving-gzipped-content-directly-bad-thing-to-do/11670562#11670562

## nginx and brotli

- https://siipo.la/blog/poor-mans-brotli-serving-brotli-files-without-nginx-brotli-module
- ppa with brotli but without tls 1.3 https://github.com/cryptofuture/nginx-hda-bundle/issues/22#issuecomment-487590505
- compile nginx with brotli https://www.tinywp.in/nginx-brotli/
- https://medium.com/@wintermeyer/nginx-with-brotli-on-debian-stretch-2917b1147aec
- https://www.howtoforge.com/tutorial/how-to-install-nginx-with-brotli-compression-on-ubuntu-1804/
- brotli module for commercial nginx plus https://docs.nginx.com/nginx/admin-guide/dynamic-modules/brotli/
  - https://www.nginx.com/blog/whats-difference-nginx-foss-nginx-plus/


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

	`http-server --gzip --proxy http://localhost:8080?`

- https://github.com/indexzero/http-server

### curl

```bash
$ curl -s -H "Accept-Encoding: gzip" http://localhost:8080/App.js | file -
/dev/stdin: gzip compressed data, from Unix

$ curl -s -H "Accept-Encoding: gzip" http://localhost:8080/App.js | file -
/dev/stdin: gzip compressed data, from Unix
```
