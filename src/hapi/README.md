## Static

```javascript
server.route({  
  method: 'GET',
  path: '/js/{file*}',
  handler: {
    directory: { 
      path: 'public/js'
    }
  }
})
```

https://futurestud.io/tutorials/hapi-how-to-serve-static-files-images-js-etc