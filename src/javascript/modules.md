`import !== require`. You can think of it like this.

`import * as ...` imports the entire namespace. These are roughly equivalent.

```javascript
import * as React from 'react';

const React = require( 'react' );
```

`import { ... }` imports specific named exports from the namespace, roughly like destructuring.


```
import { createElement } from 'react';

const { createElement } = require( 'react' );
// or
const createElement = require( 'react' ).createElement;
```

`import ...` imports the default export, which is just a named export with the special name default. It's just some sugar for `import { default as ... }`.

```
import React from 'react';
// or
import { default as React } from 'react';

const { default: React } = require( 'react' );
// or
const React = require( 'react' ).default;
```

https://github.com/rollup/rollup/issues/437#issuecomment-172785461

## ex1

file1.js

```javascript
const setBookingStepEnhancer = step => compose(
  withState('step', 'setStep', step),
  lifecycle({
    componentDidMount () {
      this.props.setBookingStep(this.props.step);
    },
  }),
);

export default {
  asdasd: 'asdasd',
  setBookingStepEnhancer,
};
```

```javascript
import * as file1 from 'file1';
console.log(file1); // Object {asdasd: "asdasd", setBookingStepEnhancer: function}
```

## ex2
