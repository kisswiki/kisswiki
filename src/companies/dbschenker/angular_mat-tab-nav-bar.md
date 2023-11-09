```html
## How it works
<nav mat-tab-nav-bar>
  <a
    *ngFor="let device of devices$ | async"
    [routerLink]="device.getIp()"
    routerLinkActive
    #rla="routerLinkActive"
    mat-tab-link
    [active]="rla.isActive"
  >
  </a>
</nav>
<router-outlet></router-outlet>
```

Each `<a>` tag will have the `mat-tab-link` directive that connects it to `mat-tab-nav-bar`, and also styles the button, but it needs an input (boolean) that will set it as active or inactive, hence the `[active]` input.
Documentation for it here:
https://material.angular.io/components/tabs/examples

Now you need to know how to mark it as active, so `[routerLink]` input will set the route that link is pointing at, and the `routerLinkActive` is a directive that will tell whether that route is active or not.
Check the API here:
https://angular.io/api/router/RouterLinkActive

So what you are doing in your code is, you are assigning that `routerLinkActive` directive instance to a variable named `rla` with this `#rla="routerLinkActive"`, then you can access to the `isActive` property, so you set the input `[active]` of `mat-tab-link` to the property in the `rla` directive instance with `[active]="rla.isActive"`. No need to handle any of that in the ts file.

- https://stackoverflow.com/questions/58981617/set-active-tab-for-angular-mat-tab-nav-bar/58982643#58982643

## subroute active

You have to define `[routerLinkActiveOptions]="{ exact: true }"` to make the difference between `/productsList` and `/productsList/product`:

```html
<a
  class="list-group-item list-group-item-action"
  [routerLink]="['/productsList']"
  routerLinkActive="active"
  [routerLinkActiveOptions]="{ exact: true }"
  >not sad</a
>
```

- https://stackoverflow.com/questions/53921214/angular-routerlinkactive-with-nested-routes/53921288#53921288
- https://stackoverflow.com/questions/55587975/routerlinkactive-route-for-child-and-parent/61265866#61265866
- https://stackoverflow.com/questions/46853765/routerlinkactive-on-children-routes-all-false
