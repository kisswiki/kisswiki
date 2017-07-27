```javascript
var script = document.createElement('script');
script.type = 'text/javascript';
script.src = 'https://unpkg.com/react-trigger-change/dist/react-trigger-change.js';
document.head.appendChild(script);
node.value = value;
reactTriggerChange(node);
```

or

```javascript
  /* https://stackoverflow.com/questions/5282228/include-javascript-file-in-chrome-console */
  function loadScript(src) {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = src;
    document.head.appendChild(script);
  }

  loadScript('https://unpkg.com/react-trigger-change/dist/react-trigger-change.js');

  function changeInput(node, value) {
    node.value = value;
    reactTriggerChange(node);
  }

  changeInput(document.getElementById("firstName"), "Roman");
```

- https://stackoverflow.com/questions/39065010/why-react-event-handler-is-not-called-on-dispatchevent/45356934#45356934
- https://github.com/vitalyq/react-trigger-change
- Triggering events on real DOM nodes doesn't trigger synthetic events #3249 https://github.com/facebook/react/issues/3249#issuecomment-292919084
- https://stackoverflow.com/questions/24415631/reactjs-syntheticevent-stoppropagation-only-works-with-react-events
- Option to disable React's handling of synthetic events? #1964 https://github.com/facebook/react/issues/1964
- https://facebook.github.io/react/docs/test-utils.html#simulate
- https://facebook.github.io/react/docs/events.html
- https://dlinau.wordpress.com/2015/09/16/avoid-mixing-reacts-event-system-with-native-dom-event-handling/
- https://www.kirupa.com/react/events_in_react.htm  
- https://appendto.com/2017/01/react-events-101/
