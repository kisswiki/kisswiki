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

`sudo ln -s /home/roman/personal_projects/nginx/server.conf /etc/nginx/sites-enabled/`

And start server:

`sudo systemctl start nginx`

- https://stackoverflow.com/questions/42329261/running-nginx-as-non-root-user/51516739#51516739
- https://www.nginx.com/resources/wiki/start/topics/tutorials/gettingstarted/

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

## Another forward proxy with gzip

https://serverfault.com/questions/730883/nginx-reverse-proxy-gzip-to-client

## static content

- https://docs.nginx.com/nginx/admin-guide/web-server/serving-static-content/

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
`gzip_static on` and keep original files if using `try_files`.


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
		gunzip on;

		# Disable dynamic compression (optional, and not recommended if you're proxying)
		#gzip off;

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


>try_files is not aware of gzip_static; but nginx will still
>honour it if both the non-gz and .gz files exist. This differs from
>the "normal" gzip_static handling which will serve the .gz version if
>appropriate, whether or not non-gz exists.
>- http://mailman.nginx.org/pipermail/nginx/2012-June/034102.html

- http://mailman.nginx.org/pipermail/nginx/2017-July/054394.html
  - http://mailman.nginx.org/pipermail/nginx/2017-July/054355.html
- https://serverfault.com/questions/571733/nginx-gzip-static-why-are-the-non-compressed-files-required/965094#965094
- https://stackoverflow.com/questions/11066258/nginx-with-try-files-and-gzip-static-serves-only-uncompressed/48504621#48504621

>It seems that try_files requires the original file to work there and is not affected by gzip_static always.
>That's because try_files $uri =404 requires the <root>$uri file to exist.
>- https://trac.nginx.org/nginx/ticket/1570

`nginx -V 2>&1 | grep "\-\-with\-http_gunzip_module"`

- http://nginx.org/en/docs/http/ngx_http_gunzip_module.html

## default_server

>default server is the first one — which is nginx’s standard default behaviour. It can also be set explicitly which server should be default, with the default_server parameter in the listen directive

- http://nginx.org/en/docs/http/request_processing.html
- https://serverfault.com/questions/524813/nginx-default-server
