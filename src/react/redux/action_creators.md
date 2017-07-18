functions that create actions

In Redux action creators simply return an action:

```javascript
function addTodo(text) {
  return {
    type: ADD_TODO,
    text
  }
}
```

http://redux.js.org/docs/basics/Actions.html
