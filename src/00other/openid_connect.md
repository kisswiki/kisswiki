- http://openid.net/connect/
- http://openid.net/connect/faq/
- http://security.stackexchange.com/questions/37818/why-use-openid-connect-instead-of-plain-oauth
- http://security.stackexchange.com/questions/94995/oauth-2-vs-openid-connect-to-secure-api
- http://security.stackexchange.com/questions/44611/difference-between-oauth-openid-and-openid-connect-in-very-simple-term
- https://developers.google.com/identity/protocols/OpenIDConnect
- https://developers.google.com/identity/protocols/OpenID2Migration#shutdown-timetable
- https://en.wikipedia.org/wiki/OpenID#OpenID_vs._pseudo-authentication_using_OAuth
- https://github.com/mspnp/multitenant-saas-guidance/blob/master/docs/appendixes/about-oauth2-oidc.md
- OpenID Connect explained http://connect2id.com/learn/openid-connect
- http://stackoverflow.com/questions/27194838/facebook-login-and-openid-connect
- http://security.stackexchange.com/questions/94995/oauth-2-vs-openid-connect-to-secure-api
- https://www.quora.com/Why-are-Facebook-Twitter-and-Google-using-OAuth-for-their-external-authentication-services-instead-of-OpenID-or-SAML-What-are-the-differences
- http://stackoverflow.com/questions/1827997/is-facebook-an-openid-provider
- https://developers.facebook.com/docs/facebook-login/web

## Other

- https://en.wikipedia.org/wiki/List_of_single_sign-on_implementations
- SiteMinder Installation and How To Integrate in CA SSO Cookbook https://www.ca.com/us/services-support/ca-support/ca-support-online/knowledge-base-articles.tec479627.html

## the openid connect handbook

openid connect helps applications of all types 
- handle end-user authentication
- verify the identities of these users

topics:
- authentication
- authorization
- entity
- identity

- entity - thing that exists as an individual unit
- identity - set of attributes that you can use to distinguish this entity within in a context

Observer A perceives entity through Identity 1 which belongs to entity

- authentication - who you are
- authorization - what you can do

- Entity uses Identity 1 to authenticate with Observer
- Entity can use Identity 1 to gain Authorization

Physical ticket (with no identity attached) can be used for getting into a show (authorization) but not for authentication.

OIDC used to:
- authentication
- identity management

Applications just want to authenticate end-users and get a few bits about their identities.

>The issue with XML is that its flexibility becomes a problem when you need to digitally sign identities, where two elements listed in a different order can break a signature verification.

OAuth created for delegated authorization - a random application post something on Facebook as if it was you. Later Oauth used also for end-user authentication.

Why protocol? For identity management in secure and interoperable way.

Why not passwords locally? To reuse account and for deletgated authorization.