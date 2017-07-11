```
server.on('request-error', function (request, err) {
  //logs the object
  server.log('error', err);

  //logs the view compiler error line number and details
  server.log('error', err.toString()); 
});
```

https://stackoverflow.com/questions/30158038/how-do-i-output-view-compiler-errors-generated-from-hapi-js-views/30158326#30158326
