Given a current request/response path, gives the Path apropriate for storing in a cookie. This is basically the "directory" of a "file" in the path, but is specified by Section 5.1.4 of the RFC https://tools.ietf.org/html/rfc6265#section-5.1.4.

https://github.com/salesforce/tough-cookie#defaultpathpath

If you set `path=/`,
Now the cookie is available for whole application/domain if you not specify the path then current cookie is save just for the current page you can't access it on another page(s) for more info read :http://www.quirksmode.org/js/cookies.html (Domain and path part)

https://stackoverflow.com/questions/7551113/how-do-i-set-path-while-saving-a-cookie-value-in-javascript
