- ACME https://en.m.wikipedia.org/wiki/Automatic_Certificate_Management_Environment
- standalone stops server, webroot does not, nginx plugin reloads server `systemd reload nginx`, so it is a graceful shutdown.
- with nginx plugin, for every domain there will be nginx reload.
- https://docs.rockylinux.org/guides/security/generating_ssl_keys_lets_encrypt/#using-certbot-with-nginx
- https://certbot.eff.org/faq
- https://github.com/alexpeattie/letsencrypt-fromscratch
- https://www.rfc-editor.org/rfc/rfc8555
- https://letsencrypt.org/docs/client-options/
- CA Authority https://github.com/letsencrypt/boulder

## Challenge

The HTTP auth works like this:

- Certbot places a file in a directory
- Then a remote server tries to fetch that from .well-known/acme-challenge/<filename>
- If it is successful, you proved ownership of the domain and get the certificate

- https://advancedweb.hu/getting-started-with-lets-encrypt/
- https://github.com/certbot/certbot/blob/21ef8e4332b41a7dd87ac83e548620cefe794d68/certbot/docs/challenges.rst#L21
- https://letsencrypt.org/docs/challenge-types/

## limits

Renewals are treated specially: they don’t count against your Certificates per Registered Domain limit, but they are subject to a Duplicate Certificate limit of 5 per week

- https://www.cryptologie.net/article/274/lets-encrypt-overview/
  - https://certbot.eff.org/faq#will-certbot-issue-extended-validation-ev-certificates
