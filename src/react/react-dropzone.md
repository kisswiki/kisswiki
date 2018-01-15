- https://github.com/react-dropzone/react-dropzone
- https://github.com/rofrol/react-dropzone-progress-bar
- ref https://stackoverflow.com/questions/44746680/creating-a-list-with-react-dropzone
- https://medium.com/technoetics/handling-file-upload-in-reactjs-b9b95068f6b
- https://stackoverflow.com/questions/35925243/react-dropzone-getting-stuck-on-upload
- https://blog.codeinfuse.com/upload-multiple-files-to-cloudinary-using-react-dropzone-axios-27883c2a5ec6
- https://bilalbudhani.com/cloudinary-dropzone-react-axios/

## thumbnail

- https://stackoverflow.com/questions/38349421/react-dropzone-image-preview-not-showing
- https://www.webpackbin.com/bins/-KnUfv16oy_6F57SM7cx
- https://codepen.io/ianmcnally/pen/NAymBN?editors=0010

## remove file

- https://stackoverflow.com/questions/35925243/react-dropzone-getting-stuck-on-upload
- https://github.com/enyo/dropzone/wiki/Remove-all-files-with-one-button

## active class name

```javascript
  /**
   * className for active state
   */
  activeClassName: PropTypes.string,
```

https://github.com/react-dropzone/react-dropzone/blob/master/src/index.js

## prevent opening File Dialog when clicking in button inside dropzone

`e.stopPropagation()`

- https://stackoverflow.com/questions/38619981/react-prevent-event-bubbling-in-nested-components-on-click
- https://stackoverflow.com/questions/24415631/reactjs-syntheticevent-stoppropagation-only-works-with-react-events
- https://stackoverflow.com/questions/37568550/react-prevent-event-trigger-on-parent-from-child
- https://github.com/rob2d/react-prevent-clickthrough

## abort upload when using superagent

```javascript
req = superagent.post(url);
req.abort();
```

- http://visionmedia.github.io/superagent/#aborting-requests
- https://stackoverflow.com/questions/44119175/reactjs-interrupting-a-post-request-in-superagent

## server

```js
const express = require('express');
const multer = require('multer');

const upload = multer({
  dest: 'uploads/', // this saves your file into a directory called "uploads"
});

const app = express();

// It's very crucial that the file name matches the name attribute in your html
app.post('/', upload.single('files'), (req, res) => {
  res.redirect('/');
});

app.listen(3001);
```

- https://github.com/rofrol/react-dropzone-progress-bar
- http://shiya.io/simple-file-upload-with-express-js-and-multer-in-node-js/
- https://stackoverflow.com/questions/18310394/no-access-control-allow-origin-node-apache-port-issue
- https://stackoverflow.com/questions/45387650/react-dropzone-and-nodejs-file-upload
- https://stackoverflow.com/questions/31592726/how-to-store-a-file-with-file-extension-with-multer
- https://stackoverflow.com/questions/35511348/multer-not-adding-file-extension
- Files are uploading as 'file' without its extension https://github.com/expressjs/multer/issues/170#issuecomment-123362345
- https://stackoverflow.com/questions/38652848/filter-files-on-the-basis-of-extension-using-multer-in-express-js
- https://stackoverflow.com/questions/18130254/randombytes-vs-pseudorandombytes
- Crypto randomBytes and pseudoRandomBytes https://github.com/nodejs/node-v0.x-archive/issues/6372

## axios - cancel

- https://github.com/axios/axios#cancellation

## xhr progress

xhr.md
