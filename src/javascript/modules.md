- http://2ality.com/2014/09/es6-modules-final.html

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
import { setBookingStepEnhancer } from 'file1';
console.log(setBookingStepEnhancer); // undefined
```

>The reason you can't destructure directly in the import statement is because of the static syntax for named imports, such as import {foo} from "bar";. That is determined at compile time, and the linking itself is done at compile time.

- https://esdiscuss.org/topic/import-statements-destructuring
- https://mail.mozilla.org/pipermail/es-discuss/2015-October/044437.html

>the {} syntax in imports is for "named" imports and is not destructuring even though it looks like it or seems similar. You can always destructure in another statement though afterwards.

https://github.com/babel/babel/issues/4996#issuecomment-267024616


The default export is just another named export  

The default export is actually just a named export with the special name default. That is, the following two statements are equivalent:

```javascript
import { default as foo } from 'lib';
import foo from 'lib';
```

Similarly, the following two modules have the same default export:

```javascript
//------ module1.js ------
export default 123;

//------ module2.js ------
const D = 123;
export { D as default };
```

http://2ality.com/2014/09/es6-modules-final.html
