- https://developer.mozilla.org/en-US/docs/Learn/HTML/Forms/Sending_forms_through_JavaScript
- https://developer.mozilla.org/en-US/docs/Web/API/FileReader
- http://stackoverflow.com/questions/37582810/file-upload-using-multipart-fails-in-nodejs
- https://github.com/simonh1000/file-reader/blob/master/examples/server/index.js
- The basic idea is to use the FormData http://stackoverflow.com/questions/35192841/fetch-post-with-multipart-form-data

## RFC

multipart/form-data contains a series of parts. Each part is expected
to contain a content-disposition header where the value is "form-
data" and a name attribute specifies the field name within the form,
e.g., 'content-disposition: form-data; name="xxxxx"', where xxxxx is
the field name corresponding to that field. Field names originally in
non-ASCII character sets may be encoded using the method outlined in
RFC 1522.

As with all multipart MIME types, each part has an optional Content-
Type which defaults to text/plain.  If the contents of a file are
returned via filling out a form, then the file input is identified as
application/octet-stream or the appropriate media type, if known.  If
multiple files are to be returned as the result of a single form
entry, they can be returned as multipart/mixed embedded within the
multipart/form-data.

Each part may be encoded and the "content-transfer-encoding" header
supplied if the value of that part does not conform to the default
encoding.

File inputs may also identify the file name. The file name may be
described using the 'filename' parameter of the "content-disposition"
header. This is not required, but is strongly recommended in any case
where the original filename is known. This is useful or necessary in
many applications.

- Form-based File Upload in HTML https://www.ietf.org/rfc/rfc1867.txt
- Returning Values from Forms:  multipart/form-data https://tools.ietf.org/html/rfc2388

## Multiple

Unless the multiple attribute is set, there must be no more than one file in the list of selected files.

- http://w3c.github.io/html/sec-forms.html#the-multiple-attribute
- https://en.wikipedia.org/wiki/File_select

## Accept

RFC 1867 also introduced the accept attribute for the input element. This would enable file-type filtering based on MIME type for the file-select control.

```html
<input id="myfile" name="myfile" type="file" accept="image/gif,image/png">
<input id="myfile" name="myfile" type="file" accept="image/*">
```
https://en.wikipedia.org/wiki/File_select

## Why multipart/form-data?

TML forms provide three methods of encoding.

- `application/x-www-form-urlencoded` (the default)
- `multipart/form-data`
- `text/plain`

use multipart/form-data when your form includes any <input type="file"> elements.

`application/x-www-form-urlencoded` is more or less the same as a query string on the end of the URL.

`multipart/form-data` is significantly more complicated but it allows entire files to be included in the data.

http://stackoverflow.com/questions/4526273/what-does-enctype-multipart-form-data-mean

## Inspect

http://stackoverflow.com/questions/4238809/example-of-multipart-form-data

Run:

`ncat -lk localhost 8000`

Open the HTML on your browser, select the files and click on submit and check the terminal.

nc prints the request received. Google Chrome sent:

```
POST /upload HTTP/1.1
Host: localhost:5000
Connection: keep-alive
Content-Length: 1326
Pragma: no-cache
Cache-Control: no-cache
Origin: http://localhost:8000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36
Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryCmbq7JgzGhT8lvkf
Accept: */*
Referer: http://localhost:8000/dataSets/new
Accept-Encoding: gzip, deflate, br
Accept-Language: en-US,en;q=0.8

------WebKitFormBoundaryCmbq7JgzGhT8lvkf
Content-Disposition: form-data; name="part1"

42
------WebKitFormBoundaryCmbq7JgzGhT8lvkf
Content-Disposition: form-data; name="simtest"; filename="spec.md"
Content-Type: application/octet-stream

Here is file content

------WebKitFormBoundaryCmbq7JgzGhT8lvkf--
```

## Boundary

If you want to send the following data to the web server:

```
name = John
age = 12
```

using `application/x-www-form-urlencoded` would be like this:

`name=John&age=12`

As you might see, the server knows that parameters are separated by `&`, and if `&` is required as a parameter value, it will be encoded.

Now, how does the server knows where a parameter value starts and ends when it receives an HTTP request using `multipart/form-data`? Using the boundary, similar to `&`.

For example:

```
--XXX
Content-Disposition: form-data; name="name"

John
--XXX
Content-Disposition: form-data; name="age"

12
--XXX--
```

In that case, the boundary value is XXX. You specify it in the Content-Type header so that the server knows how to split the data sent.

http://stackoverflow.com/questions/3508338/what-is-the-boundary-in-multipart-form-data

## Server

Based on https://github.com/simonh1000/file-reader/blob/master/examples/server/index.js

package.json

```json
{
  "dependencies": {
    "express": "^4.14.0",
    "multer": "^1.2.0"
  },
  "devDependencies": {
    "cors": "^2.8.1"
  }
}
```


```javascript
var express = require('express')
var multer = require('multer')
//var upload = multer({ dest: 'uploads/' })
var upload = multer();
var cors = require('cors');
var fs = require('fs');

var app = express();
app.use(cors());

app.get('/', function (req, res) {
//   res.send('Hello World!')
  res.sendFile(__dirname+'/index.html');
})

app.get('/test', function (req, res) {
  res.sendFile(__dirname+'/test.html');
})

app.post('/upload', upload.single('simtest'), function (req, res, next) {
  console.log(req.file);
  console.log(req.body);
  fs.writeFile("uploads/" + req.file.originalname, req.file.buffer, function (err) {
    console.log("Writing file " + req.file.originalname);
  });
  res.send({"message": "received"});
})

app.listen(5000, function () {
  console.log('Example app listening on port 5000!')
});
```
