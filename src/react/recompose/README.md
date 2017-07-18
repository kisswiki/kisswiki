- Pros and Cons https://pusher.com/sessions/meetup/react-vienna/recompose-to-simplicity-and-beyond
- http://blog.krawaller.se/posts/5-reasons-not-to-use-es6-classes-in-react/
- https://medium.com/javascript-inside/why-the-hipsters-recompose-everything-23ac08748198
- https://github.com/acdlite/recompose/blob/master/docs/API.md

## decorators vs HOCs

This is an appealing pattern at first glance, but it has some drawbacks:

- Decorators can only work on classes, not functions, which pulls us away from the preference for functional components whenever possible.
- You can’t isolate your presentational component from the decorators for testing or reuse - the decorator is hard-coded in
- The decorator standard is not set yet and could change. It is also less-widely implemented in standard Babel configs.
- The only place you can add a decorator is at the component declaration. We can’t import and then decorate.
- Having the composition happen at the end of the file feels better to me, though YMMV.


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
