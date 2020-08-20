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

- https://auth0.com/resources/ebooks/the-openid-connect-handbook
  - https://github.com/auth0-blog/oidc-book-regular-webapp redirects to https://github.com/auth0-blog/oidc-webapp

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

OAuth was created for delegated authorization - a random application post something on Facebook as if it was you. Later Oauth used also for end-user authentication.

Why protocol? For identity management in secure and interoperable way.

Why not passwords locally? To reuse account and for deletgated authorization.

Steps:
1. Visitor requests the app to start the authorization process.
2. App redirects to Identiti Provider (IdP).
3. IdP redirects visitor back to the app with a few artifacts.
4. The app makes a request with these artifacts to IdP to complete the auth process.
5. The app shows a page to user containing some indication that he is loggen in.

OAuth 2.0 is an authorization framework that enables app (client) to use APIs (resource servers) on behalf of users (resources owners).

OAuth:
- for deletegated authorization
- not for end-user authentication

OIDC:
- authenticate end-users
- provide info about users (provisioning)

>In this step, you are redirected to the authorization server, you perform some action there, and then the application gets an artifact related to you. The biggest difference is that, in a pure OAuth 2.0 scenario, the result will be an artifact that grants delegated authorization instead of an artifact that contains personal attributes about you.

## Official documentation

- https://openid.net/specs/openid-connect-core-1_0.html
- https://openid.net/connect/faq/
  - https://www.youtube.com/watch?v=Kb56GzQ2pSk

## authentication and authorization etymology

- authorizie means give permission: https://en.wiktionary.org/wiki/authorize -> https://en.wiktionary.org/wiki/authority -> https://en.wiktionary.org/wiki/auctor -> https://en.wiktionary.org/wiki/augeo -> increase
- authenticate means ensuring that somehting is done by someone: https://en.wiktionary.org/wiki/authentic -> https://en.wiktionary.org/wiki/αὐθέντης -> self doer
  - https://www.etymonline.com/word/authentic

## Tutorials, workshops

- https://github.com/auth0-blog/oidc-webapp
- https://github.com/ramosbugs/openidconnect-rs