- https://github.com/vlad-ignatov/react-numeric-input

## value is number or string?

The input element represents a control for setting the element's value to a string representing a number.

https://html.spec.whatwg.org/multipage/input.html#number-state-(type=number)

## invalid input

The value sanitization algorithm is as follows: If the value of the element is not a valid floating-point number, then set it to the empty string instead.

http://www.whatwg.org/specs/web-apps/current-work/multipage/the-input-element.html#value-sanitization-algorithm

By specifying the type (`<input type="number">)` you're asking the browser to do some work for you. If, on the other hand, you'd like to be able to capture the non-numeric input and do something with it, you'd have to rely on the old tried and true text input field and parse the content yourself.

https://stackoverflow.com/questions/18852244/how-to-get-the-raw-value-an-input-type-number-field/18853513#18853513

use the CSS `:invalid` selector for this.

```css
input[type=number]:invalid {
    background-color: #FFCCCC;
}
```

https://stackoverflow.com/questions/18852244/how-to-get-the-raw-value-an-input-type-number-field/18853866#18853866
