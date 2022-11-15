- ACME https://en.m.wikipedia.org/wiki/Automatic_Certificate_Management_Environment
- standalone stops server, webroot does not, nginx plugin reloads server `systemd reload nginx`, so it is a graceful shutdown.
- with nginx plugin, for every domain there will be nginx reload.
- https://docs.rockylinux.org/guides/security/generating_ssl_keys_lets_encrypt/#using-certbot-with-nginx

## Challenge

- - https://github.com/certbot/certbot/blob/21ef8e4332b41a7dd87ac83e548620cefe794d68/certbot/docs/challenges.rst#L21

## limits

Renewals are treated specially: they don’t count against your Certificates per Registered Domain limit, but they are subject to a Duplicate Certificate limit of 5 per week https://www.cryptologie.net/article/274/lets-encrypt-overview/
