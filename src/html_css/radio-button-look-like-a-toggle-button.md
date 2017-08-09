- https://stackoverflow.com/questions/5523735/how-to-make-a-radio-button-look-like-a-toggle-button
- http://jsfiddle.net/rofrol/uPv6X/422/

```html
<style>
body {
  background-color: white;
}

.toggle-button {
  display: flex;
}

input[type="radio"].toggle {
    display: none;
}

input[type="radio"].toggle:checked + label {
    background-color: #f3f8fa;
}

input[type="radio"].toggle + label {
    width: 100px;
    text-align: center;
    padding: 10px;
    border: 1px solid #edf1f3;
    color: #5a6a74;
    cursor: pointer;
}

input[type="radio"].toggle:checked + label.btn:hover {
    background-color: #cacecf;
    background-position: 0 0;
    transition: none;
}

input[type="radio"].toggle-left + label {
    border-right: 0;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}

input[type="radio"].toggle-right + label {
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
}
</style>

<div class="toggle-button">
  <input id="toggle-on" class="toggle toggle-left" name="toggle" value="false" type="radio" checked>
  <label for="toggle-on" class="btn">On</label>
  <input id="toggle-off" class="toggle toggle-right" name="toggle" value="true" type="radio">
  <label for="toggle-off" class="btn">Off</label>
</div>
```
