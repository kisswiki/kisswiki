- https://github.com/krisajenkins/remotedata
- http://blog.jenkster.com/2016/06/how-elm-slays-a-ui-antipattern.html

## port data

anyone got/seen an example of using krisajenkins/remotedata with port data?

Sadly you can’t send custom datatypes over ports, so it’s not straightforward. What can you do though is set up a couple of ports for the success & error cases, and then combine them using something like:

```elm
port authError : (Error -> msg) -> Sub msg

port authStateChanged : (Maybe User -> msg) -> Sub msg

authResponse : Sub (RemoteData Error User)
authResponse =
    Sub.batch
        [ authError Failure
        , authStateChanged (maybe NotAsked Success)
        ]
```

https://elmlang.slack.com/archives/general/p1484067654012705
