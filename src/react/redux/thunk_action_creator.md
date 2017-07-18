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

##

```javascript
export function addToCart(productId) {
    return (dispatch, getState) => {
        if (getState().products.byId[productId].inventory > 0) {
            dispatch(addToCartUnsafe(productId));
        }
    };
}
```

```javascript

<Todo key={todo.id} {...todo} onClick={() => onTodoClick(todo.id)} />

cosnt onTodoClick = id => {
      dispatch(toggleTodo(id))
}
```


