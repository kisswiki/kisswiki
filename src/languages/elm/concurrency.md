update in update, not in view:

>Views will only be updated when the model changes and the browsers triggers a redraw. In most cases, after the model is updated the view will be recalculated somewhere within the next 1/60th of a second. The issue that you see in your example comes when the timer fires and the user also clicks the button inside of that window. Your view ends up using an old model to compute the update. The simplest way to mitigate this is to never rely on the model in the view function to calculate updates. Instead create an increment action and do the calculation in your update function.

https://discourse.elm-lang.org/t/concurrency-and-the-elm-architecture/1159/2

```elm
        button
            [ onClick <| SetClick (racyCount + 1) ]
            [ text "increment" ]
```


```elm
        IncrementClick ->
            { racyCount = racyCount + 1
            , controlCount = controlCount + 1
            , autoclick = autoclick
            }
            --...
        button
            [ onClick <| IncrementClick ]
            [ text "increment" ]
```

