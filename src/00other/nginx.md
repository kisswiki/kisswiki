## quick start

```nginx.conf
events {
	worker_connections 768;
}

http {
	server {
		listen 8080 default_server;
		listen [::]:8080 default_server;

		root /home/user/projects/project1;

		location / {
			try_files $uri /index.html;
		}
	}
}
```

Run with `sudo nginx -t -c nginx.conf -p $PWD`.

Or restart `sudo killall -9 nginx; sudo nginx -c nginx.conf -p $PWD; ps aux | rg nginx`.

Check config with `sudo nginx -t -c nginx.conf -p $PWD`.

To use systemd use file with only `server` directive:

```server.conf
server {
	listen 8080 default_server;
	listen [::]:8080 default_server;

	root /home/user/projects/project1;

	location / {
		try_files $uri /index.html;
	}
}
```

Then create symbolic link

`sudo ln -s $PWD/server.conf /etc/nginx/sites-enabled/`

And start server:

`sudo systemctl start nginx`

- https://stackoverflow.com/questions/42329261/running-nginx-as-non-root-user/51516739#51516739
- https://www.nginx.com/resources/wiki/start/topics/tutorials/gettingstarted/
- https://www.nginx.com/resources/wiki/start/topics/tutorials/config_pitfalls/

## Performance

- https://serverfault.com/questions/704897/nginx-loading-page-very-slow

## Forward proxy

```
server {
    listen       80;
    server_name  localhost;
    location / {
        proxy_pass          http://localhost:3000;
        proxy_set_header    Host             $host;
        proxy_set_header    X-Real-IP        $remote_addr;
        proxy_set_header    X-Forwarded-For  $proxy_add_x_forwarded_for;
        proxy_set_header    X-Client-Verify  SUCCESS;
        proxy_set_header    X-Client-DN      $ssl_client_s_dn;
        proxy_set_header    X-SSL-Subject    $ssl_client_s_dn;
        proxy_set_header    X-SSL-Issuer     $ssl_client_i_dn;
        proxy_read_timeout 1800;
        proxy_connect_timeout 1800;
    }
}
```

- https://gist.github.com/micho/1712812
- https://gist.github.com/soheilhy/8b94347ff8336d971ad0
- https://serverfault.com/questions/536576/nginx-how-do-i-forward-a-http-request-to-another-port

## Proxy

- config to allow CORS (cross-site) uploads to Amazon S3, with added config e.g. timeouts & security https://gist.github.com/zefer/833647

## reverse proxy

- https://serverfault.com/questions/730883/nginx-reverse-proxy-gzip-to-client
- https://www.digitalocean.com/community/tutorials/how-to-configure-nginx-as-a-reverse-proxy-on-ubuntu-22-04
  - https://stackoverflow.com/questions/42589781/django-nginx-emerg-open-etc-nginx-proxy-params-failed-2-no-such-file/42591098#42591098

## static content

Next, we will configure a virtual host `static.example.com` for serving static data.
The following content goes into the file `/etc/nginx/site-enabled/static`.

`example.com.conf`:

```
server {
    listen 80;
    server_name static.example.com;

    access_log /var/log/nginx/static.example.com-access.log main;

    sendfile on;
    sendfile_max_chunk 1M;
    tcp_nopush on;
    gzip_static on;

    root /usr/local/www/static.example.com;
}
```

This file configures virtual host `static.example.com`. The virtual host root location is set as `/usr/local/www/static.example.com`. To enable more efficient retrieval of static files, we encourage Nginx to use the sendfile() system call (`sendfile on`) and set the maximum sendfile chunk to 1 MB. We also enable the `TCP_NOPUSH` option to improve TCP segment utilization when using sendfile() (`tcp_nopush on`). The `gzip_static on` directive instructs Nginx to check for gzipped copies of static files, such as main.js.gz for main.js and styles.css.gz for styles.css . If they are found, Nginx will indicate the presence of the .gzip content encoding, and use the content of the compressed files instead of the original one.

This configuration is suitable for virtual hosts that serve small-to-medium size static files.

From [Nginx Essentials](https://books.google.pl/books?id=ZO09CgAAQBAJ&pg=PA43&lpg=PA43&dq=nginx+gzip_static+sendfile&source=bl&ots=mhWuKsEC_I&sig=ACfU3U3EqhxF7lIaIGYxlrOndY484UHl9w&hl=pl&sa=X&ved=2ahUKEwipgZHBwfXhAhXk_CoKHborD2kQ6AEwBHoECBEQAQ#v=onepage&q=nginx%20gzip_static%20sendfile&f=false).

For starters, you can’t use sendfile and must use direct I/O (`O_DIRECT`). This causes the fi le to bypass Linux’s disk caches, so you don’t benefi t from having the fi le potentially cached in memory. Usually, you want this caching, but in a few situations, not caching is better. For example, if the fi le is large (say a video), you probably don’t want to fi ll your disk buffers with it. Similarly, if you have a large working set (too large to all fi t in memory) being accessed in a fairly distributed manner, the disk cache may not help much. In these two cases, the benefi ts of AIO can outweigh the drawbacks.

The Nginx documentation gives the following example of AIO usage:

```
   location /video {
   aio on;
   directio 512;
   output_buffers 1 128k;
}
```

You need to explicitly enable direct I/O and have the option of also setting a minimum size. Only
fi les larger than this size will be read using direct I/O. It makes a lot of sense to use only AIO on
directories containing large fi les — at least until the Linux implementation improves. For direct I/O,
it’s worth experimenting with using it globally with a high value to prevent large fi les from polluting
your disk caches. But remember that enabling direct I/O causes `sendfile` to be disabled.

`sendfile` isn’t always the ideal method for reading from disk. Because the operating system reads the data in fairly small chunks, there may be a lot of seeking back and forth on busy systems, as the operating system attempts to read multiple fi les at once. When sendfile is disabled (or isn’t being used because you’re serving dynamic content), you can control the size of the chunks of data that are read from disk using `output_buffers`, as shown here:

`output_buffers 2 512k;`

This causes Nginx to create two buffers in memory, each of 512 KB. When handling requests, it then attempts to read 512 KB of data from disk in one chunk, before processing it. The 512 KB should be big enough to hold even a large HTML document.

From [Professional Website Performance: Optimizing the Front-End and Back-End](https://books.google.pl/books?id=MHLJlUfXV4QC&pg=PA162&lpg=PA162&dq=nginx+gzip_static+sendfile&source=bl&ots=81Etk2LZHz&sig=ACfU3U3aJ4ltvPESzpnaGkJVJaBJlo6DQg&hl=pl&sa=X&ved=2ahUKEwipgZHBwfXhAhXk_CoKHborD2kQ6AEwB3oECBIQAQ#v=onepage&q=nginx%20gzip_static%20sendfile&f=false).

- https://docs.nginx.com/nginx/admin-guide/web-server/serving-static-content/
- https://codereview.stackexchange.com/questions/177513/nginx-serve-static-images-js-css-and-proxy-node-js-server

## disable caching of a single file

- https://stackoverflow.com/questions/41631399/nginx-disable-caching-of-a-single-file-with-try-files-directive/41632171

## try_files

If you only have 1 condition you want to serve, like for example inside folder images you only want to either serve the image or go to 404 error, you can write a line like this

```
location /images {
    try_files $uri =404;
}
```

- https://stackoverflow.com/questions/17798457/how-can-i-make-this-try-files-directive-work
- http://nginx.org/en/docs/http/ngx_http_core_module.html#try_files
- https://serverfault.com/questions/329592/how-does-try-files-work
- https://serverfault.com/questions/739170/what-does-try-files-do-in-this-nginx-configuration

## static compression gzip

tldr;
compress with `gzip -c -f file.js > file.js.gz`, configure nginx with `gzip_static on` and keep original files if using `try_files`.

Compress

`find /var/www/static -type f -regextype posix-extended -iregex '.*\.(css|csv|html?|js|svg|txt|xml)' -exec zopfli '{}' \;`

https://theartofmachinery.com/2016/06/06/nginx_gzip_static.html

Check if enabled [1](https://stackoverflow.com/questions/47206595/trying-to-install-gzip-static-module-for-nginx-on-ubuntu#comment81372969_47206595):

`nginx -V 2>&1 | grep "\-\-with\-http_gzip_static_module"`

```nginx.conf
events {
	worker_connections 768;
}

http {
	server {
		# Enable static gzip
		gzip_static on;

		# Disable dynamic compression (optional, and not recommended if you're proxying)
		#gzip off;

		# Also, if you’re serving HTTP (as opposed to HTTPS), make sure you have “sendfile on;” in your config. On Linux, this tells Nginx to use the sendfile system call when possible, which (among other things) can dump a file directly onto a network link without userspace interaction. This is a good performance trick, but doesn’t work if you’re doing processing like encryption or dynamic compression. If you’re using static compression over HTTP, take advantage of it. On non-Linux systems, the sendfile config enables similar optimisations where available.
		# https://theartofmachinery.com/2016/06/06/nginx_gzip_static.html
		#sendfile on;

		listen 8080 default_server;
		listen [::]:8080 default_server;

		root /home/user/projects/project1;

		location / {
			try_files $uri /index.html;
		}
	}
}
```

Run with `sudo nginx -t -c nginx.conf -p $PWD`.

Or restart `sudo killall -9 nginx; sudo nginx -c nginx.conf -p $PWD; ps aux | rg nginx`.

Check with curl. You should see `Content-Encoding: gzip`:

```bash
$ curl -H "Accept-Encoding: gzip" -I http://localhost:8080/App.js
HTTP/1.1 200 OK
Server: nginx/1.15.9 (Ubuntu)
Date: Mon, 29 Apr 2019 10:31:16 GMT
Content-Type: text/plain
Content-Length: 405110
Last-Modified: Mon, 29 Apr 2019 09:57:15 GMT
Connection: keep-alive
ETag: "5cc6ca7b-62e76"
Content-Encoding: gzip
```

or

```bash
$ curl -s -H "Accept-Encoding: gzip" http://localhost:8080/App.js | file -
/dev/stdin: gzip compressed data, was "App.js", last modified: Mon Apr 29 09:57:15 2019, from Unix
$ curl -s http://localhost:8080/App.js | file -
/dev/stdin: UTF-8 Unicode text, with very long lines
```

- https://theartofmachinery.com/2016/06/06/nginx_gzip_static.html
- https://medium.com/@selvaganesh93/how-to-serve-webpack-gzipped-file-in-production-using-nginx-692eadbb9f1c
- https://serverfault.com/questions/241347/how-do-i-serve-pre-gzipped-files-with-nginx-so-that-theyll-be-shown-as-text-in
- https://www.cyberciti.biz/faq/how-to-enable-the-gzipdeflate-in-nginx-server-on-linux-or-unix-system/
- http://nginx.org/en/docs/http/ngx_http_gzip_static_module.html

### try_files and ungzipped files need to be present

> try_files is not aware of gzip_static; but nginx will still
> honour it if both the non-gz and .gz files exist. This differs from
> the "normal" gzip_static handling which will serve the .gz version if
> appropriate, whether or not non-gz exists.
>
> - http://mailman.nginx.org/pipermail/nginx/2012-June/034102.html

- http://mailman.nginx.org/pipermail/nginx/2017-July/054394.html
  - http://mailman.nginx.org/pipermail/nginx/2017-July/054355.html
- https://serverfault.com/questions/571733/nginx-gzip-static-why-are-the-non-compressed-files-required/965094#965094
- https://stackoverflow.com/questions/11066258/nginx-with-try-files-and-gzip-static-serves-only-uncompressed/48504621#48504621

> It seems that try_files requires the original file to work there and is not affected by gzip_static always.
> That's because try_files $uri =404 requires the <root>$uri file to exist.
>
> - https://trac.nginx.org/nginx/ticket/1570

`nginx -V 2>&1 | grep "\-\-with\-http_gunzip_module"`

- http://nginx.org/en/docs/http/ngx_http_gunzip_module.html

## default_server

> default server is the first one — which is nginx’s standard default behaviour. It can also be set explicitly which server should be default, with the default_server parameter in the listen directive

- http://nginx.org/en/docs/http/request_processing.html
- https://serverfault.com/questions/524813/nginx-default-server

## sendfile

Nginx initial fame came from its awesomeness at sending static files. This has lots to do with the association of sendfile, tcp_nodelay and tcp_nopush in nginx.conf. The sendfile Nginx option enables to use of sendfile(2) for everything related to… sending file.

sendfile(2) allows to transfer data from a file descriptor to another directly in kernel space. sendfile(2) allows to save lots of resources:

- sendfile(2) is a syscall, which means execution is done inside the kernel space, hence no costly context switching.
- sendfile(2) replaces the combination of both read and write.
- here, sendfile(2) allows zero copy, which means writing directly the kernel buffer from the block device memory through DMA.

Unfortunately, sendfile(2) requires a file descriptor that supports mmap(2) and friends, which excludes UNIX sockets, for example as a way to send data to a local Rails backend without all the network latency.

> The in_fd argument must correspond to a file which supports mmap(2)-like operations (i.e., it cannot be a socket).

Depending on your needs, sendfile can be either totally useless or completely essential.

If you’re serving locally stored static files, sendfile is totally essential to speed your Web server. But if you use Nginx as a reverse proxy to serve pages from an application server, you can deactivate it. Unless you start serving micro caching on a tmpfs. I’ve been doing it here, and didn’t even notice the day I was featured on HN homepage, Reddit or good old Slashdot.

https://thoughts.t37.net/nginx-optimization-understanding-sendfile-tcp-nodelay-and-tcp-nopush-c55cdd276765

## http-server to browse files

http-server:

```server {
	listen 3333 default_server;
	listen [::]:3333 default_server;

	root /home/roman/http-server;

	location / {
		autoindex on;
	}

	location ~ \.pdf$ {
		# force download
	#	add_header Content-Disposition "attachment";
		#force preview
		add_header Content-Disposition "inline";
	}
}
```

Then create symbolic link

`sudo ln -s $PWD/http-server.conf /etc/nginx/sites-enabled/`

And start server:

`sudo systemctl start nginx`

Create symoblic link to directory you want to browse:

`sudo ln -s /some/path/ ~/http-server`

- https://stackoverflow.com/questions/10663248/how-to-configure-nginx-to-enable-kinda-file-browser-mode
- https://superuser.com/questions/1277819/why-does-chrome-sometimes-download-a-pdf-instead-of-opening-it
- https://stackoverflow.com/questions/30779412/nginx-how-to-avoid-forced-downloads-in-all-wav-files
- https://stackoverflow.com/questions/44217573/why-request-without-suffix-of-filename-extension-html-will-download-file
- https://support.mozilla.org/en-US/kb/change-firefox-behavior-when-open-file~/personal_projects/nginx$

## Another proxy with actix-web

```
server {
  listen 80;
  server_name example.com;
  keepalive_timeout 65;

  proxy_connect_timeout       600;
  proxy_send_timeout          600;
  proxy_read_timeout          600;
  send_timeout                600;

  location / {
   proxy_set_header X-Forwarded-For $remote_addr;
   proxy_pass http://localhost:3000;
   add_header Keep-Alive "timeout=65, max=100";
  }
}
```

https://www.reddit.com/r/rust/comments/erqxf7/hosting_actixweb_with_nginx/
