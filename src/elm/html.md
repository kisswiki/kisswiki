- can't take List (Html Action) https://github.com/elm-lang/html/issues/84

## unregister event

https://elmlang.slack.com/archives/general/p1484525820015002

@aion:

it is possible to unregister an event in elm? we register one with onClick for example - but can we remove it form the element at some latter point in time?

@opsb:

You would just change the output of your view function to not include the onClick. The vdom will take care of unregistering it.
