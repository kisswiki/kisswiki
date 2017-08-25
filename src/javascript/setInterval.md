## quickstart

```javascript
let intervalID = setInterval(() => console.log('yej'));
clearInterval(intervalID);
let intervalID = setInterval(() => console.log('yej'), 500);
```

- https://stackoverflow.com/questions/34577012/creating-a-stopwatch-with-redux/34577182#34577182
- https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/setInterval

If you are going to use this in a bigger app then I would use requestAnimationFrame instead of an setInterval for performance issues. As you are showing milliseconds you would notice this on mobile devices not so much on desktop browsers.

https://stackoverflow.com/questions/34577012/creating-a-stopwatch-with-redux/34578438#34578438

## in loop

- http://stackoverflow.com/questions/7749090/how-to-use-setinterval-function-within-for-loop
