## inline <b>

```pug
		h1 Welcome to your new #[b home!]

        h5: b Personalize your appearance
```

## angular and async

```
  div(*ngIf="(teams$ | async) as teams")
    div(*ngFor="let team of teams")
      | team: {{ team | json }}
  div(*ngFor="let team of teams$ | async")
    | team: {{ team | json }}
```
