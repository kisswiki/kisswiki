```html
<input [(ngModel)]="username" />

<p>Hello {{username}}!</p>
```

```html
<input [value]="username" (input)="username = $event.target.value" />

<p>Hello {{username}}!</p>
```

```html
<input [ngModel]="username" (ngModelChange)="username = $event" />

<p>Hello {{username}}!</p>
```

`username` is class property. It sets underlaying value of component when using `[ngModel]="username"`.

To set `username` to underlaying event emiting value, use `(ngModel)="username"`

Or combine both using `[(ngModel)]="username"`

- https://blog.thoughtram.io/angular/2016/10/13/two-way-data-binding-in-angular-2.html
  - https://web.archive.org/web/20211123043329/https://blog.thoughtram.io/angular/2016/10/13/two-way-data-binding-in-angular-2.html
