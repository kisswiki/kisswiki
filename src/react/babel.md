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

## babelify before envify/localenvify

>inverting envify and babelify order it works

https://github.com/babel/babelify/issues/185#issuecomment-189695102

## babel-preset-env and webpack

>So in the other issue we decided not to include any stage features by default and leave that up to the stage-x presets. It's not a part of ecmascript yet so was thinking it should be opt in I'd that makes sense. https://github.com/babel/babel-preset-env/issues/49#issuecomment-261796431

```
        query: {
          presets: [
            ['env', {
              targets: {
                browsers: ['last 2 versions']
              }
            }],
            'react',
          ],
          plugins: [
            ['transform-object-rest-spread',
              {
                useBuiltIns: true
              }
            ],
          ]
        }
```



