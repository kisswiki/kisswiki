# Angular select

## From array

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

- https://jsfiddle.net/mrajcok/4mqFJ/
- ng-init didn't work for me http://stackoverflow.com/questions/18194255/how-to-have-a-default-option-in-select-box-angular-js
- A lot info about select http://stackoverflow.com/questions/13047923/working-with-select-using-angulars-ng-options
