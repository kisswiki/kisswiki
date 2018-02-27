http://redux.js.org/docs/api/Store.html#dispatch

## multiple actions

```javascript
const action1 = id => {
  return dispatch => {
    dispatch(action2(id))
    dispatch(action3(id))
  }
}
```

https://stackoverflow.com/questions/44321676/where-to-dispatch-multiple-actions-in-redux