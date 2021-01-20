- http://2ality.com/2014/10/es6-promises-api.html
- http://2ality.com/2014/09/es6-promises-foundations.html

## You don't return inside a promise

You chain another task after its completion

```javascript
function a() {
    return new Promise((resolve, reject) => {
    //return 2;
    resolve(1);
    }).then(val => { console.log(val); return val; });
}
a().then(val => console.log(val));
```

- https://stackoverflow.com/questions/22232280/how-do-you-return-inside-a-promise/22233034#22233034
- https://developer.cdn.mozilla.net/id/docs/Web/JavaScript/Reference/Global_Objects/Promise

## Top-level `await` is supported inside Dev Tools of Chrome and Firefox

```javascript
var b = await (new Promise((resolve) => resolve(1)).then(v => { console.log(v); return v; }))
```

- https://www.reddit.com/r/javascript/comments/6tuaxj/toplevel_await_is_supported_inside_latest_chrome/

## In practice, it is often desirable to catch rejected promises rather than use then's two case syntax

```javascript
Promise.resolve()
  .then(() => {
    // Makes .then() return a rejected promise
    throw new Error('Oh no!');
  })
  .catch(error => {
    console.error('onRejected function called: ' + error.message);
  })
  .then(() => {
    console.log("I am always called even if the prior then's promise rejects");
  });
```

instead of this:

```javascript
Promise.resolve()
  .then(() => {
    // Makes .then() return a rejected promise
    throw new Error('Oh no!');
  })
  .then(() => {
    console.log('Not called.');
  }, error => {
    console.error('onRejected function called: ' + error.message);
  });
```

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then
