## single field

```javascript
resetAdvancedFilters(){
        const fields = ['my','fields','do','reset','properly']
        for (var i = 0; i < fields.length; i++) {
            this.props.dispatch(change('formName',fields[i],null))
            this.props.dispatch(untouch('formName',fields[i]))
        }
    }
```

- https://stackoverflow.com/questions/37189881/how-to-clear-some-fields-in-form-redux-form
- https://github.com/erikras/redux-form/blob/master/docs/faq/HowToClear.md