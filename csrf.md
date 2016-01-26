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
