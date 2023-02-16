## Display in Google Chrome

Minimum is

```
  res.setHeader('Content-disposition', 'inline; filename="' + filename + '"');
  res.setHeader('Content-type', 'application/pdf');
```

```shell
npm init -y
npm i express
```

index.js

```javascript
var express = require("express"),
  fs = require("fs"),
  app = express();

var fileName = "file.pdf";
var filePath = __dirname + "/public/" + fileName;

app.get("/pdf1", function (req, res) {
  res.sendFile(filePath);
});

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent#encoding_for_rfc3986
function encodeRFC3986URIComponent(str) {
  return encodeURIComponent(str).replace(
    /[!'()*]/g,
    (c) => `%${c.charCodeAt(0).toString(16).toUpperCase()}`
  );
}

app.get("/pdf2", function (req, res, next) {
  var stream = fs.createReadStream(filePath);

  var stat = fs.statSync(filePath);
  res.setHeader("Content-Length", stat.size);
  res.contentType("application/pdf");
  res.setHeader(
    "Content-Disposition",
    `inline; filename=${fileName}; filename*=UTF-8''${encodeRFC3986URIComponent(
      fileName
    )}`
  );

  stream.pipe(res);
});

app.listen(3000, function () {
  console.log("Listening on 3000");
});
```

`node index.js`

http://localhost:3000

1. Enable with `Google Chrome > Settings > Privacy and security > Site settings > PDF documents > Open PDFs in Chrome`

- https://stackoverflow.com/questions/11598274/display-pdf-in-browser-using-express-js/21788474#21788474

2. Encode utf-8 filenames

- RFC3986 is newer than RFC5987 https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent#encoding_for_rfc3986

3. use `filename*=UTF-8''` if non-ascii?

## Links

- https://stackoverflow.com/questions/31105846/how-to-send-a-pdf-file-from-node-express-app-to-the-browser
- https://stackoverflow.com/questions/11598274/display-pdf-in-browser-using-express-js/21788474#21788474
- https://stackoverflow.com/questions/6293893/how-do-i-force-files-to-open-in-the-browser-instead-of-downloading-pdf
- https://stackoverflow.com/questions/93551/how-to-encode-the-filename-parameter-of-content-disposition-header-in-http
- https://stackoverflow.com/questions/40840852/difference-between-res-setheader-and-res-header-in-node-js
- https://superuser.com/questions/199382/make-chrome-always-open-pdfs-itself
- podman shouldn't implement filename\* in form data [Add an option to turn off filename\* in form-data requests · Issue #8308 · postmanlabs/postman-app-support](https://github.com/postmanlabs/postman-app-support/issues/8308)
