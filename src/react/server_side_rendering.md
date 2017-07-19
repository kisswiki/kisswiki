- https://www.google.com/webmasters/tools/googlebot-fetch
- https://www.reddit.com/r/reactjs/comments/4gf6ma/will_a_reactrouter_spa_be_crawled_by_google/
  - https://github.com/mapbox/mapbox-gl-js/issues/3422
  - https://github.com/babel/babel/issues/4125
- https://medium.com/@gajus/react-application-seen-as-a-blank-page-via-fetch-as-google-afb11dff8562
- https://medium.com/@andrewzey/google-seo-with-create-react-app-fixing-the-hidden-gotcha-c164063106d
- https://medium.freecodecamp.org/using-fetch-as-google-for-seo-experiments-with-react-driven-websites-914e0fc3ab1
- https://github.com/davezuko/react-redux-starter-kit/issues/819
- https://blog.codaxy.com/debugging-googlebot-crawl-errors-for-javascript-applications-5d9134c06ee7
- https://github.com/jhabdas/lumpenradio-com/blob/master/tools/webpack.config.js
- http://chrisarasin.com/react-seo/
  - https://github.com/ChrisArasin/ReactSEOTest
- https://github.com/jaredpalmer/razzle
- https://github.com/davezuko/react-redux-starter-kit

## babel-polyfill

It turns out that the Google Bot uses a different version of V8 from the latest Chrome, and apparently doesn’t support the same EcmaScript feature set.

It turns out that the Google Bot uses a different version of V8 from the latest Chrome, and apparently doesn’t support the same EcmaScript feature set.
Adding babel-polyfill to my project, and importing it at the top of my entry file solved the problem, and resulted in a successful render!

```
// From command line in project root 
$ npm install --save babel-polyfill 
// in App.jsx (my project entry file) 
import 'babel-polyfill'
```

https://medium.com/@andrewzey/google-seo-with-create-react-app-fixing-the-hidden-gotcha-c164063106d


## useBuiltIns

boolean, defaults to false.

A way to apply babel-preset-env for polyfills (via "babel-polyfill").

NOTE: This does not currently polyfill experimental/stage-x built-ins like the regular "babel-polyfill" does. This will only work with npm >= 3 (which should be used with Babel 6 anyway)

- https://github.com/babel/babel-preset-env
- https://github.com/babel/babel-preset-env/issues/141

## PhantomJS

Without quoting any sources, I will say that there is a rumour that “Fetch as Google” is using PhantomJS v2.1 to render pages.

I have tested rendering of my page using PhantomJS v2.1.1 and got the same result: a blank page. However, even more worrying was that PhantomJS produced no errors either. No syntax error, no warning, no missing resource, etc.

Turns out that there is a bug in PhantomJS v2.1 that makes syntax errors fail silently https://github.com/ariya/phantomjs/issues/13281.

PhantomJS and “Fetch as Google” produced non-equivalent looking screenshots.

https://medium.com/@gajus/react-application-seen-as-a-blank-page-via-fetch-as-google-afb11dff8562


## onError

- https://blog.codaxy.com/debugging-googlebot-crawl-errors-for-javascript-applications-5d9134c06ee7
- https://tomat.blog/a-simple-trick-to-make-the-google-crawler-tell-you-about-javascript-errors-2fd5d9d2e064
  - https://gist.github.com/tomat/547c5140462a948311160297735f7483
- http://openmymind.net/2012/4/4/You-Really-Should-Log-Client-Side-Error/

## babel-preset-env

your example is using a class property and these are currently a stage-2 feature. babel-preset-env includes only plugins that are part of babel-preset-latest. It won't include any stage-x plugins. You need to include these yourself.

- https://github.com/babel/babel-preset-env/issues/218#issuecomment-287607022
- https://github.com/babel/babel-preset-env
- http://2ality.com/2017/02/babel-preset-env.html

### babel-polyfill

https://stackoverflow.com/questions/43282214/is-it-better-to-have-polyfills-as-import-statements-with-babel-preset-env-or-add

## Parsing error: Unexpected token

https://stackoverflow.com/questions/42876783/dont-work-park-functionality-of-babel-preset-env

## SyntaxError: Unexpected token: name (xxxxxx) from Uglify plugin #2972

Uglify cannot parse ES6, it will throw you syntax errors. Either set TypeScript to target ES5, post-process your generated JS with babel, or use a different minifier.

https://github.com/webpack/webpack/issues/2972
