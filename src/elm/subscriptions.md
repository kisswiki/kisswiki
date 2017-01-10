> In Elm, using subscriptions is how your application can listen for external input. Some examples are:
> - Keyboard events
> - Mouse movements
> - Browser locations changes
> - Websocket events
> -- https://www.elm-tutorial.org/en/03-subs-cmds/01-subs.html

## events

>It just clicked for me that `subscriptions` is adding and removing listeners under the hood based on the model.  Now I can remove a bunch of logic from elsewhere in my app

```elm
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Sub.map ChildLocationFormMsg <| LocationForm.subscriptions model.locationForm
        , Sub.map ChildPriceFormMsg <| PriceForm.subscriptions model.priceForm
        , case model.currentStep of
            -- We need to start polling order status when the form has been sent.
            -- Once a runner accepts the task, the currentStep will change, so we stop polling.
            -- We also stop polling after 3 minutes.
            AwaitRunner count ->
                Sub.batch
                    [ Time.every (3 * Time.second) (always PollOrderStatus)
                    , Time.every Time.second (always <| PollOrderDuration <| count - 1)
                    ]
            _ ->
                Sub.none
        ]
```

https://elmlang.slack.com/archives/general/p1484066352012699
