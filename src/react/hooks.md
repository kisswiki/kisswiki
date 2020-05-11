## `useSelector` and `dispatch`

Use can use `useSelector` and `dispatch` instead of `connect` and `mapStateToProps` https://thoughtbot.com/blog/using-redux-with-react-hooks

## Hooks and stale closure

Hooks implementation assumes that between the component re-renderings, the latest closure supplied as a callback to the hook (e.g. useEffect(callback)) has captured the freshest variables from the component’s function scope. 

- https://dmitripavlutin.com/react-hooks-stale-closures/
  - diff https://gist.github.com/rofrol/2ac749eab2fe30782701238b04bcd682/revisions

## componentDidMount equivalent is useLayoutEffect

>This hook similar to the useEffect hook, however, it fires synchronously after all DOM mutations. It also renders in the same way as componentDidUpdate and componentDidMount.

- https://www.smashingmagazine.com/2020/04/react-hooks-api-guide/
- https://reacttraining.com/blog/useEffect-is-not-the-new-componentDidMount/

## Using Set is problematic

Probably better to use array.

```javascript
  function handleMultiple(val, fn) {
    return function (checkedName) {
      const newVal = val.includes(checkedName)
        ? val.filter(name => name !== checkedName)
        : [...val, checkedName];;
      fn(newVal);
    };
  }
```

- https://stackoverflow.com/questions/58806883/how-to-use-set-with-reacts-usestate/58806947#58806947
- https://codesandbox.io/s/material-demo-639rq?file=/demo.js
  - https://stackoverflow.com/questions/61475234/material-ui-react-form-hook-multiple-checkboxes-default-selected/61593933#61593933
