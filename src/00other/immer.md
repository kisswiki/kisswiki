## console.log draft

```javascript
import { current } from "immer";
console.log(current(draft));
```

- https://stackoverflow.com/questions/59243263/how-to-debug-log-useful-information-inside-immer-callback/66441033#66441033
- https://immerjs.github.io/immer/current/
- https://github.com/immerjs/immer/blob/31684f262a9ec16d5aadb82156a78e81b98f65ef/__tests__/current.js#L40
- https://twitter.com/dan_abramov/status/1299078315819573253
- https://github.com/immerjs/immer/issues/591#issuecomment-642237384
- https://github.com/immerjs/immer/commit/4af88f1ccc6eeb3f8fddcacfced3249a54fb0bad
- https://stackoverflow.com/questions/57240245/how-do-i-see-state-when-logging-to-the-console-instead-of-proxy-object-inside-re
- https://github.com/immerjs/immer/issues/294#issuecomment-723227862

## original - Cannot perform 'get' on a proxy that has been revoked

When copying from proxy to local state I got later error:

`Cannot perform 'get' on a proxy that has been revoked`

The solution was to use `original`:

```tsx
import { original } from "immer";

foundRule[key] = original(itemD[key]);
```

- https://immerjs.github.io/immer/original/
- https://github.com/immerjs/immer/pull/179
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy
- https://stackoverflow.com/questions/51096547/how-to-get-the-target-of-a-javascript-proxy
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy/revocable
- https://christianalfoni.com/articles/taking-immer-one-step-further
- https://blog.bitsrc.io/a-practical-guide-to-es6-proxy-229079c3c2f0
