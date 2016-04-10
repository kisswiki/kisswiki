- https://matthewphillips.info/posts/using-npm-with-systemjs.html
- https://github.com/stealjs/system-npm
- https://github.com/OliverJAsh/systemjs-browser-node-example
- https://www.codingpedia.org/jhadesdev/introduction-to-the-jspm-package-manager-and-the-systemjs-module-loader/
- http://blog.jhades.org/introduction-to-es6-modularity-the-jspm-package-manager-and-the-systemjs-loader/
- http://guybedford.com/practical-workflows-for-es6-modules
- http://jspm.io/0.17-beta-guide/hot-reloading.html
  - https://github.com/capaj/systemjs-hot-reloader
- https://github.com/jspm/jspm-cli/issues/872
- http://stackoverflow.com/questions/22291236/system-js-load-multiple-dependencies-in-one-call
- Support plugin-relay-babel https://github.com/systemjs/systemjs/issues/1117

## Automatic module splitting

- https://github.com/jspm/jspm-cli/issues/923
- http://stackoverflow.com/questions/32151386/jspm-multiple-bundles-vendor-and-app

## React

Webpack's offering is good, but it is a big hack which lacks robustness. Even such basic thing as component event listeners is not working properly with webpack hot reloading. JSPMs module system is robust and safe. It will not suprise you-ES6 modules are very predictable when hot reloaded, much more than raw React components. Try it for yourself. Speed is certainly not the issue anymore.
