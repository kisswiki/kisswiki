> We expect that at early stages, many people will “eject” for one reason or another, but as we learn from them, we will make the default setup more and more compelling while still providing no configuration.
>
>-- https://facebook.github.io/react/blog/2016/07/22/create-apps-with-no-configuration.html

- to start your new project, double click on the start task in the npm tasks tool window to run it https://blog.jetbrains.com/webstorm/2016/09/webstorm-2016-3-eap-163-4396/

## eslint in Webstorm

When using npm3, what is needed is to add to `package.json`:

```json
{
  // ...
  "eslintConfig": {
    "extends": "react-app"
  }
}
```

- https://github.com/facebookincubator/create-react-app/blob/master/packages/react-scripts/template/README.md#displaying-lint-output-in-the-editor
- http://stackoverflow.com/questions/38750509/using-create-react-app-and-sublimelinter-eslint-together

>>Worth highlighting that #149 requires the IDE to have the same eslint plugins since it's not using the embedded copy of eslint within react-scripts.
>
>This is probably an issue only with npm 2 so I think we can live with this (and warn about it somewhere). npm 3 should just work.
>
>-- https://github.com/facebookincubator/create-react-app/issues/124#issuecomment-234770443
