- certbot advices to use it from snap or docker, but the one in rocky linux repo works ok.
  - https://eff-certbot.readthedocs.io/en/stable/install.html
  - https://repology.org/project/certbot/information
- https://letsencrypt.org/docs/allow-port-80/
- https://wiki.archlinux.org/title/certbot
- https://serverfault.com/questions/768509/lets-encrypt-with-an-nginx-reverse-proxy
- https://serverfault.com/questions/938419/nginx-as-reverse-proxy-with-several-domains-hosts

## nginx

- https://eff-certbot.readthedocs.io/en/stable/using.html#nginx
- https://certbot.eff.org/instructions?ws=nginx&os=fedora
- https://github.com/certbot/certbot/blob/21ef8e4332b41a7dd87ac83e548620cefe794d68/certbot/docs/using.rst#nginx

certbot's nginx plugin, when it needs to do a ACME challenge via http, will modify nginx's configuration. The config parser they wrote is capable of reverting the challenge configuration, as it is cleaned up you won't see it persist.

- https://serverfault.com/questions/1102493/operation-of-certbot-and-nginx/1102508#1102508
- https://github.com/certbot/certbot/blob/21ef8e4332b41a7dd87ac83e548620cefe794d68/certbot/certbot/reverter.py#L72

## renewal-hook superseded by deploy-hook

renewal-hook superseded by deploy-hook

`systemd try-reload-or-restart nginx` - it restarts if no reload is available for the service and does not even do that if the service is disabled. https://blog.arnonerba.com/2019/01/lets-encrypt-how-to-automatically-restart-nginx-with-certbot#comment-769

## post hook vs deploy hook

it’s not a restart, it’s a graceful reload. Traffic isn’t interrupted.

To do it only once, you should use --post-hook rather than --deploy-hook.

Even if you had 150 certificates all with --post-hook "systemctl reload apache2", it would only do it once, at the very end. It’s de-duplicating that way.

You can also drop an executable script in /etc/letsencrypt/renewal-hooks/post with the same effect.

https://community.letsencrypt.org/t/is-renew-hook-run-after-each-certificate-renewal-if-more-than-one-renewal/134104/2

## sub.sub.domain

https://community.letsencrypt.org/t/nginx-multiple-domains-multiple-certificates-wildcard-certificate/125672/2

## rewnew and running 2 times a day

The renew command is smart enough not to create useless load on the Let's Encrypt servers, so running it more frequently only impacts the machine running the command https://wiki.archlinux.org/title/Talk:Certbot

## caddy

CertMagic, a Go library I wrote (stating for disclosure purposes), supports coordinated certificate management across a cluster: https://github.com/mholt/certmagic/#behind-a-load-balancer-or-in-a-cluster 86

Caddy, a web server I wrote (stating for disclosure purposes), uses CertMagic, so you can set up a fleet of Caddy instances behind a load balancer and they will automatically coordinate cert management as long as they’re configured with the same storage backend (e.g. same folder, or same database, or whatever): https://caddyserver.com/docs/automatic-https#storage

https://community.letsencrypt.org/t/multiple-servers-what-are-all-the-options-and-requirements-to-get-it-working/112931/19

## mutliple domains

This is commonly solved by using a central validation server (e.g. acme-validate.example.com) and having all your web server instances redirect requests for /.well-known/acme-challenge/\* to this server (with a regular HTTP 301). The validation server could be running the client in standalone mode, and Let’s Encrypt will happily follow the redirect to that server.

Another option is to use a DNS-based challenge with one of the alternative clients. Lego 88, for example, comes with a plugin (or provider, as they call it) for Route 53.

https://community.letsencrypt.org/t/dual-nginx-dual-application-servers/16449/2

copy certs to remote hosts

`scp /path/to/privkey.pem root@host:/path/to/privkey.pem`

reload nginx on remote hosts

`ssh root@host service nginx reload`

An ssh key in authorized_keys can also restrict which commands a user authenticated through that key is allowed to run

https://community.letsencrypt.org/t/will-lets-encrypt-work-for-me-multiple-servers-serving-one-domain/6830/20

## webroot and restart

> you’d prefer not to stop the webserver during the certificate issuance process, you can use the webroot plugin to obtain a cert by including certonly and --webroot on the command line

Does it mean the apache plugin will restart webserver?

That’s indeed slightly confusing given its position right after the apache plugin description. It’s actually a reference to the standalone plugin, which works by binding to port 80 or 443 - meaning you would have to stop any existing web server listening on that port during renewal. Webroot would use your existing web server to serve the challenge files, so no restart needed.

The apache plugin itself doesn’t stop apache, but it reloads the configuration multiple times. Apache does this gracefully, basically starting a new process that handles new connections, while the old process is kept around until all existing connections are drained. This doesn’t involve any downtime. If the new configuration is somehow broken, certbot performs a rollback.

https://community.letsencrypt.org/t/is-server-restart-needed-when-obtaining-certs-using-certbot-and-apache-module/17267/2

## force-renewal

`certbot renew --force-renewal`

limit of 5 per week

## certbot starts nginx that cannot be killed

you aren't allowed to use two wildcards in a wildcard certificate. I.e., _._.example.com isn't allowed.

This aren't Let's Encrypt rules, but the rules every CA has to adhere to, the CA/Browser Forum Baseline Requirements.

- https://eff-certbot.readthedocs.io/en/stable/using.html#renewing-certificates

`systemctl status nginx.service` showed failed.

After getting nginx pid with `ss -tulnap` and killing with `kill -9 <pid>`, nginx process was restarted.

`nginx -s stop` didn't work - "[certbot] does not write pid file in --dry-run".

Eventually I have restarted machine.

`certbot renew --dry-run` should reproduce error

- [Certbot starts nginx after renew and bypasses systemd · Issue #5486 · certbot/certbot](https://github.com/certbot/certbot/issues/5486)
- [Nginx Certbot installer spawns rogue process, causing cert renewals to fail · Issue #160 · datamade/how-to](https://github.com/datamade/how-to/issues/160)
  - workaround cron job without nginx plugin using certonly certbot method https://github.com/certbot/certbot/issues/5486#issuecomment-362884553
  - Running the renew command with --installer none works as well as a workaround
    - `sudo certbot renew --installer none --pre-hook "service nginx stop" --post-hook "service nginx start`
    - https://github.com/certbot/certbot/issues/5486#issuecomment-363338838
  - ATTENTION! possible explanation https://github.com/certbot/certbot/issues/5486#issuecomment-363970559
    - The main problem here occurs if Certbot's Nginx plugin has to start Nginx and you later try to stop/start Nginx with systemctl. Nginx is stopped using the value ExecStop which isn't run if the service wasn't started with ExecStart as described here.
  - I eventually used getssl to get a new certificate https://github.com/certbot/certbot/issues/5486#issuecomment-375300746
    - https://github.com/srvrco/getssl
  - We switched to a combination of certbot timer for renewal, renewal-hook deploy to reload nginx and --webroot for not having to start and stop nginx instances https://github.com/certbot/certbot/issues/5486#issuecomment-408064621
  - if the webroot plugin is working well for you, that's great and you should keep using it! We certainly recommend Nginx users use our Nginx plugin though. On top of automating certificate installation and Nginx reloads for you, we're able to configure your server to use sane ciphersuites, HTTP->HTTPS redirects, OCSP stapling, HSTS, etc. If you have time to share any suggestions for how we can make the Nginx plugin work better for you and others, please open an issue! https://github.com/certbot/certbot/issues/5486#issuecomment-417002271
  - In my case starting nginx directly causes additional issues or does not work at all. I have had all the services go down due to renewal not being able to properly start up nginx again. There is a posthook that tries to start nginx through systemctl, however by that time there is a rogue process already started and fails due to that. Its not clear to me how the 'rogue process' is started, but for example it does not write pid file in --dry-run, so that nginx -s stop has no effect either and it is apparently either crashing soon after or failing to server files. https://github.com/certbot/certbot/issues/5486#issuecomment-426606285
  - While we should try and find a way to fix this, the best way to work around the problem is to not use Certbot's standalone plugin and use the webroot or nginx plugin instead if possible. With these approaches, no hooks are needed to start/stop nginx. https://github.com/certbot/certbot/issues/5486#issuecomment-476307444
- https://stackoverflow.com/questions/74007149/nginx-failed-to-restart-process

A conflict with nginx can result using the nginx plug-in as after it makes the temp changes to your nginx conf it reloads it using SIGHUP. That's fine but if that fails it will start nginx but not using systemd. This creates an nginx that cannot be managed by systemd and the two nginx fight each other for ports leading to the symptom you saw.

Now, various things can cause the SIGHUP to fail. A common one is not having nginx running before doing the renew. Of course then the sighup will fail. You said nginx was running so likely not your cause.

I mention perl only because that explained the SEGV that the nginx sighup was failing with in the thread I linked to. We would have to dig through your system logs like we did in this linked thread. But, it would be a quick test if you had perl just to disable it.

A work-around is to use webroot as that avoids the nginx plug-in altogether. Webroot uses your running nginx as it is.

https://community.letsencrypt.org/t/auto-renewal-nginx-pid-disappears-nginx-doest-restart/179794/8
