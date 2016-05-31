# Promise

## unhandled Promise rejections

My favorite new part of the ES7 spec, not mentioned here, is a mechanism for capturing unhandled Promise rejections like uncaught errors. In ES6, errors in asynchronous code just disappear into the ether. ES7 (and the HTML Living Standard) fixes that via the unhandledrejection event, which is like window.onerror for promises.

http://v8project.blogspot.com/2016/04/es6-es7-and-beyond.html?showComment=1461966145498#c2568637202932663277
