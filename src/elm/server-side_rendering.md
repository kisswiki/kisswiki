- https://github.com/rupertlssmith/elm-java
- https://github.com/eeue56/elm-server-side-renderer
- https://github.com/eeue56/elm-static-html
- https://github.com/CaronaBoard/caronaboard/pull/18
  - Implemented with https://www.npmjs.com/package/elm-static-html
- https://github.com/noredink/take-home#support-summary

## Update

jenmei: I see that server  side rendering doesn't seem to be an issue. What's at issue is rendering server side in such a way as to compatible w/ virtual dom updates. E.g. render something on the server that can be updated (instead of replaced) by the Elm app that runs on the browser.

eeue56: when elm is bootstrapped, just have it render into `elm-host` and swap the real dom out for the virtual one

jenmei: In the case that the server-rendered dom includes a form field, and the user starts typing into the form field as the JS is being loaded and then executes, would the form field remain what the user typed though? Or would it be replaced? My understanding is that it would get replaced.

eeue56: replaced, but the time-to-first-render is so low that i'd be surprised if they managed to type anything before it loaded

obviously, if you care about that, then you're going to have to setup JS to handle that

check out this: http://noredink.com/

The login button is in elm

it's loaded in the way I suggested
