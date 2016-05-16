 - http://stackoverflow.com/questions/17510962/can-angularjs-routes-have-optional-parameter-values
 - http://stackoverflow.com/questions/11534710/angularjs-how-to-use-routeparams-in-generating-the-templateurl
 - http://stackoverflow.com/questions/12524533/can-angularjs-routes-have-default-parameter-values
 - `$route.current.params` http://stackoverflow.com/questions/12524533/can-angularjs-routes-have-default-parameter-values/27279054#27279054
 - `<a href="Book/Gatsby/ch/4?key=value">Gatsby: Ch4</a>` https://docs.angularjs.org/api/ngRoute/service/$route
- Change path without reloading https://github.com/anglibs/angular-location-update http://stackoverflow.com/questions/14974271/can-you-change-a-path-without-reloading-the-controller-in-angularjs/31963975#31963975
  - Update: there is a problem with this approach. When I click another link, the site didn't reload because of this code:

    ```javascript
      $rootScope.$on('$locationChangeSuccess', function () {
        if (routeToKeep) {
          $route.current = routeToKeep;
          routeToKeep = null;
        }
      });
    ```
- reloadOnSearch -> reloadOnlyOnSearchOrHashChange, search everything after `?`: ?key1=value1&key2=value2
- http://weblogs.asp.net/dwahlin/cancelling-route-navigation-in-angularjs
