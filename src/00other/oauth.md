## Bearer token

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

- Consumer key is the API key that a service provider (Twitter, Facebook, etc.) issues to a consumer (a service that wants to access a user's resources on the service provider). This key is what identifies the consumer.
- Consumer secret is the consumer "password" that is used, along with the consumer key, to request access (i.e. authorization) to a user's resources from a service provider.
- Access token is what is issued to the consumer by the service provider once the consumer completes authorization. This token defines the access privileges of the consumer over a particular user's resources. Each time the consumer wants to access the user's data from that service provider, the consumer includes the access token in the API request to the service provider.

https://stackoverflow.com/questions/28057430/what-is-the-access-token-vs-access-token-secret-and-consumer-key-vs-consumer-s/28057700#28057700
