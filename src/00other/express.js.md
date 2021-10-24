## Routing

Static + catch all

```javascript
var express = require("express");

var app = express();
app.use("/public", express.static(__dirname + "/public"));

app.get("/*", function (req, res) {
  res.sendFile(__dirname + "/index.html");
});

var port = 8000;
app.listen(port, function () {
  console.log("Example app listening on port " + port);
});
```

http://stackoverflow.com/questions/26349497/node-express-with-static-html-how-to-route-all-requests-to-index-html/26638143#26638143

```javascript
const express = require("express");
const app = express();
const port = 3000;

app.get("/", (req, res) => res.send("Hello World!"));

app.listen(port, () =>
  console.log(`Example app listening at http://localhost:${port}`)
);
```

- https://expressjs.com/en/starter/hello-world.html
- https://gist.github.com/giacomorebonato/49919551d02fc82f6ef0e2ca0095aa6f

## No default engine was specified and no extension was provided

The res.render stuff will throw an error, if you're not using a view engine.

If you just want to serve json replace the `res.render('error', { error: err });` lines in your code with:

`res.json({ error: err })`

Comment out the res.render lines in your code and add in next(err); instead. If you're not using a view engine, the res.render stuff will throw an error.

https://stackoverflow.com/questions/23595282/error-no-default-engine-was-specified-and-no-extension-was-provided

## 400 response with json

```javascript
res.status(400).json(json_response);
```

https://stackoverflow.com/questions/26066785/proper-way-to-set-response-status-and-json-content-in-a-rest-api-made-with-nodej/37622663#37622663

## forbidden error

> I believe it's because of the relative path; the "../" is considered malicious. Resolve the local path first, then call res.sendfile. You can resolve the path with path.resolve beforehand.

```javascript
var path = require("path");
res.sendFile(path.resolve("temp/index.html"));
```

https://stackoverflow.com/questions/14594121/express-res-sendfile-throwing-forbidden-error/14594282#14594282

## url

```javascript
app.use("/admin", function (req, res, next) {
  // GET 'http://www.example.com/admin/new?a=b'
  console.dir(req.originalUrl); // '/admin/new?a=b' (WARNING: beware query string)
  console.dir(req.baseUrl); // '/admin'
  console.dir(req.path); // '/new'
  console.dir(req.baseUrl + req.path); // '/admin/new' (full path without query string)
  next();
});
```

- https://stackoverflow.com/questions/12525928/how-to-get-request-path-with-express-req-object/56380963#56380963
- `url.parse()` https://nodejs.org/docs/latest/api/url.html
  - https://stackoverflow.com/questions/17184791/node-js-url-parse-and-pathname-property
- curl formData: `curl -d "brand=nike" -d "color=red" -d "size=11" $URL` https://gist.github.com/joyrexus/524c7e811e4abf9afe56

## chain middlewares

```javascript
app.get(
  "/",
  [middleware.requireAuthentication, middleware.logger],
  function (req, res) {
    res.send("Hello!");
  }
);
```

https://stackoverflow.com/questions/31928417/chaining-multiple-pieces-of-middleware-for-specific-route-in-expressjs

## addQuery middleware

```javascript
const addQuery = (req, res, next) => {
  req.query.id      = 'someID';
  req.query.product = 'bag';
  next();
};

app.get('/', addQuery, express.query(), (req, res) => {
  ...
});
```

## SAML && RelayState

```javascript
req.query.RelayState = req.params.redirect_to;
passport.authenticate("saml")(req, res, next);
```

or with middleware

```javascript
function ensureAuth(req, res, next) {
  if (!SECURITYENABLED) {
    return next();
  }
  if (req.session.passport && req.session.passport.user) {
    req.user = req.session.passport.user;
    return next();
  } else {
    res.redirect(
      "/login" + `?RelayState=${encodeURIComponent(req.originalUrl)}`
    );
  }
}

app.get(
  "/login",
  [
    (req, res, next) => {
      if (RelayState in req.query) req.query.RelayState = req.query.RelayState;
      next();
    },
    passport.authenticate("saml", {
      failureRedirect: "/error",
      failureFlash: true,
    }),
  ],
  function (req, res) {
    res.redirect("/");
  }
);

app.use("/*", ensureAuth, function (req, res) {
  res.sendFile(
    path.resolve(path.join(__dirname, "./../client/build/index.html"))
  );
});
```

- https://stackoverflow.com/questions/24601188/how-do-i-redirect-back-to-the-originally-requested-url-after-authentication-with/46555155#46555155

## Parse FormData

Express 4.16+ has implemented their own version of body-parser so you do not need to add the dependency to your project. You can run it natively in express

```
app.use(express.json()); //Used to parse JSON bodies
app.use(express.urlencoded()); //Parse URL-encoded bodies
```

- https://stackoverflow.com/questions/30126189/non-deprecated-alternative-to-body-parser-in-express-js/66589639#66589639
- https://medium.com/@mmajdanski/express-body-parser-and-why-may-not-need-it-335803cd048c
- https://stackoverflow.com/questions/56758241/node-js-express-how-to-get-data-from-body-form-data-in-post-request/56767117#56767117

### Old: body-parser is deprecated

```javascript
var bodyParser = require("body-parser");
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
```

- https://stackoverflow.com/questions/42128238/how-can-i-read-the-data-received-in-application-x-www-form-urlencoded-format-on/42129247#42129247
- https://stackoverflow.com/questions/56758241/node-js-express-how-to-get-data-from-body-form-data-in-post-request/56758268#56758268
- https://stackoverflow.com/questions/24800511/express-js-form-data

## redirect and pass context

```javascript
app.get("/category", function (req, res) {
  var string = encodeURIComponent("something that would break");
  res.redirect("/?valid=" + string);
});
```

https://stackoverflow.com/questions/19035373/how-do-i-redirect-in-expressjs-while-passing-some-context/19038048#19038048

## check if query string has values

```javascript
Object.keys(req.query).length === 0;
```

https://stackoverflow.com/questions/26292267/how-do-i-check-if-query-string-has-values-in-express-js-node-js

## console.log Response

This worked for me:

https://stackoverflow.com/questions/11616630/how-can-i-print-a-circular-structure-in-a-json-like-format/21875464#21875464

I have just copied `decycle` function from https://github.com/douglascrockford/JSON-js/blob/master/cycle.js and then:

```
import { writeFileSync } from 'fs';
// ...
writeFileSync('res.json', JSON.stringify(decycle(res, undefined)));
```

I have used `writeFileSync` instead of `console.log` because output was too big.

instead of `import` you can use `const fs = require('fs');`;

- https://github.com/expressjs/express/issues/4311#issuecomment-950149333
- https://stackoverflow.com/questions/43622337/using-import-fs-from-fs
- https://nodejs.org/en/knowledge/file-system/how-to-write-files-in-nodejs/
- https://stackoverflow.com/questions/2496710/writing-files-in-node-js

## body parser

Express 4.16+ has implemented their own version of body-parser so you do not need to add the dependency to your project.

```javascript
app.use(express.json()); // Used to parse JSON bodies
app.use(express.urlencoded()); // Parse URL-encoded bodies using query-string library
// or
app.use(express.urlencoded({ extended: true })); // Parse URL-encoded bodies using qs library
```

- https://medium.com/@mmajdanski/express-body-parser-and-why-may-not-need-it-335803cd048c
- https://stackoverflow.com/questions/29960764/what-does-extended-mean-in-express-4-0/45690436#45690436

## req.login and passport

https://stackoverflow.com/questions/54261263/what-does-req-login-do-in-passport/54274283
