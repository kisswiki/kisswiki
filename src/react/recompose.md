- https://pusher.com/sessions/meetup/react-vienna/recompose-to-simplicity-and-beyond
- http://blog.krawaller.se/posts/5-reasons-not-to-use-es6-classes-in-react/

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

## alternatives

- https://github.com/neoziro/recompact
- https://github.com/wikiwi/reassemble
