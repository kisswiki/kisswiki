## Subscribe and emit

3. 1. If scope of firstCtrl is parent of the secondCtrl scope, your code should work by replacing $emit by $broadcast in firstCtrl:

```
function firstCtrl($scope) {
    $scope.$broadcast('someEvent', [1,2,3]);
}

function secondCtrl($scope) {
    $scope.$on('someEvent', function(event, mass) { console.log(mass); });
}
```

2. In case there is no parent-child relation between your scopes you can inject $rootScope into the controller and broadcast the event to all child scopes (i.e. also secondCtrl).

```
function firstCtrl($rootScope) {
    $rootScope.$broadcast('someEvent', [1,2,3]);
}
```

3. Finally, when you need to dispatch the event from child controller to scopes upwards you can use $scope.$emit. If scope of firstCtrl is parent of the secondCtrl scope:

```
function firstCtrl($scope) {
    $scope.$on('someEvent', function(event, data) { console.log(data); });
}

function secondCtrl($scope) {
    $scope.$emit('someEvent', [1,2,3]);
}
```

I would additionally suggest a 4th option:

 Use $rootScope.$emit rather than $rootScope.$broadcast regardless of the relationship between trasmitting and receiving controller. That way, the event remains within the set of $rootScope.$$listeners whereas with $rootScope.$broadcast the event propagates to all children scopes, most of which will probably not be listeners of that event anyway.

 http://stackoverflow.com/questions/14502006/working-with-scope-emit-and-on

 ## Unsubscribe

> The obvious downside to this is that the $rootScope-bound event listener will not automatically unbind itself when the directive scope is destroyed. Therefore, if your directive is ever destroyed, you have to be sure to explicitly unbind the event handler; otherwise, it will just stick around forever, causing a memory leak at best and unexpected behavior at worst.
> http://www.bennadel.com/blog/2807-using-rootscope-emit-as-a-performance-optimization-in-angularjs.htm

<br>

> $rootScope.$emit only lets other $rootScope listeners catch it.
> http://stackoverflow.com/questions/26752030/rootscope-broadcast-vs-scope-emit

```
app.controller('ParentCtrl',
  function ParentCtrl ($scope) {

  // $rootScope $on
  var myListener = $rootScope.$on('child', function (event, data) {
    //
  });

  // $scope $destroy
  $scope.$on('$destroy', myListener);

});
```

https://toddmotto.com/all-about-angulars-emit-broadcast-on-publish-subscribing/
