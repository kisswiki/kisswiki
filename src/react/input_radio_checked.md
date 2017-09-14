Beware of setting like this `checked={!withChildren}` because value may not be convertible to false.

- https://codepen.io/rofrol/pen/Ewjjvo?editors=0010
- https://stackoverflow.com/questions/40407218/true-and-false-radio-buttons-in-react

```jsx
<label>
    <input
        className="radio-input"
        type="radio"
        value="true"
        name="childrenTravel"
        checked={withChildren === true}
        onChange={this.storeInputBoolChange}
    />
    YES
</label>
<label>
    <input
        className="radio-input"
        type="radio"
        value="false"
        checked={withChildren === false}
        name="childrenTravel"
        onChange={this.storeInputBoolChange}
    />
    NO
</label>
```

```javascript
storeInputBoolChange = (inputChangeEvent) => {
    const { value, name } = inputChangeEvent.target;
    this.storeBookingStepValue(value === 'true', name);
};
```
