## dependency injection

Developers just don't get what they should connect() and how to design their components, and Redux doesn't really offer them much guidance. As an example, every single day I have to mention in code reviews that something like a "loadProducts" prop does not make any sense on something like a "SearchButton" component, just because our Redux action happens to be named "loadProducts" – an "onClick" prop that just happens to be mapped to "loadProducts" in connect() makes much more sense. But devs are lazy and just end up giving components a bad design with a bunch of props that wouldn't make sense if Redux were not involved. Most of my code reviews contain the words "design your component's API without even thinking about Redux yet!"

Developers don't realize that connect() is just dependency injection for props, and those props should at least make sense from a dumb-component standpoint before Redux is involved.

https://news.ycombinator.com/item?id=16806783

## hoc

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
