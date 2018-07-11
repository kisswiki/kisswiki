- https://github.com/krisajenkins/remotedata
- http://blog.jenkster.com/2016/06/how-elm-slays-a-ui-antipattern.html
- http://holko.pl/2016/06/09/data-state-as-an-enum/
  - http://scotthurff.com/posts/why-your-user-interface-is-awkward-youre-ignoring-the-ui-stack
- Add `Refreshing` constructor to `RemoteData` ? https://github.com/krisajenkins/remotedata/issues/9
- rtfeldman talk on http://2018.elmeurope.org with `LoadedOne Doc` https://youtu.be/MlyGg-DIqnU?t=3518 when version of doc loaded locally was competing with remote.

## example

ChuckDuck22:
 
I gave a talk on union types at a local meetup and came up with this RemoteData example as a demonstration of their value.

Before - without RemoteData https://ellie-app.com/wvpRRNSpJ3a1/2

After - using RemoteData https://ellie-app.com/wvrJJFjWzGa1/0

https://www.reddit.com/r/elm/comments/66jz2b/where_can_i_find_more_info_regarding_a_zip_list/

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


## Is elm-web-data in any way related to https://github.com/krisajenkins/remotedata?

ohanhi: Mine is much more opinionated though, and comes with a Http module, whereas Kris' has lots more helpers for transforming the type
