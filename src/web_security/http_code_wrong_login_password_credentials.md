If you use HTTP authentication as defined by RFC 7235, 401 would be correct (for missing or incorrect credentials).

Otherwise, use 403.

- https://stackoverflow.com/questions/26093875/which-http-status-code-to-say-username-or-password-were-incorrect/26095376#26095376
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/403
