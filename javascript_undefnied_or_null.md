> You'll get an error if you access an undefined variable in any context other than typeof
> http://stackoverflow.com/questions/2559318/how-to-check-for-an-undefined-or-null-variable-in-javascript

`typeof(some_variable) !== "undefined" && some_variable !== null`
