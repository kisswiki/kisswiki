- https://github.com/react-dropzone/react-dropzone
- https://github.com/rofrol/react-dropzone-progress-bar
- ref https://stackoverflow.com/questions/44746680/creating-a-list-with-react-dropzone
- https://medium.com/technoetics/handling-file-upload-in-reactjs-b9b95068f6b
- https://stackoverflow.com/questions/35925243/react-dropzone-getting-stuck-on-upload

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
