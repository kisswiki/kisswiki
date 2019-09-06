- search documentation http://klaftertief.github.io/elm-search/?q=!
- always: `\_ -> sth` https://www.reddit.com/r/elm/comments/3q8fxy/what_is_always/
- http://stackoverflow.com/questions/37363294/what-does-a-function-with-2-values-on-the-right-side-mean-model-html-msg
- nesting http://stackoverflow.com/questions/37328203/elm-0-17-how-to-subscribe-to-sibling-nested-component-changes
- http://package.elm-lang.org/packages/krisajenkins/elm-exts/latest/

## about

- https://speakerdeck.com/jose_zap/stepping-out-of-the-chaos-with-elm

> I really wish I would have invented Elm
>
> Here are some things that I really wish wouldn't have happened in Elm:
>
- Signals only first-order
- Signals removed
- Update function returns tuple of Model and Cmd (it mixes concerns)
- Type classes not yet supported
- Comma-first convention (I prefer something like Coffeescript or Python)
> -- André Staltz https://github.com/staltz/ama/issues/3

<br>  

> - Optimizing Elm only touches view code, unlike everyone else.
> - Optimizing Elm cannot introduce sneaky bugs, unlike everyone else.
> - These results should generalize to apps of any size.
Also interesting is how Elm's immutability allows it to use requestAnimationFrame by default, which plain vanilla JS libs can't use by default.
> -- https://news.ycombinator.com/item?id=12392114

<br>

> Elm's goal of figuring out how to simplify and distill the Haskell and ML world's abstractions is an admirable one
> -- https://news.ycombinator.com/item?id=10838239

<br>

> Elm is an exploration of how much power you can get with how small a subset of Haskell and the answer seems to be quite a lot.
> Elm beginners can create good code accidentally
> -- https://groups.google.com/forum/#!msg/elm-discuss/NKFxMyPHBoY/FtMfD2Z5AwAJ

- One thing that has really driven the attention and the adoption of Elm is that it emphasizes simplicity and ease of use in a way that rocks the boat a bit within the existing functional programming community. I’m consistently looking for ways to reduce the learning curve. - Evan Czaplicki https://www.seas.harvard.edu/blog/2015/10/alumni-profile-evan-czaplicki-ab-12
- What differentiate Elm? You may thought its: Haskell syntax, FRP, running in Browser. But these can have any language. Elm differentiates:
  - All mutable state is in the signal graph (foldp)
  - All events enter via the signal graph (elm.notify) - called global event dispatcher
  - External state is provided by single-purpose high-level APIs (Time.fps)  
  [yt > Bret Victor style reactive debugging ‒ Laszlo Pandy](https://youtu.be/lK0vph1zR8s)
- With Elm you're really getting into new (if you have a "typical" HTML/JS frontend dev background) territory. It's a different way to do (and think of) GUI development. You will write in a completely new language – made specifically for creating GUIs in a functional reactive programming way – and ideally you'll never deal (at least not directly) with any of the traditional DOM APIs. Elm comes with a sort of "standard library" that gives you tools to create and manipulate graphics/text/etc through time.  

  Your Elm language code will describe, in a totally declarative way, what you want your GUI to look and behave like as time goes by and events (user input, etc) occur. Then, it will compile it all to HTML/JS/CSS in order that runs on the browser.  
  http://stackoverflow.com/questions/15490053/what-are-the-advantages-and-disadvantages-of-angular-js-vs-elm/15531171#15531171
- https://www.reddit.com/r/haskell/comments/rkyoa/my_thesis_is_finally_complete_elm_concurrent_frp/

>Do you require an industry standard platform, extensive libraries with strong security guarantees, a great selection of developers highly-experienced in it, competetive paid consultency firms, and many examples of enterprise adoption? You get none of that from Elm.
>
>More generally, there are quite a few things which are difficult to do in Elm, such as DOM querying. There are plenty of serious holes in the community libraries which may leave certain teams or projects unsatisfied.
>
>Elm is a work in progress, but it is still extremely capable at making a wide variety of things, just not everything for everybody.
>
>-- https://www.reddit.com/r/elm/comments/5dox3b/reddit_uses_elm_for_internal_apps/da6cyu9/


Elm provides type safety, immutable data structures, and state management in a very compact but readable way.

Elm has developed a mature ecosystem in many ways, in a relatively short space of time, and two of the main reasons for that are the purity and the way the JS interop works. It explicitly shields the Elm world from issues in JS.

https://news.ycombinator.com/item?id=17143494

## errors

- [A set of Elm programs to trigger every possible error message](https://github.com/elm-lang/error-message-catalog)
- Error: Unable to get ... Failed reading: satisfy: `rm -rf ~/AppData/Roaming/elm/package/<author>/<package>`. Should be fixed in elm-0.17.1 https://github.com/elm-lang/elm-package/issues/164

## usages/examples/packages/libraries

- core libraries https://github.com/elm-lang/core
  - default imports: Basics, Debug, List, Maybe, Result, Signal
- https://github.com/trending?l=elm&since=daily
- [packages](http://package.elm-lang.org)
  - `elm package install evancz/elm-html`
  - http://package.elm-lang.org/packages/evancz/elm-html/latest
  - http://package.elm-lang.org/packages/elm-community/elm-undo-redo/latest
  - http://package.elm-lang.org/packages/etaque/elm-route-parser/latest
- http://builtwithelm.co/
- https://github.com/odedw/elm-plane
- https://www.reddit.com/r/elm/comments/3wa0pb/how_to_make_a_full_website_in_elm/
- https://www.reddit.com/r/elm/comments/3vs52d/looking_for_elm_crud_example/
- http://elm-lang.org/examples
- https://github.com/evancz/TodoFRP
- https://github.com/twopoint718/elmchat
  - http://bendyworks.com/elm-frontend-right-now/
- https://github.com/eeue56/elm-all-dict
- https://github.com/Fresheyeball/elm-node
- https://github.com/mgold/elm-date-format
- https://github.com/eeue56/elm-query
- http://elm-lang.org/examples/resize-yogi
- Google Maps https://github.com/vilterp/elm-gmaps-experiment
- effects like HTTP and animation https://github.com/evancz/elm-effects
- https://github.com/jvoigtlaender/elm-drag-and-drop
- https://github.com/elm-community/builtwithelm
- https://github.com/elm-community/elm-linear-algebra
- https://github.com/elm-community/elm-history
- https://github.com/elm-community/elm-material-icons
- https://github.com/elm-community/elm-undo-redo
- https://github.com/johnpmayer/vec2
- https://github.com/ohanhi/elm-html-drag-and-drop
- https://github.com/mgold/elm-socketio
- https://github.com/mgold/elm-turtle-graphics
- https://swendude.github.io/Tortoise/
  - https://twitter.com/Swendude/status/1016235757332238338
- https://github.com/mgold/elm-multiset
- https://github.com/NoRedInk/elm-lazy-list
- https://github.com/mgold/elm-join
- https://github.com/grzegorzbalcerek/Preselm
- https://www.reddit.com/r/elm/comments/41b0e3/a_more_readable_elm_task_example/

## audio

- https://github.com/search?l=elm&q=audio&type=Repositories&utf8=%E2%9C%93
- https://github.com/bmatcuk/elm-webaudio

## tools

- https://github.com/elm-lang/elm-reactor
  - Install Elm Platform. This will install Elm Reactor and everything else it needs.
    - `npm install -g elm` or binaries
- It is inspired by the popular gofmt https://github.com/avh4/elm-format
- Light Table
  - https://github.com/rundis/elm-light
  - http://rundis.github.io/blog/2016/elm_light_package.html
- https://maximilianhoffmann.com/posts/how-to-compile-elm-files-on-save

## quotes

- First The Elm Architecture in React, now Flow follows Elm's UX lead! [source](https://twitter.com/rtfeldman/status/673680421545107456)
- Elm's hidden agenda - to subtly spoil us with the idea of declarative programming for building GUIs [source](https://speakerdeck.com/suvash/getting-reactive-with-elm)
- 100% typed code (with @elmlang) is orders of magnitude better than 95% typed code (with TypeScript or Flow). Elm eliminates runtime errors. [source](https://twitter.com/andrestaltz/status/681186227039678465)

## community/news/blogs

- http://elm-lang.org/blog
- http://elm-lang.org/community (mailing list, reddit, slack, irc, twitter)
- https://www.quora.com/topic/Elm-programming-language
- http://mbylstra.github.io/elm-events/
- https://github.com/Gizra/planet-elm
- https://www.reddit.com/user/wheatBread Evan Czaplicki on reddit
- http://stackoverflow.com/questions/tagged/elm

## jsfiddle/jsbin/codepen alike

- http://share-elm.com/
- http://elm-lang.org/try

## isomorphic / server-side rendering

- https://groups.google.com/forum/#!topic/elm-discuss/cSNfNK4w8Ow
- https://github.com/elm/compiler/issues/1150
- https://github.com/eeue56/servelm
- I think you may want to check https://github.com/NoRedInk/take-home#support-summary. Note the item "Server-side rendered client-side HTML". https://github.com/elm/compiler/issues/1113#issuecomment-218251181
- https://groups.google.com/forum/#!topic/elm-discuss/SFIC-yuHTI8
  - https://github.com/laszlopandy/elm-console
  - https://github.com/ElmCast/elm-node

## ports

- Ports are essentially strictly typed event streams to listen to (Elm to JS) or to push events into (JS to Elm). This means you will need to write some boilerplate-ish code, both in Elm and in JavaScript, in order to pass a message to the other side. So the more JavaScript libraries you need, and the more different kinds of objects you want to pass through, the more boilerplate code you will end up with. http://futurice.com/blog/elm-in-the-real-world
- https://www.reddit.com/r/elm/comments/401qtb/startapp_and_the_redirect_port/
- pros/cons
  - cons
    - creating a DOM element from elm-html, initializing a widget into that element in JS, then talking to it with ports breaks Elm's semantics pretty badly https://groups.google.com/forum/#!topic/elm-dev/2j1c5HIBqRM
- Richard Feldman - Workshop: Growing the Oasis: Elm in Production http://www.ustream.tv/recorded/64191291

## truth

- https://twitter.com/twopoint718/status/686765116285583360

## repl

- add space in new line to indent when using `\` like in `over9000 powerLevel = \` [1](http://elm-lang.org/guide/core-language) [2](https://github.com/elm-lang/elm-repl/issues/67)

## function

- example

  ```elm
  over9000 powerLevel =
  if powerLevel > 9000 then "upps 9000" else "meh"
  -- I can't just run function without taking its output
  -- over9000 9001

  a : String
  a = over9000 9001
  ```
- what is this `add : Int -> Int -> Int`
  - this is a function that takes one integer as argument and returns another function. This returned function takes another integer and returns an integer. https://sporto.gitbooks.io/web-apps-with-elm/content/foundations/functions.html
  - The type annotation says: given a Float and a Ship, I will return a Ship, but also: given a Float, I will return Ship -> Ship. For example, (applyPhysics 16.7) would actually return a working function to which we can pass a Ship, and get the physics-applied ship as the return value. This property is called Currying and all Elm functions automatically behave this way. https://gist.github.com/ohanhi/0d3d83cf3f0d7bbea9db
- generic with type variables `a -> Array a`
  - what is `a` in `indexOf: a -> Array a -> Int` - this function takes any type and an array of that same type and returns an integer https://sporto.gitbooks.io/web-apps-with-elm/content/foundations/more_on_functions.html

## types

- No need to declare type of variable before using it - type inference
- https://www.reddit.com/r/elm/comments/1ush0h/what_is_elm_type_system_based_on/
- https://blog.codecentric.de/en/2015/11/elm-friday-part-06-type-annotations/

## string interpolation

- not done yet https://github.com/elm/compiler/issues/905
- https://github.com/lukewestby/elm-string-interpolate

## import

- two ways
  - `import StartApp.Simple as StartApp` and then `StartUp.start`
  - `import StartApp.Simple exposing(start)` and then `start`

## Evan Czaplicki joined noredink http://elm-lang.org/blog/new-adventures-for-elm http://tech.noredink.com/post/136615783598/welcome-evan

## companies using elm

- the companies using Elm (5+ now) are not sharing their stuff on there, but I'm going to be working on a series showcasing them! https://twitter.com/czaplic/status/677035150773903361
- https://groups.google.com/forum/#!topic/elm-discuss/3bgQlAeJpbc
- http://elm-lang.org/blog/new-adventures-for-elm
- NoRedInk http://www.google.com/url?q=http%3A%2F%2Fnoredinktech.tumblr.com%2Fpost%2F126978281075%2Fwalkthrough-introducing-elm-to-a-js-web-app&sa=D&sntz=1&usg=AFQjCNFeD-YJYj8l4vjNfdcf-7UANaSqnQ
- CircuitHub
- Prezi
- Gizra http://www.google.com/url?q=http%3A%2F%2Fwww.gizra.com%2Fcontent%2Fthinking-choosing-elm%2F&sa=D&sntz=1&usg=AFQjCNEkcaPSSNNQSMMahrQV_Xli91iwOw
- Beautiful Destinations
- Your CRM Link
- TruQu http://engineering.truqu.com/

## tuple?

- `setError : (Model, Effects Action)` https://github.com/Gizra/elm-hedley/blob/v1.0.0/src/elm/Config/Test.elm#L16

## starter kits

- https://github.com/Gizra/generator-elmlang
- https://github.com/christianalfoni/exploring-elm-boilerplate
  - http://www.christianalfoni.com/articles/2015_11_30_Exploring-Elm-part1
- https://github.com/simonewebdesign/elm-new/tree/master/share/elm-new
- https://github.com/archetypes/elm
- https://github.com/splodingsocks/elm-starter

## node.js

- Get up and running on multi-user Elm applications in a few easy steps! https://github.com/sonnym/elm-expressway
- https://github.com/sonnym/node-elm-loader

## testing

- UNIT TEST AND CI INTEGRATION http://www.gizra.com/content/elm-hedley-overview/
- https://github.com/deadfoxygrandpa/elm-test

## number of spaces to indent https://groups.google.com/forum/#!topic/elm-dev/1fWxZPcQVqI

- most agree to 2 spaces
- and updating record example:

  ```elm
  { particle
    | position = particle.position + particle.velocity
    , velocity = particle.velocity + particle.acceleration
  }
  ```

## webgl

- https://evancz.github.io/first-person-elm/
  - https://github.com/evancz/first-person-elm
- https://github.com/johnpmayer/elm-webgl

## transducers

- https://github.com/avh4/elm-transducers

## modules

- http://boonofcode.svbtle.com/organising-elm-components
- if there's a private Utils module in evancz/focus and in evancz/automaton, the module that wins at runtime depends on what order things were compiled https://github.com/elm/compiler/issues/826

## Entity Component System

- https://groups.google.com/forum/#!topic/elm-discuss/NJCZFIYxshE

## hot reload

- WIP in elm-reactor https://groups.google.com/forum/#!topic/elm-discuss/bY7c8oad1VA https://github.com/elm-lang/elm-reactor/issues/168

## uuid

- https://groups.google.com/forum/#!topic/elm-discuss/jvjstbLdpww

## components/widgets

- The main problem (the way I see it) is that there is no composable widget architecture as of yet. Yes, we do have Elm Architecture and that is great BUT what I think is needed for what you want is "a language for describing component hierarchies."  
  Ideally, it should be a series of functions that make it easy to create and modify a tree like structure that encapsulates this hierarchy.  

  This is notoriously difficult.  
  Evan tried to implement something like that with Graphics.* but failed to produce something viable.  
  https://groups.google.com/forum/#!topic/elm-discuss/tOFOO4uBiNw
- https://github.com/savuori/elm-bs-datepicker

## milestones

- https://github.com/elm/compiler/milestones

## style guide

- https://github.com/ohanhi/elm-style-guide

## jsx

- https://github.com/pzavolinsky/elmx

## What has changed my mind about Elm?

2015-11-25 11:40 AM

https://www.sitepoint.com/react-has-won-the-client-side-war/

Piotr Kopszak: Really? A Elm?

Roman Frolow: Really? Elm? Wszedzie widze react to react tamto. To ze elm jest dla Ciebie super nie znaczy ze bedzie wiodacym frameworkiem (wiem ze react to view)

Kamil Kapsiak: Roman Frolow Really?

Roman Frolow: Ale o co wam chodzi z tym Elm? Moze czegos nie wiem, ale widzac po aktywnosci na githubie:

https://github.com/trending?l=elm&since=monthly

https://github.com/trending?l=javascript&since=monthly (ctrl+f react, ctrl+f redux)

to nie widze jakby elm universum mial zdetronizowac angulara.

I nie chodzi mi o to co jest lepsze tylko co bedzie dominowalo.

James Owca Siemiatkowski: Ale teraz to brzmisz jak fanboy reacta :)

Roman Frolow: ale taki pragmatyczny fanboy: moze i sa lepsze alternatywy ale po co mam na nie tracic czas jak spolecznosc bedzie gdzies indziej.

Roman Frolow: Mieliscie racje :D

Karol Fabjanczuk: Roman Odpowiedz po dwóch latach - szacun

Michal Miszczyszyn: Roman Frolow racje odnosnie czego? Elma? :P Nic sie nie zmienilo raczej, wiec to Ty miales racje.

Roman Frolow: Zmienilo sie tyle ze jest calkiem niezla i prezna spolecznosc i juz widze ze cos nie musi miec najwiekszej popularnosci zeby oplacalo sie w tym pisac.

Ale racja, popularnosc nadal mala. Zobaczymy jak to ruszy po wydaniu 0.19

Karol Fabjanczuk: Michal Czekam z niecierpliwoscia na za dwa lata aby zobaczyc czy tez tu znów skomentujesz ;)

Tomasz Szymanek: "Wiem ze react to view a nie framework" === instant +13 do rispektu na JS News

James Owca Siemiatkowski: Po dwoch latach jest 0.19 ? Oho

Roman Frolow: No jak. Jeszcze nie ma :P

https://www.facebook.com/groups/217169631654737/permalink/974579692580390/



2015-11-19 2:33 PM

Roman Frolow: Co jest bardziej czytelne: jsx czy clojurescript?

clojurescript z https://youtu.be/gsffg5xxFQI?t=1762
jsx z malymi zmianami z https://github.com/rofrol/react-unidirectional-example/blob/dd0bfe374a652f45ce8bce90c81d89912bc59427/index.js#L41

Kamil Lelonek: Wybieram: elm.

https://www.facebook.com/groups/257881290932879/permalink/936348316419503/
