## Use

- arturopala/elm-monocle
- etaque/elm-response
- lukewestby/elm-http-builder
- krisajenkins/formatting
- rtfeldman/elm-css
- Fresheyeball/elm-return
  - http://mutanatum.com/posts/2016-09-18-Return.html

## make impossible states impossible

- https://medium.com/@wintvelt/how-to-make-impossible-states-impossible-c12a07e907b5

## remote data

- krisajenkins/remotedata
- "Beyond Hello World and Todo Lists" by Ossi Hanhinen https://youtu.be/vpc80c5iC6k?list=PLglJM3BYAMPH2zuz1nbKHQyeawE4SN0Cd&t=969
- http://www.mechanicaldruid.com/update-to-input-tracking-in-elm/

## Read

- http://blog.jenkster.com/2016/11/type-bombs-in-elm.html
- http://blog.jenkster.com/
- https://github.com/krisajenkins?tab=repositories

## return

- http://mutanatum.com/posts/2016-09-18-Return.html
  - https://www.reddit.com/r/elm/comments/5b88n3/the_return_monad/
- http://package.elm-lang.org/packages/Fresheyeball/elm-return
- https://toast.al/posts/2016-10-20-optical-swordplay-with-components.html
  - when update defined as `update msg =` init application with `init = Return.singleton initModel` or `init = initModel >> Return.singleton`
    - https://github.com/toastal/favicon-swapper/blob/master/src/popup/Ui.elm
    - https://github.com/slopyjoe/elm-build-monitor/blob/master/src/Main.elm

## optics

http://package.elm-lang.org/packages/toastal/return-optics/latest

jadams:

about to try playing with Return.Optics

@toastal:

have you been using `Return`? It’s like the one library I need for sanity’s sake

@jadams:

I haven't. I should perhaps gradually ratchet my way up to `Return.Optics`

@toastal:

The author made a post about it http://mutanatum.com/posts/2016-09-18-Return.html

@jadams:

I've used return optics everywhere in my app. I totally dig it but I'm not looking forward to explaining it to some juniors

## prisms

https://toast.al/posts/2017-01-13-playing-with-prisms-for-the-not-so-isomorphic.html
