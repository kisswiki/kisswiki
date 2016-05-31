- framework
  - http://www.commitstrip.com/en/2015/09/16/how-to-choose-the-right-javascript-framework/
  - http://www.isaacchansky.me/days-since-last-new-js-framework/
  - https://devhumor.com/media/first-week-in-a-new-framework
- validation
  - https://github.com/SzybkiSasza/validators-pl
 - lint
   - eslint
    - [recent versions of ESLint do not use any rules by-default](https://atom.io/packages/linter-eslint)
    - http://devnull.guru/get-started-with-eslint/
     - https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb  
      `npm i -D eslint-config-airbnb`
- key binding
  - https://github.com/piranha/keymage
- computer science
  - https://github.com/nzakas/computer-science-in-javascript
- testing
  - https://github.com/vdemedes/trevor
  - code coverage
    - https://github.com/bcoe/nyc
  - https://github.com/erykpiast/cross-tester
  - http://vorlonjs.com/
  - http://thejsguy.com/2015/01/12/jasmine-vs-mocha-chai-and-sinon.html
  - http://www.techtalkdc.com/which-javascript-test-library-should-you-use-qunit-vs-jasmine-vs-mocha/
  - http://stackoverflow.com/questions/26032124/karma-vs-testing-framework-jasmine-mocha-qunit
  - http://stackoverflow.com/questions/24391462/what-are-the-differences-between-mocha-chai-karma-jasmine-should-js-etc-te
  - https://sean.is/writing/client-side-testing-with-mocha-and-karma/
- es6
  - https://github.com/domenic/count-to-6
- storage
  - http://nolanlawson.com/2015/09/29/indexeddb-websql-localstorage-what-blocks-the-dom/
- regex
  - https://github.com/slevithan/xregexp
 - modules
  - http://calendar.perfplanet.com/2015/loading-es2015-modules-using-combo-service/
- codemod - take a JS file as input and turn them into Abstract Syntax Trees (AST) and apply transformations on this AST later converting them back to JS again https://vramana.github.io/blog/2015/12/21/codemod-tutorial/ https://github.com/cpojer/js-codemod
- documenation
  - https://github.com/documentationjs/documentation
- filter errors
  - https://spion.github.io/posts/es7-async-await-step-in-the-wrong-direction.html
- const/let
  - browser support
    - http://kangax.github.io/compat-table/es6/#test-const
    - http://kangax.github.io/compat-table/es6/#test-let
  - When it comes to objects, const will protect your variable from reassignment, and the freeze method will protect all immediate properties. If you need all nested properties to be immutable also, then you will need to recursively freeze them. [source](http://programmers.stackexchange.com/questions/278652/how-much-should-i-be-using-let-vs-const-in-es6/302436#302436)
  - const and let will allow for block scoping variables in JavaScript, rendering patterns like IIFE less necessary http://www.sitepoint.com/joys-block-scoping-es6/
  - [ES6 Conventions](https://twitter.com/raganwald/status/564792624934961152)
    - use const by default
    - use let if you have to rebind a variable
    - use var to signal untouched legacy code
  - const with objects is very useful, since it ensures that you continue to use the same mutable object whenever you use a particular variable https://www.reddit.com/r/javascript/comments/3z74ok/will_let_eventually_replace_var/cyka28l const is a safeguard to avoid situations like re-assigning a variable accidentally or writing a new variable with that name in the same scope https://www.reddit.com/r/javascript/comments/3z74ok/will_let_eventually_replace_var/cyke57d
  - Object.freeze can be also used in constructors [source](https://www.reddit.com/r/javascript/comments/3z74ok/will_let_eventually_replace_var/cyjufzh)
  - [references](https://www.reddit.com/r/javascript/comments/3z74ok/will_let_eventually_replace_var/cyk2dyv)
  - const - It does offer compilers a very important guarantee though. JITs can know that the type of a variable will never change which gets rid of a whole host of optimization and bailout issues. https://www.reddit.com/r/javascript/comments/3z74ok/will_let_eventually_replace_var/cyk8gry
  - The TDZ causes it's own host of problems both for the user and for the JIT when it comes to making the code fast (JITs should only be able to heuristically optimize a couple common use cases).  
    There are other less-known related issues such as default parameters actually creating an intermediate scope. Babel and other transpilers are fairly open about not being able to detect all violations of the TDZ until runtime (meaning that you can write code that seems to transpile correctly into ES5, but breaks if it's actually run in an ES6 environment). https://www.reddit.com/r/javascript/comments/3z74ok/will_let_eventually_replace_var/cyjx36c
  - TDZ (Temporal Dead Zone) http://jsrocks.org/2015/01/temporal-dead-zone-tdz-demystified/
  - That's why the ES4 let was so great. It was basically syntactic sugar over self-executing lambdas which make it useful, but also make it obvious to developers. https://www.reddit.com/r/javascript/comments/3z74ok/will_let_eventually_replace_var/cyk86xc
- log
  - https://github.com/RReverser/better-log
  - https://github.com/padolsey-archive/prettyprint.js
- arrow function
  - doesn't have `arguments`. You have to use [rest parameters](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Functions/rest_parameters), but this gives us [performance and correctness](http://stackoverflow.com/questions/20541339/usage-of-rest-parameter-and-spread-operator-in-javascript/22077804#22077804)
    - I dlatego w Nodzie 5 arrow functions są trochę upośledzone, bo resta tam jeszcze nie ma, a arguments użyć nie można https://www.facebook.com/groups/257881290932879/permalink/948429821878019/?comment_id=948432228544445&comment_tracking=%7B%22tn%22%3A%22R%22%7D
  - `this` is taken from the surrounding code, beware http://derickbailey.com/2015/09/28/do-es6-arrow-functions-really-solve-this-in-javascript/ resolve this via their closure (lexically) legacy functions locally override the lexical this instead https://www.reddit.com/r/javascript/comments/3z74ok/will_let_eventually_replace_var/cyk7oq5
- es6 https://medium.com/ecmascript-2015/default-rest-spread-f3ab0d2e0a5e
- https://github.com/loverajoel/jstips
- for...in iterates over property names, for...of iterates over property values https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Statements/for...of
- execute exported function from the cli without running the whole program https://github.com/shri3k/funxtion
- [super() considered hmmm-ful](http://raganwald.com/2015/12/23/super-considered-hmmmful.html)
- polyfill not so good https://channel9.msdn.com/Events/WebPlatformSummit/2015/Advancing-JavaScript-without-breaking-the-web/
- https://github.com/Kikobeats/awesome-network-js
 - promise
  - https://github.com/getify/native-promise-only
- module
  - http://www.2ality.com/2015/12/bundling-modules-future.html
- learn
  - https://leanpub.com/javascriptallongesix/read
  - http://www.amazon.com/Secrets-JavaScript-Ninja-John-Resig/dp/193398869X
  - https://www.reddit.com/r/learnjavascript
  - http://eloquentjavascript.net/
  - https://github.com/loverajoel/jstips
  - https://github.com/ericelliott/essential-javascript-links
  - http://www.w3resource.com/javascript-exercises/
- [hyperscript helper tutorial](https://freezer.js.org/minimum-viable-view-library/)
- animation
  - https://github.com/jaxgeller/tweezer.js
 - colision
  - https://www.reddit.com/r/javascript/comments/3zrsec/p2js_polygon_demo_draw_something/
- equality
  - http://dorey.github.io/JavaScript-Equality-Table/unified/
- asynchronous javascript https://github.com/Sage/streamlinejs
  - CSP
    - Creates a channel with an optional buffer, an optional transducer, and optional exception handler. We'll elaborate more on them later on. https://github.com/ubolonton/js-csp/blob/master/doc/basic.md
- https://www.reddit.com/r/javascript/comments/42036z/i_thought_it_might_be_fun_to_recreate_new_by_hand/
- benchmark/speed
  - https://www.reddit.com/r/javascript/comments/42tdqi/preact_fast_3kb_react_alternative_with_the_same/
    - http://mathieuancelin.github.io/js-repaint-perfs/
    - http://localvoid.github.io/uibench/
- regex
  - find words without `e` character `/\b[^e\s]*\b/g` https://regex101.com/r/sR6wH0/1 https://www.facebook.com/groups/js.pierwsze.kroki/permalink/564727727026666/
- input file fire change event on the same file name http://stackoverflow.com/questions/12030686/html-input-file-selection-event-not-firing-upon-selecting-the-same-file
- code meant to be run in your browser's console to provide you with some scraping utilities https://medialab.github.io/artoo/
- https://www.smashingmagazine.com/2015/04/web-scraping-with-nodejs/
- https://medium.com/@Functionite/5-tips-for-writing-more-maintainable-javascript-code-b87de1147e94
- Codemods allow you to transform your code to make breaking changes but without breaking the code. Codemods take a JS file as input and turn them into Abstract Syntax Trees (AST) and apply transformations on this AST later converting them back to JS again. https://github.com/sindresorhus/ava/issues/644 https://github.com/facebook/jscodeshift

## console.proto

```javascript
console.proto = function (object) {
  console.log(object, '|', object.constructor);
  if (object.__proto__) console.proto(object.__proto__);
}

```

http://stackoverflow.com/questions/29195856/proto-array-prototype-symbolsymbol-unscopables-object

## String isLower and isUpper

http://stackoverflow.com/questions/1027224/how-can-i-test-if-a-letter-in-a-string-is-uppercase-or-lowercase-using-javascrip/9728437#9728437
