One of the problems of explaining how to work with RouteReuseStrategy is showing a very basic example. The provided code often does not work in a real application with extensive use of routes and lazy loaded modules. The source of the problem - using route.routeConfig.path as a key to store DetachedRouteHandle(s). Look for example sticky-routes-in-angular-2-3-with-routereusestrategy:

```typescript
store(route: ActivatedRouteSnapshot, handle: DetachedRouteHandle): void {
    this.handlers[route.routeConfig.path] = handle;
}
```

This will work only in a simple application. But if you have modules being lazy loaded with own routing like the following:

```typescript
const routes: Routes = [{ path: "", component: MyLazyLoadedComponent }];
```

the shouldAttach method will get a route where route.routeConfig.path is an empty string.

Some sources suggest to define a key in a route file:

```typescript
{ path: '', component: CompanyComponent, children: [
    {path: '', component: CompanyListComponent, data: {key: "company"}},
    {path: ':companyID', component: CompanyDetailComponent},
]}
```

Then in a custom strategy class implementing RouteReuseStrategy use the key:

```typescript
store(route: ActivatedRouteSnapshot, handle: DetachedRouteHandle): void {
    this.storedRouteHandles.set(route.data["key"], handle);
}
```

I found another way - define a getKey method in the custom strategy class and use it in all methods:

```typescript
private getKey(route: ActivatedRouteSnapshot): string {
	return route.pathFromRoot
		.map((el: ActivatedRouteSnapshot) => el.routeConfig ? el.routeConfig.path : '')
		.filter(str => str.length > 0)
		.join('');
}
```

```typescript
store(route: ActivatedRouteSnapshot, handle: DetachedRouteHandle): void {
    this.handlers[this.getKey(route)] = handle;
}
```

- https://github.com/angular/angular/issues/16713#issuecomment-439409349
- https://medium.com/@timofeybm/3-methods-to-save-catalogue-state-and-scroll-position-in-angular-1a46ae4eadca
- https://github.com/piyalidas10/Angular-RouteReuseStrategy
