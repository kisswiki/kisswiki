## Limit number of checkboxes to check

```html
<div ng-app="MyApp" ng-controller="MyController">
    <input ng-repeat="item in items" type="checkbox" ng-init="intem.winner=false" ng-model="item.winner" ng-change="checkChanged(item)" ng-disabled="checked==limit && !item.winner"/>
</div>
```

```javascript
var MyApp = angular.module("MyApp", []);
MyApp.controller("MyController", function ($scope) {
    $scope.items = [];
    $scope.limit = 2;
    $scope.checked = 0;
    for(var i=0;i<3;i++){
        $scope.items.push({});
    }
    $scope.checkChanged = function(item){
        if(item.winner) $scope.checked++;
        else $scope.checked--;
    }
});
```

http://stackoverflow.com/questions/23875480/angularjs-how-to-disable-checkboxes-after-specified-amount-is-selected/23875663#23875663
