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

## security

from a technical point of view it isn't as secure as react and also isn't as developer friendly. It's 3kb gzipped for a reason. It skips out on alot of security code and doesn't have the developer friendly error/warning layer that react has.

curious it you considered adding $$typeof safety check to Preact? Should make it safer, and very little bytes.

https://www.reddit.com/r/programming/comments/6v3nau/facebook_wont_change_reactjs_license_despite/dlylq7r/

