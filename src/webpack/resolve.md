For me this happened because in my entry object I wrote:

```
app: path.resolve(__dirname, '/test.js'),
```

While I should have written one of these:

```
app: path.join(__dirname, '/test.js'),
app: path.join(__dirname, 'test.js'),
app: path.resolve(__dirname, 'test.js'),
```

The problem was that path.resolve will ignore any parameters given to it before the last parameter that starts with a `/`.

So `path.resolve(__dirname, '/test.js')`, will return `/test.js` instead of `/path/of/your/project/directory/test.js`.

https://github.com/webpack/webpack/issues/223#issuecomment-283664882
