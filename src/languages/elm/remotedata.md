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

## Loading state

I cannot get `Loading` state.

I am using big delay:

```elm
submitIdentityGenerateChi : String -> (RemoteData.RemoteData Http.Error Credentials -> msg) -> Cmd msg
submitIdentityGenerateChi identityName msg =
    Http.post
        --{ url = "http://localhost:8081/v1/identityGenerateChi"
        { url = "https://www.mocky.io/v2/5185415ba171ea3a00704eed?mocky-delay=40000ms"
        , body = Http.jsonBody (E.string identityName)
        , expect = expectJson_ (RemoteData.fromResult >> msg) D.string
        }
```

In https://elmprogramming.com/remote-data.html it says:

>You’ll see a table containing posts immediately after clicking the Get data from server button. Although the HTTP request transitions to Loading state after the button is clicked, we don’t see Loading... on the page. For that text to appear, we need to make our server wait a couple of seconds before returning a response.

But elmprogramming is based on elm version.

And got this:

<pre>
Sadly, you're right. This is a limitation of elm-http - each of its calls can only yield one event. Ideally, it could produce Loading immediately, and then Success a (or Failure e) on completion. IIRC that was possible in earlier versions of Elm/elm-http, but not any more.

It might be possible with tasks, but I believe that would involve creating a whole new http library at a lower level.

(It's sort of possible with Http.Progress, but in practice it's not very useful unless your time to first byte is very short, but your time to last byte is very long.)

In the meantime, your only option is to do something like:

`   ( { model | somedata = Loading }, getNews )`
</pre>

https://github.com/krisajenkins/remotedata/issues/16#issuecomment-319793213

## Progress state

- [Add progress data to Loading state · Issue #25 · krisajenkins/remotedata](https://github.com/krisajenkins/remotedata/issues/25)
