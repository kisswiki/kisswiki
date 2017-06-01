## No default engine was specified and no extension was provided

The res.render stuff will throw an error, if you're not using a view engine.

If you just want to serve json replace the `res.render('error', { error: err });` lines in your code with:

`res.json({ error: err })`

Comment out the res.render lines in your code and add in next(err); instead. If you're not using a view engine, the res.render stuff will throw an error.

https://stackoverflow.com/questions/23595282/error-no-default-engine-was-specified-and-no-extension-was-provided
