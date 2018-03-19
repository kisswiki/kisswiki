lodash released 4.17.5, and the lodash-es package now contains the "sideEffects": false flag, which allows webpack4 to tree-shake lodash.

```javascript
import * as _ from 'lodash-es';

console.log(_.identity({ a: 1, b: 2, c: 3 }));
```

- https://github.com/AviVahl/lodash-es-webpack4/blob/master/src/index.js
- https://github.com/webpack/webpack/issues/1750#issuecomment-363080033
- https://stackoverflow.com/questions/49036745/not-able-to-tree-shake-lodash-in-a-webpack-typescript-project
- https://github.com/lodash/babel-plugin-lodash
- https://medium.com/@martin_hotell/tree-shake-lodash-with-webpack-jest-and-typescript-2734fa13b5cd