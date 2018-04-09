## Description of methods used

### `describe` is from jest

https://github.com/facebook/jest/blob/ef55e89f8ebe1c5977e0c2bf4a868f091f21136a/packages/jest-jasmine2/src/jasmine/Env.js

```javascript
this.describe = function(description, specDefinitions) {
```

- https://facebook.github.io/jest/docs/en/api.html#describename-fn
- https://stackoverflow.com/questions/32055287/what-is-the-difference-between-describe-and-it-in-jest

### `it` comes from from jasmine-light

`jest -> jest-cli -> jest-jasmine2`

https://github.com/facebook/jest/blob/ef55e89f8ebe1c5977e0c2bf4a868f091f21136a/packages/jest-jasmine2/src/index.js

```javascript
const JASMINE = require.resolve('./jasmine/jasmine_light.js');
const jasmineFactory = runtime.requireInternalModule(JASMINE);
Object.assign(environment.global, jasmineInterface);
```

https://github.com/facebook/jest/blob/ef55e89f8ebe1c5977e0c2bf4a868f091f21136a/packages/jest-jasmine2/src/jasmine/jasmine_light.js

```javascript
    it() {
      return env.it.apply(env, arguments);
    },
```

https://github.com/facebook/jest/blob/ef55e89f8ebe1c5977e0c2bf4a868f091f21136a/packages/jest-jasmine2/src/jasmine/Env.js

```javascript
    this.it = function(description, fn, timeout) {
```

Original `it`

https://github.com/jasmine/jasmine/blob/ea57ad97cf6bad4c3a7e355c09477e2da2df0e8d/lib/jasmine-core/jasmine.js

```javascript
this.it = function(description, fn) {
```

- https://jasmine.github.io/api/2.8/global.html#it

### `expect` comes from jest

`jest -> jest-cli -> jest-jasmine2`

https://github.com/facebook/jest/blob/ef55e89f8ebe1c5977e0c2bf4a868f091f21136a/packages/jest-jasmine2/src/jest_expect.js

```javascript
import expect from 'expect';
// ...
export default (config: {expand: boolean}) => {
  global.expect = expect;
```

- https://github.com/facebook/jest/tree/ef55e89f8ebe1c5977e0c2bf4a868f091f21136a/packages/expect/src
- https://facebook.github.io/jest/docs/en/expect.html

## `enzyme` is taken from enzyme

It's setup is here `config/setupTests.js`:

```javascript
import { configure } from 'enzyme';
```

- https://github.com/airbnb/enzyme/blob/master/docs/guides/jest.md

## `.called()` from sinon

`spy.called`

http://sinonjs.org/releases/v4.0.1/spies/

## `.toHaveBeenCalled()` is the same as `.toBeCalled()`

Uses spy's `calls`:

```javascript
  const count = receivedIsSpy
    ? received.calls.count()
    : received.mock.calls.length;
  const calls = receivedIsSpy
    ? received.calls.all().map(x => x.args)
    : received.mock.calls;
```

- https://github.com/facebook/jest/blob/master/packages/expect/src/spy_matchers.js#L200
- https://facebook.github.io/jest/docs/en/expect.html#tohavebeencalled

## toBeDefined

- https://facebook.github.io/jest/docs/en/expect.html#tobedefined
- https://stackoverflow.com/questions/14718841/jasmine-why-tobeundefined-and-not-tobedefined