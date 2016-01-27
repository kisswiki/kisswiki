Cookies are always included on same-origin requests, regardless of how
that request was initiated. If you’re logged in to www.twitter.com, any time your
browser navigates to a www.twitter.com site, the cookies will be included in the request.
It doesn’t matter where the request originates: you can visit www.twitter.com directly
or click a link to go to www.twitter.com. Even if a page merely links to an image
hosted on www.twitter.com, the request for that image will include your cookies.
You have no control over this behavior. If your browser has cookies associated with
a site, they’re always included on the request.
 Suppose a hacker creates a page that adds a new tweet to Twitter. Whenever
someone visits this site, it sends a request to Twitter to create a tweet that says, “I
have hacked your site!” (see figure C.1). If the hacker can somehow trick you into
visiting his page, the tweet will be added to your own Twitter feed!
 This is at the heart of CSRF: an unauthorized site makes a request on your
behalf using your cookies.
CORS in Action, C.1 What is CSRF?

- http://stackoverflow.com/questions/20504846/why-is-it-common-to-put-csrf-prevention-tokens-in-cookies
- http://stackoverflow.com/questions/24680302/csrf-protection-with-cors-origin-header-vs-csrf-token
- http://stackoverflow.com/questions/19793695/does-a-proper-cors-setup-prevent-xsrf
- https://github.com/pillarjs/understanding-csrf
- If you use AngularJS 1.1.3 or newer you can use xsrfHeaderName and xsrfCookieName http://stackoverflow.com/questions/18156452/django-csrf-token-angularjs http://stackoverflow.com/questions/16663574/angular-django-and-csrf
- assign the headers to the request on every request made after I log in http://stackoverflow.com/questions/18877715/http-auth-headers-in-angularjs/24126951#24126951
- If you install a certificate on your server to enable HTTPS, then if you set the Secure flag on the cookie then it will only be sent when the protocol is HTTPS (never over HTTP). This adds extra security as your cookie value cannot be leaked by an attacker. http://stackoverflow.com/questions/21972133/best-practive-for-xsrf-csrf-secured-rest-calls
- OWASP recommended double submit cookies XSRF prevention method  
  The site does not have to save this value in any way.  
  https://www.owasp.org/index.php/Cross-Site_Request_Forgery_%28CSRF%29_Prevention_Cheat_Sheet#Double_Submit_Cookies
- it would not be possible to <iframe> your site, generate a POST request and re-use the existing authentication cookie because there will be none https://auth0.com/blog/2014/01/07/angularjs-authentication-with-cookies-vs-token/
