```javascript
import * as ... imports the entire namespace. These are roughly equivalent.
import * as React from 'react';

const React = require( 'react' );
import { ... } imports specific named exports from the namespace, roughly like destructuring.
import { createElement } from 'react';

const { createElement } = require( 'react' );
// or
const createElement = require( 'react' ).createElement;
// import ... imports the default export, which is just a named export with the special name default. It's just some sugar for import { default as ... }.
import React from 'react';
// or
import { default as React } from 'react';

const { default: React } = require( 'react' );
// or
const React = require( 'react' ).default;
```

https://github.com/rollup/rollup/issues/437#issuecomment-172785461
