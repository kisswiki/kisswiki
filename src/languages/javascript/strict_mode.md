Add `"use strict";` to the file or function, though it's syntax error when you use in function's body whose parameters either have default values, use destructuring, or a rest parameter.
Strict mode is automatically on in ecma modules and classes.

- https://www.reddit.com/r/javascript/comments/58vx86/the_ecmascript_2016_change_on_use_strict_you/

Strict mode:

### disallowing the implicit auto-global variable declaration from omitting the var

```javascript
function foo() {
    "use strict";   // turn on strict mode
    a = 1;          // `var` missing, ReferenceError
}

foo();
```

https://github.com/getify/You-Dont-Know-JS/blob/master/up%20%26%20going/ch2.md
