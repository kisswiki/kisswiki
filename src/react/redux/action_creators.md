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

- http://redux.js.org/docs/basics/Actions.html

- An action is a plain simple object, like {type : "ADD_TODO", text : "Buy milk"}.
- An action type is the value for the type field in an action. Per the Redux FAQ, this field should be a string, although Redux only enforces that a type field exists in the action.
- An action creator is a function that returns an action, like:

```javascript
function addTodo(text) {
    return {
        type : "ADD_TODO",
        text
    }
}
```

- http://blog.isquaredsoftware.com/2016/10/idiomatic-redux-why-use-action-creators/
