Build an object how you like:

```jsx
var inputProps = {
  value: 'foo',
  onChange: this.handleChange
};

if (condition) inputProps.disabled = true;
```

Render with spread, optionally passing other props also.

```jsx
<input 
    value="this is overridden by inputProps" 
    {...inputProps} 
    onChange={overridesInputProps}
 />
 ```

https://stackoverflow.com/questions/31163693/how-to-conditionally-add-attributes-to-react-components/31164357#31164357
