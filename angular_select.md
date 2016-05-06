

```
<div ng-controller="MyCtrl">
  <select ng-model="model" ng-options="year for year in years"></select>
    <p ng-bind="model"></p>
</div>

function MyCtrl($scope) {
    $scope.model = 2012;
    $scope.years = [2012, 2013, 2014];
}
```
