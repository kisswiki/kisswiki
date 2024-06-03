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

## get number from string

`event.target.valueAsNumber` gives `NaN` for empty string

- https://davidwalsh.name/input-valueasnumber
- https://developer.mozilla.org/en-US/docs/Web/API/HTMLInputElement

## problems with input type="number"

`input` event will give empty string in `event.target.value` if non-number,-,+,. entered.

The number input performs input sanitization by default. If a user enters anything that isn’t a valid number, the value will be equal to an empty string — regardless of what the user can see on the screen.

- https://css-tricks.com/finger-friendly-numerical-inputs-with-inputmode/
- https://stackoverflow.blog/2022/12/26/why-the-number-input-is-the-worst-input/

If spinbutton is not an important feature for your form control, consider not using type="number". Instead, use `inputmode="numeric"` along with a pattern attribute that limits the characters to numbers and associated characters. With `<input type="number">`, there is a risk of users accidentally incrementing a number when they're trying to do something else. Additionally, if users try to enter something that's not a number, there's no explicit feedback about what they're doing wrong

https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/number#accessibility_concerns

The number input type is not appropriate for values that happen to only consist of numbers but aren't strictly speaking a number, such as postal codes in many countries or credit card numbers. For non-numeric inputs, consider using a different input type, such as `<input type="tel">` or other `<input>` type with the `inputmode` attribute:
html

```html
<input type="text" inputmode="numeric" pattern="\d*" />
```

https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/number#using_number_inputs

## change event

When not using spinbutton, `change` event will be triggered on `focusout`.

`change` does not seem to fire in `type="text"`.

- https://stackoverflow.com/questions/75715361/how-do-i-add-an-event-listener-for-a-number-type-input-in-javascript
- https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/number#pattern_validation

## type="number" does not support pattern

And pattern is only used for html validation, not for preventing to input characters.

## prevent non-numeric input

If you dislike the non-accepted character showing for a split-second before being erased, use `beforeinput`.

A safer approach is checking the value of the input, instead of hijacking keypresses and trying to filter keyCodes.

This way the user is free to use keyboard arrows, modifier keys, backspace, delete, use non standard keyboards, use mouse to paste, use drag and drop text, even use accessibility inputs.

```html
<!doctype html>
<div id="parent">
  <!-- <input id="input" type="number" pattern="[0-9.]+" /> -->
  <!-- <input id="input2" type="text" inputmode="numeric" pattern="\d*" /> -->

  <input type="text" id="numberField" inputmode="numeric" pattern="[0-9.,]+" />
  <input type="text" id="numberField2" inputmode="numeric" pattern="[0-9.,]+" />
  <!-- <input pattern="\d+((\.|,)\d+)?" /> -->
  <!-- <input type="number" step="any" /> -->
</div>
```

```javascript
// var input = document.getElementById("input");
// input.addEventListener("input", function (evt) {
//   console.log("parent of input", evt.currentTarget.value);
//   console.log(evt.target.value);
//   console.log(Number(evt.target.value));
//   console.log(evt.target.valueAsNumber);
//   console.log(parseFloat(evt.target.value, 10));
// });
// var input2 = document.getElementById("input2");
// input2.addEventListener("input", function (evt) {
//   console.log("parent of input2", evt.currentTarget.value);
//   console.log(evt.target.value);
//   console.log(Number(evt.target.value));
//   console.log(evt.target.valueAsNumber);
//   console.log(parseFloat(evt.target.value, 10));
// });
// input2.addEventListener("change", function (evt) {
//   console.log("parent of input2", evt.currentTarget.value);
//   console.log(evt.target.value);
//   console.log(Number(evt.target.value));
//   console.log(evt.target.valueAsNumber);
//   console.log(parseFloat(evt.target.value, 10));
// });

function restrictNumber(e) {
  // https://stackoverflow.com/questions/12004808/does-javascript-take-local-decimal-separators-into-account/56369438#56369438
  const { group, decimal } = new Intl.NumberFormat()
    .formatToParts(1111.1)
    .reduce((acc, { type, value }) => ((acc[type] = value), acc), {});
  const regex = new RegExp(`[-+]?(\\d+(\\${decimal}(\\d+)?)?)?`, "ig");
  const regex2 = new RegExp(
    `[+-]?(\\p{Number}+(\\${decimal}(\\p{Number}+)?)?)?`,
    "igu",
  );
  var n = e.target.value.match(regex);
  // this.value = n !== null ? n[0] : this.value;
  this.value = this.value.match(regex)?.[0] ?? "";
}

var userName = document.querySelector("#numberField");
userName.addEventListener("input", restrictNumber);

document
  .getElementById("numberField2")
  .addEventListener("beforeinput", function (e) {
    // const userLocale = (new Intl.NumberFormat()).resolvedOptions().locale
    // new Intl.NumberFormat(userLocale)
    // https://stackoverflow.com/questions/673905/how-can-i-determine-a-users-locale-within-the-browser/57529410#57529410

    // const { group, decimal } = new Intl.NumberFormat()
    //   .formatToParts(1111.1)
    //   .reduce((acc, { type, value }) => ((acc[type] = value), acc), {});
    const decimal = new Intl.NumberFormat()
      .formatToParts(1.1)
      .find(({ type }) => type === "decimal").value;

    // A regex for validating decimal numbers in the European number format (in many parts of Europe at least, including Germany).
    // A comma is used as a separator for the decimal number, a dot as a separator for thousand places.
    // ^\d{1,3}(?:\.\d{3})*(?:,\d+)?$|^\d+(?:,)?\d+$
    // https://regex101.com/library/YP1Vdn

    // better for grouping?
    // ^[+-]?(\d{1,3}((\.\d{3})+|\d*))(\,\d+)?$
    // https://regex101.com/r/Q2VnYd/1
    // https://stackoverflow.com/questions/53822997/regular-expression-to-match-number-with-decimal-separator-and-optional-thousands#comment94587873_53823115

    // disallows leading 0 and trailing .
    // ^[+-]?(0|[1-9]\d{0,2}((\,\d{3})+|\d*))(\.\d+)?$
    // https://stackoverflow.com/questions/53822997/regular-expression-to-match-number-with-decimal-separator-and-optional-thousands#comment94587873_53823115

    // the E scientific notation
    // /^[+-]?(?:[0-9]+(?:\.[0-9]+)?|\.[0-9]+)(?:[eE][+-]?[0-9]+)?$/
    // https://stackoverflow.com/questions/10256061/regular-expression-for-finding-decimal-float-numbers/66847280#66847280


    // const regex = new RegExp(`^[-+]?(\\d+(\\${decimal}(\\d+)?)?)?$`);

    // \p{Number} so that it also works with non-arabic digits
    // https://stackoverflow.com/questions/12004808/does-javascript-take-local-decimal-separators-into-account/42213804#42213804
    const regex = new RegExp(
      `^[+-]?(?:\\p{Number}+(?:\\${decimal}(?:\\p{Number}+)?)?)?$`,
      "u",
    );

    // https://stackoverflow.com/questions/70806083/how-to-preview-the-result-of-a-beforeinput-event/70806297#70806297
    const nextVal =
      e.target.value.substring(0, e.target.selectionStart) +
      (e.data ?? "") +
      e.target.value.substring(e.target.selectionEnd);
    console.log(regex.test(nextVal));
    if (!regex.test(nextVal)) {
      e.preventDefault();
    }
    return;
  });
```

- https://stackoverflow.com/questions/469357/html-text-input-allow-only-numeric-input
