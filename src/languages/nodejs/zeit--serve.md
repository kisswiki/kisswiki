```bash
$ cat serve.json
{
  "headers": [
    { "source" : "**/*.@(jpg|jpeg|gif|png|txt)"
    , "headers" :
        [{ "key" : "Access-Control-Allow-Origin"
         , "value" : "*"
         }
        ,{ "key" : "Access-Control-Allow-Headers"
         , "value" : "Origin, X-Requested-With, Content-Type, Accept, Range"
         }
        ]
    }
  ]
}

$ serve
INFO: Discovered configuration in `serve.json`
INFO: Accepting connections at http://localhost:5000
```

- https://github.com/zeit/serve-handler#headers-array
- https://github.com/zeit/serve/issues/389#issuecomment-393223468
- https://github.com/zeit/serve/commit/0919187a3ae33ee59bc47f78db82e1ef851a94cd

## Port

`serve -l 5001`

https://github.com/zeit/serve/issues/425#issuecomment-415010902
