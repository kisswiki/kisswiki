## Bearer token

in Polish: token na okaziciela

Most of the OAuth 2.0 deployments do rely upon bearer tokens. A bearer token is like ‘cash’. If I steal 10 bucks from you, I can use it at a Starbucks to buy a cup of coffee — no questions asked. I do not want to prove that I own the ten dollar note. Unlike cash, if I use my credit card, I need to prove the possession. I need to prove I own it. I need to sign to authorize the transaction and it’s validated against the signature on the card. The bearer tokens are like cash — once stolen, an attacker can use it as it is to impersonate the original owner. Credit cards are like proof of possession (pop) tokens.

OAuth 2.0 recommends using TLS (Transport Layer Security) for all the interactions between the client, authorization server and resource server. This makes the OAuth 2.0 model quite simple with no complex cryptography involved — but at the same time it carries all the risks associated with a bearer token. There is no second level of defense. Also not everyone is fully bought into the idea of using OAuth 2.0 bearer tokens — just trusting the underlying TLS communication. I’ve met several people — mostly from the financial domain who are reluctant to use OAuth 2.0, just because of the bearer tokens.

An attacker may attempt to eavesdrop authorization code/access token/refresh token in transit from the authorization server to the client, using any of the following means.

- Malware installed in the browser (public clients)
- Browser history (public clients / URI fragments)
- Intercept the TLS communication between the client and the authorization server or the resource server (exploiting the vulnerabilities in the TLS - layer like Heartbleed and Logjam)
- TLS is point to point (not end to end) — an attacker having access to a proxy server could simply log all the tokens. Also — in many production deployments, the TLS connection is terminated at the edge, and from there onward it’s ether a new TLS connection or a plain HTTP connection. In either case as soon as the tokens leave the channel, it’s no more secure.

OAuth 2.0 token binding proposal cryptographically binds security tokens to the TLS layer, preventing token export and replay attacks.

Look at `end-to-end_vs_point-to-point_encryption.md`

- https://medium.facilelogin.com/oauth-2-0-token-binding-e84cbb2e60
- https://tools.ietf.org/html/rfc6750
- https://security.stackexchange.com/questions/108662/why-is-bearer-required-before-the-token-in-authorization-header-in-a-http-re

## Twitter oauth

Go to https://developer.twitter.com/ and create app.

In https://developer.twitter.com/en/portal/apps/<id_of_your_app>/settings set:

- Enable 3-legged OAuth
- Request email address from users
- CALLBACK URLS http://localhost:8080/api/auth/twitter-callback
- Website URL (required) https://example.com/
- Terms of service (required) https://example.com/terms
- Privacy policy (required) https://example.com/privacy-policy

We need API Key and Secret from https://developer.twitter.com/en/portal/apps/<id_of_your_app>/keys and put it in config.json

```json
    "auth": {
        "twitter": {
            "consumerKey": "is286xTKxx8zT8H7YFTkVWJ4P",
            "consumerSecret": "XuVGUZFw4QNh86P605w3BRBCxpSPW3RPp1rdNUkP3d2DoKMpG3"
        }
    }
```

- https://developer.twitter.com/en/portal/apps/21768338/keys
- https://github.com/ciaranj/node-oauth
- https://developer.twitter.com/en/docs/authentication/oauth-1-0a
- https://stackoverflow.com/questions/14372311/twitter-app-not-taking-localhost-and-127-0-0-1-as-callbackurl/16153521#16153521

- Consumer key is the API key that a service provider (Twitter, Facebook, etc.) issues to a consumer (a service that wants to access a user's resources on the service provider). This key is what identifies the consumer.
- Consumer secret is the consumer "password" that is used, along with the consumer key, to request access (i.e. authorization) to a user's resources from a service provider.
- Access token is what is issued to the consumer by the service provider once the consumer completes authorization. This token defines the access privileges of the consumer over a particular user's resources. Each time the consumer wants to access the user's data from that service provider, the consumer includes the access token in the API request to the service provider.

https://stackoverflow.com/questions/28057430/what-is-the-access-token-vs-access-token-secret-and-consumer-key-vs-consumer-s/28057700#28057700
