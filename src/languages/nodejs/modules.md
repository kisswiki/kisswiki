
## Unexpected token import

In Node 9, it is enabled behind a flag, and uses the .mjs extension.

`node --experimental-modules my-app.mjs`

https://stackoverflow.com/questions/39436322/node-js-syntaxerror-unexpected-token-import

## SyntaxError: The requested module does not provide an export named

I starts working if I do the destructuring after the import instead:

```javascript
import redux from "redux";
const { createStore } = redux;
```

https://github.com/reactjs/redux/issues/2614