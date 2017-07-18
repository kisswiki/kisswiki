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

- A thunk action creator is a function that returns a function. If you're using the redux-thunk middleware, the inner function will be called and given references to dispatch and getState, like this:

```javascript
function makeAjaxCall(someValue) {
    return (dispatch, getState) => {
        dispatch({type : "REQUEST_STARTED"});
        
        myAjaxLib.post("/someEndpoint", {data : someValue})
            .then(response => dispatch({type : "REQUEST_SUCCEEDED", payload : response})
            .catch(error => dispatch({type : "REQUEST_FAILED", error : error});    
    };
}
```

- http://blog.isquaredsoftware.com/2016/10/idiomatic-redux-why-use-action-creators/
