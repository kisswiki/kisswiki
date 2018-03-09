```html
<!doctype html>
<form onSubmit="handleSubmit">
  <input />
  <div onClick="handleClick">
      <button id="xd">Submit</button>
  </div>
</form>
<script>
    handleSubmit = event => {
        event.preventDefault();
        alert('handleSubmit');
        return false;
    }
    handleClick = event => {
        alert('handleClick');
    }
</script>
```

Couple of bugs:

1. Functions should be run: `onSubmit="handleSubmit()"` and `onClick="handleClick()"`.
2. When passing function to `onSubmit` or `onClick`, you will not get event in parameter. You do this, you will overshadow event with `undefined`.
4. We could prevent event bubbling with `stopPropagation`, also in react https://codepen.io/rofrol/pen/RMNKmm :

```javascript
document.getElementById('xd').onclick = event => {
  event.stopPropagation();
};
```

4. Alternative is to use `addEventListener`:

```javascript
document.querySelector('form').addEventListener('submit', event => {
    event.preventDefault();
    console.log('handleSubmit');
    alert('handleSubmit');
    return false;
});
```

- https://jsfiddle.net/rofrol/1rcr59k9/
- https://stackoverflow.com/questions/21477717/how-to-call-a-js-function-using-onclick-event
- https://developer.mozilla.org/pl/docs/Web/API/Element/onclick
- https://developer.mozilla.org/en-US/docs/Web/Events/click