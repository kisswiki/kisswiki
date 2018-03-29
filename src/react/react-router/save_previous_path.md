```javascript
export const reducer = (state = {}, action) => {
  switch (action.type) {
    case '@@router/LOCATION_CHANGE':
      return { ...state, previous: state.current, current: action.payload };
    default:
      return state;
  }
};
```

https://stackoverflow.com/questions/39288915/detect-previous-path-in-react-router/44288082#44288082