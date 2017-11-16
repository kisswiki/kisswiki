```javascript
  handleBlur = (event) => {
    const {relatedTarget} = event;
    if (relatedTarget && ('button' === relatedTarget.getAttribute('type'))) {
      event.preventDefault();
    }
  };
```

https://github.com/erikras/redux-form/issues/860#issuecomment-294274650