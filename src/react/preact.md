For many codebases, Preact can be use simple as:

`npm i -S preact preact-compat`

then add this to webpack config:

```json
{
    "resolve": {
    "alias": {
        "react": "preact-compat",
        "react-dom": "preact-compat"
    }
    }
}
```

testing: We saw no problems with Mocha & Enzyme, can't comment on Jest.
reply

- https://preactjs.com/guide/switching-to-preact
- https://news.ycombinator.com/item?id=15050841


