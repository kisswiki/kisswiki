##

```javascript
const enhance = compose(
  withState('isAvailable', 'setIsAvailable', false),
  withState('isReady', 'setIsReady', false),
  lifecycle({
    componentDidMount() {
      myCall
        .getResponse([productId])
        .then(products => {
          this.props.setIsReady(true);
        });
    },
  }),
  mapProps(({
    setIsAvailable,
    setIsReady,
    ...state,
  }) => ({
    onLogoutTouchTap: () => {
      ...
```

https://stackoverflow.com/questions/41651283/how-do-i-setstate-within-reacts-recomposes-lifecycle-method
