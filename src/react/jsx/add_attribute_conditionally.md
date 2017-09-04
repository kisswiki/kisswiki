```jsx
var condition = true;

return (
  <Button {...condition ? {bsStyle: 'success'} : {}} />
);
```

https://stackoverflow.com/questions/31163693/how-to-conditionally-add-attributes-to-react-components/35428331#35428331
