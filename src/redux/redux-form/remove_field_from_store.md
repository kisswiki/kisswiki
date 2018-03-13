This doesn't work:

```javascript
this.props.change('myNoLongerNeededField', undefined)
```

Possible solution:

>We resolved this very simply by using the FieldArray component. It helped deal with our variable-length field sets without us having to add anything outside of the normal implementation. https://github.com/erikras/redux-form/issues/2325#issuecomment-290070731