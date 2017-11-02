- http://www.avitzurel.com/blog/2016/08/03/connected-higher-order-components-with-react-and-redux/

## empty connect

###

```javascript
const enhance = compose(
  setDisplayName('User'),
  setPropTypes({
    name: React.PropTypes.string.isRequired,
    status: React.PropTypes.string
  }),
  connect()
);
```

https://github.com/acdlite/recompose/wiki/Recipes#mix-hoc-from-various-libraries

###

the `() => ({})` parameter is actually not necessary in this case since that is the default mapper so using `connect()(App)` actually gets you the same functionality. That said there isn't much use in subscribing to the redux store if you don't provide a mapper to grab some state. 

https://github.com/reactjs/react-redux/issues/94#issuecomment-138718839
