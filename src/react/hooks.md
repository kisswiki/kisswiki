## `useSelector` and `dispatch`

Use can use `useSelector` and `dispatch` instead of `connect` and `mapStateToProps` https://thoughtbot.com/blog/using-redux-with-react-hooks

## Hooks and stale closure

Hooks implementation assumes that between the component re-renderings, the latest closure supplied as a callback to the hook (e.g. useEffect(callback)) has captured the freshest variables from the component’s function scope. https://dmitripavlutin.com/react-hooks-stale-closures/