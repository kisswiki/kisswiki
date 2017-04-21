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
