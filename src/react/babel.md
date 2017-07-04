## React.createClass and React.PropTypes has been deprecated in v15.5

https://stackoverflow.com/questions/43289348/disable-react-createclass-and-proptypes-deprecated-warnings-in-babel-react-prese/43295007#43295007

## Unknown option react. js.Children

`npm i -D babel-preset-react`

https://stackoverflow.com/questions/33739933/webpack-babel-react-build-error-unknown-option-foo-node-modules-react-rea/33754851#33754851

## Order is important

This

```
{
  "env": {
    "development": {
      "presets": [
        "es2015",
        "react",
        "stage-0"
      ]
    }
  }
}
```

and not this

```
{
  "env": {
    "development": {
      "presets": [
        "stage-0",
        "es2015",
        "react"
      ]
    }
  }
}
```