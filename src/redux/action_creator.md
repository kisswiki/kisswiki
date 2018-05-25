- action - object with field `type`
- action creator - function which returns action
- bound action creator - action creator wrapped with dispatch
- thunk action creator - function which takes parameters and returns function which takes dispatch and getState - dispatch can be run conditionally

##

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

In traditional Flux, action creators often trigger a dispatch when invoked, like so:

```javascript
function addTodoWithDispatch(text) {
  const action = {
    type: ADD_TODO,
    text
  }
  dispatch(action)
}
```

In Redux this is not the case.

Instead, to actually initiate a dispatch, pass the result to the dispatch() function:

```javascript
dispatch(addTodo(text))
dispatch(completeTodo(index))
```

Alternatively, you can create a bound action creator that automatically dispatches:

```javascript
const boundAddTodo = text => dispatch(addTodo(text))
const boundCompleteTodo = index => dispatch(completeTodo(index))
```

The `dispatch()` function can be accessed directly from the store as `store.dispatch()`, but more likely you'll access it using a helper like react-redux's `connect()`. You can use `bindActionCreators()` to automatically bind many action creators to a `dispatch()` function.

- http://redux.js.org/docs/basics/Actions.html

##

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

## cons

> 1 ... put the logic for creating that action in one place

This isn't so simple. You end up duping the action in at minimum 1 AC (often many ACs), and onboard the complexity of an unnecessary function, plus importing and connecting that function all over your app. A UNIQUE_ACTION_CONSTANT is an easy refactor, unlike action creators, which can cause a cascade of changes when reworking component structures.

> 3 ... larger logic that goes into preparing the action object,

This justies a function, not necessarily an AC.

> 4 ... lets the action creator worry about how to handle things

Smart components are already aware of the state system by means of connect. Further, in AC aware apps, you have a whole swath of extra imports to manage, more connect calls to manage, and a binding API to consider, which sometimes requires patterns and team agreement on their own. dispatch + messages does away with all of that, and is shown to be simple/effective as popularized in Elm and Reason.

> 5 ... testing

Kinda. I'll meet ya half way here. But stubbing disptach and/or component methods is also very cheap, and super simple to reason about.

https://news.ycombinator.com/item?id=17150377