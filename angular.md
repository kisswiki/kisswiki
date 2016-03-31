- simple checkbox tree
  - http://codepen.io/sliiice/pen/GurpF
  - https://github.com/iVantage/angular-ivh-treeview
- http://stackoverflow.com/questions/25655434/manipulating-inline-style-with-angular-does-not-work-in-ie
- $parse is like eval but you can pass it a context https://umur.io/advanced-angular-parse/
- $scope http://jsfiddle.net/simpulton/SPMfT/
- alert in ng-click: `$scope.alert = alert.bind(window);` and `ng-click="test(game)"` http://stackoverflow.com/questions/25907383/use-alert-from-ng-click-of-a-directive

## compile, post, pre

- http://odetocode.com/blogs/scott/archive/2014/05/28/compile-pre-and-post-linking-in-angularjs.aspx
- http://stackoverflow.com/questions/11125078/is-there-a-post-render-callback-for-angular-js-directive/11126336#11126336

```
$timeout(function () {
    //DOM has finished rendering
});
```

## clear input

In angular-1.4 I can't just null model associated to input. I need to

`document.getElementById('fileupload').value = null;`

http://stackoverflow.com/questions/15079779/how-to-clear-a-file-input-from-angular-js#comment58018460_17178099

## $scope.$apply() vs $scope.$apply(fn)

If your code isn’t wrapped in a function passed to $apply, and it throws an error, that error is thrown outside of AngularJS, which means any error handling being used in your application is going to miss it. $apply not only runs your code, but it runs it in a try/catch so your error is always caught, and the $digest call is in a finally clause, meaning it will run regardless of an error being thrown.

http://jimhoskins.com/2012/12/17/angularjs-and-apply.html
