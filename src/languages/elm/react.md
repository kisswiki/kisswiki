- https://kevgathuku.me/2017/05/24/how-to-introduce-elm-to-a-react-codebase/
- for react-0.16 https://blog.boon.gl/2017/11/28/react-elm-wrapper.html
  - https://github.com/evancz/react-elm-components/issues/18

##

I actually found out that leaking stuff is not necessarily specific to multiple elm apps on the page, but more to reinitializing elm modules(calling Elm.<Module>.embed/fullscreen()). This can happen for example when using react-elm-components and mounting the component multiple times (i.e. by navigating to a part of the page where the component isn't shown and then back to where it is) if subscriptions are used without reloading the page.

https://github.com/elm-lang/core/issues/886#issuecomment-317129287