- https://webpack.js.org/plugins/define-plugin
- https://stackoverflow.com/questions/30835213/react-from-npm-cannot-be-used-on-the-client-because-development-is-not-defined
- https://stackoverflow.com/questions/30030031/passing-environment-dependent-variables-in-webpack

remember to restart webpack after adding var!!!

You may need to add it to `.eslintrc`:

```
{
  "globals": {
    "__STRIPE_API_KEY__": "",
  }
}
```