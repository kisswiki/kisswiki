- reactive programming
  - pros/cons
    - Functional reactive programming provides us with a toolset to easily describe complex concurrent data or control flows in a declarative way using a clear interface—it’s all about what and not how! Indeed you have to learn a new paradigm, which adds another level of abstraction, but in the end it feels very natural. One major drawback is the ability to debug reactive code, because events fly around at many points in time. I ignored error handling in all examples, which is in fact not a big deal and built into event streams by design. FRP is not the holy grail and has to be chosen wisely for the right job—like data binding. https://www.zweitag.de/en/blog/technology/functional-reactive-programming-frp
    - pros
      - merge three streams together but you want to debounce one of them, map the other, and sample the third based on a timer, and then map the merged stream into a different object type https://www.reddit.com/r/javascript/comments/3z0m1i/thoughts_on_rxjs/cyj0x49
      - While Flux suggests using the low-level EventEmitter which requires manual event handling, RxJS and similar event processing tools are powerhouses capable of replacing a lot of boilerplate that a typical Flux application contains. RxJS also allows the internal structure of a component to be reactive. http://futurice.com/blog/reactive-mvc-and-the-virtual-dom
    - cons
      - [Duality and the End of Reactive - Erik Meijer](https://channel9.msdn.com/Events/Lang-NEXT/Lang-NEXT-2014/Keynote-Duality)
        - https://www.facebook.com/rofrol/posts/10153688958215956
      - https://medium.com/@puppybits/rxjs-is-great-so-why-have-i-moved-on-534c513e7af3
        -  FRP has a very unique API that takes a bit to learn, even if you’ve done map/reduces before. The DSL being very unique made it harder to reuse other functions in my code base. I couldn’t reuse code but the Observable and Streams could be pasted around to leverage in other classes.
        - Merging and combining streams is where it got muddy really fast. I had events going that were hard to track down. I lost the finer grain control when more than one stream was being used.
        - Debugging FRP processes was stepping through a lot of the internals of the libraries to find where events got twisted. Using FRP in smaller more isolated uses and limiting combining streams was much more beneficial and the file size increase if you’re just using it in place of a single callback function is not very useful.
        - a pattern called CSP (...) code that looks like normal is synchronous and walks line by line acutally parks and waits until something comes across the channel before going to the next line. JavaScript will be getting this with `await` in ES2016. (...) CSP is really cool, right? Async work looks like sync work and all the code is together making it easy to rationalize about.
        - FRP functions used inside streams needed to understand they were in a stream. Functions used in a transducer don’t know they’re in a transducer. Basically I can reuse them with all my current map/reduce/filtering code inside async channel.
      - The Observable proposal is also just one way to handle asynchronous data streams there are others e.g. async/await, CSP/channels, event emitters, streams or maybe even an actor system. https://medium.com/@BrianDiPalma/thoughts-on-rxjs-cf3562e20d74
        - https://www.reddit.com/r/javascript/comments/3z0m1i/thoughts_on_rxjs/
       - http://lambda-the-ultimate.org/node/4900
        - State in FRP can be distributed throughout the program. It's modeled using folds (or integrals, accumulators) over time. This is actually one of the significant weaknesses of FRP. It means FRP cannot be staged or layered compositionally: if you reactively update the FRP program from an earlier stage, you lose important state encapsulated in the FRP program of the later stage. (...) Most of the limitations of FRP are intrinsic to the nature of 'functions' and signals/events. (...) Control systems and signal processing are an excellent fit for FRP because they are naturally closed systems that tend to make very limited use of state
        - Reactive applications are difficult to implement. Traditional solutions based on event systems and the Observer pattern have a number of inconveniences, but programmers bear them in return for the benefits of OO design. On the other hand, reactive approaches based on automatic updates of dependencies - like functional reactive programming and dataflow languages - provide undoubted advantages but do not fit well with mutable objects.
        - here are still open challenges in the field of reactive programming. For instance, multidirectionality is supported only by a small number of languages, which do not automatically track dependencies between time-varying values. Similarly, glitch avoidance, which is subtle in reactive programs, cannot be ensured in distributed reactive programs using the current techniques.
        - Bloom handles this better, I think. You can still express (discrete-time) FRP-like abstractions but multiple rules can contribute assertions or retractions to one table, allowing open composition.
        - The most vexing issue (I won't call it a limitation per se) with FRP for my domain (graphics/games) is that it wants to model "behavior" as something an agent/entity/object is, rather than as something it does. This is consistent with the "F" in FRP, and provides various interesting benefits (or else we wouldn't be so enamored of FRP), but it doesn't appear to be a good match for how many (most?) people think about behavior.  

          Contrast FRP with something like the script for a play, which is a well proven technology for describing time-varying behavior that coordinates multiple agents. What would an FRP program for Hamlet look like?  

          One visible symptom of this issue is when complex applications of FRP end up creating types that represent "deltas" or partial states, along with composition operators, and then describe many behaviors in terms of time-varying deltas, rather than time-varying states. This is effectively constructing a "thing an agent does" model of behavior inside of FRP, to make up for its absence.
  - http://www.reactivemanifesto.org/
    - https://www.quora.com/What-is-the-significance-of-the-Reactive-Manifesto
  - Principles of Reactive Programming (using Scala) https://www.coursera.org/course/reactive
    - https://github.com/dnvriend/reactive-programming
  - [The introduction to Reactive Programming you've been missing](https://gist.github.com/staltz/868e7e9bc2a7b8c1f754)
    - https://news.ycombinator.com/item?id=7964873
  - Before we launched React we had a big discussion as whether we should change the name or not. React is completely different from everything that's called "reactive programming" and we were afraid to cause confusion. https://news.ycombinator.com/item?id=7965194
  - learn
    - tutorial
      - https://github.com/channikhabra/yarr
     - video courses
      - https://egghead.io/series/introduction-to-reactive-programming
      - https://egghead.io/lessons/javascript-introducing-the-observable
  - distinguish deeply/genuinely functional programming from merely functional-looking notations https://stackoverflow.com/questions/5875929/specification-for-a-functional-reactive-programming-language
  - https://github.com/christianalfoni/EmptyBox/blob/master/posts/2015_04_01_Functional-Reactive-Applications.md
    - RxJS feels much like the immutable-js project by Facebook. It is a huge API that is about handling data, not about creating applications.
    - when developers think Functional Reactive Programming they think Observables and being able to use functional concepts like Map, Reduce, Filter etc. on them
    - Reactive Programming can most easily be explained as reacting to a change, instead of being told about a change
  - unlike an iterable, which has a known length, an observable is often open-ended, so we have to use the slightly less familiar scan operation. This is basically an incremental reduce, performing an aggregation step for each item in the observable sequence as soon as it arrives. https://medium.com/@garychambers108/functional-reactive-react-js-b04a8d97a540
  - pragmatic definition of FRP
    - Use streams of data to create the application state (data)
    - Build a UI given only the application state with pure functions (view)
  - Reactive programming is simply about decoupling data production from data consumption https://github.com/arqex/curxor/issues/1#issuecomment-72642125
  - vs
    - CSP
      - CSP channels go beyond and decouple 3 things: data production, data medium, data consumption. It has its benefits, but you can also choose to decouple the data medium with Rx et al, so then CSP versus event stream processing becomes just a matter of taste. https://github.com/cyclejs/cycle-core/issues/74
      - While there are various mechanisms to make events/callbacks cleaner (FRP, Rx/Observables) they don't change their fundamental nature, which is that upon an event an arbitrary amount of other code is run, possibly on the same thread, leading to admonitions such as "don't do too much work in your handler", and phrases like "callback hell". http://stackoverflow.com/questions/20632512/comparing-core-async-and-functional-reactive-programming-rx
      - Streams act like events and broadcast their values. As a result you can attach many listeners to the same stream of data. Channels, act as value bridges. One value put on one end, is only received by one receiver. However, the one-to-many data stream can be simulated with a helper function, and Dropping channels. With a few helper methods, channels can be used to achieve the same semantics of promises or of streams, or a one receiver semantic that is unique.  
      Note: this function like other functions, still needs work to account for closed channels.  
      One downside of the one-to-many semantic of streams is that it is hard to send a message upstream telling the origin to stop emitting data.  
      https://github.com/ubolonton/js-csp/issues/40
      - http://potetm.github.io/2014/01/07/frp.html
        http://potetm.github.io/2014/01/27/responsive-design-csp.html  
        That guy reimplemented David Nolen's CSP examples on Bacon + ClojureScript and got  
        very interesting results. He came to the opposite conclusion that it's hard to see  
        the declared benefit of CSP over Rx (at least from the app code point of view)  
        https://github.com/ubolonton/js-csp/issues/40#issuecomment-104650318
      - [In the end, there is still not a clear winner but some key differences](https://github.com/ubolonton/js-csp/issues/40#issuecomment-104740618):
        - FRP is a much higher-level abstraction and comes with many more goodies and features. It also comes with a centralized error handling. CSP on the other hand is a much lower level tool, and does very little.
        - For someone new to async programming, CSP is a much easier concept to learn, however, in most of the common cases, FRP is much more concise. With high level methods like flatMap, FRP libraries give a simple way to handle complex interactions. CSP gives you a lower-level primitive that can easily be used to accomplish similar tasks using good old loops and if constructs, but obviously that involves more code.
        - CSP has a default case of one sender and one receiver. FRP is more or a pub-sub model. So they are really well suited for different tasks. That said, CSP supports Mults and pub-sub as well, and FRP can be made to work in a more CSP way.
       - There are some differences and many similarities between js-csp and RxJS. They are both stream interfaces that can be treated as any other set of data, and so you can use common methods like map and filter. (also throttle and debounce)  
        The main differences are:
        - js-csp is dependent on generator functions, RxJS is not.
        - js-csp creates pipes from single senders to single receivers by default. RxJS streams can be used many times and are by default one to many streams.
        - js-csp is a small concept that is then built on by many helper functions. (these helper functions can come in various forms, transducers being just one) RxJS, basically needs to be used as a whole large library.  
        https://github.com/cyclejs/cycle-core/issues/74#issuecomment-73616952  
      - http://www.jayway.com/2014/09/16/comparing-core-async-and-rx-by-example/
    - events
      - Events are fine for one-shot notifications, but break down when you want to coordinate data from a number of sources. Event handlers tend to not be very reusable or composable. https://phuu.net/2014/08/31/csp-and-transducers.html
      - Actors
        - The difference between reactive objects and actors with regard to undefined methods seems to be the following: depending on its state, an actor may only respond to some subset of its full set of methods at any given time (the remainder of the methods being "undefined" at that time, and calls to those methods being queued); in contrast, reactive objects will always respond to all methods, no matter what its internal state. http://lambda-the-ultimate.org/node/2203
  - streams can be overly chatty in which the consumer cannot keep up with the producer. To that end, we need mechanisms to control the source so that the consumer does not get overwhelmed https://github.com/Reactive-Extensions/RxJS/blob/master/doc/gettingstarted/backpressure.md
  - The official terminology for a stream is "Observable", for the fact that it can be observed, but I find it to be a silly name, so I call it stream https://gist.github.com/staltz/868e7e9bc2a7b8c1f754
  - http://www.thedotpost.com/2015/12/andre-medeiros-the-whole-future-declared-in-a-var
  - What does "fully reactive" mean? https://github.com/jsforum/jsforum/issues/6
  - state
    - making state explicit as an object is advantageous over streams for achieving separation of concerns. State (and managing state) is just a means to an end. We don't want to manage state. We want to deliver features, and that ultimately is about what the user inputs, and what the user gets out. If you can build that without state in between, you accomplish what you need. And you also get "look at a handful of LOC and be able to tell exactly what that does". State is actually the dual to events. Given one, you can extract the other. An example is your age (state) and your birthdays (events). So modelling data as a stream of events makes state implicit because state is just the other side of the coin, you are not eliminating it, you are just working in a different "coordinate system". Besides all that, reactive pattern (on which FRP and Streams are based) is all about separation of concerns. I'm talking about A--> B versus A -->B explained better here: http://cycle.js.org/observables.html#reactive-programming https://www.reddit.com/r/javascript/comments/3zr6i0/conversation_whats_the_core_differences_between/cyojrze
   - inversion of control
    - The common ground is that all FRP works with the concept of observability which enables reacting to change automatically. In other words, FRP establishes inversion of control. This is also the reason that you cannot call React in itself reactive; there is simply no inversion of control. Developers have to push changes through the system themselves by using setState. https://www.reddit.com/r/javascript/comments/3zr6i0/conversation_whats_the_core_differences_between/cyov7dj
  - convert between different stream implementations https://github.com/TylorS/stream-conversions
- programming
  - [Don't comment, delete the code. Next time you write the same logic with better code!](https://twitter.com/AjeyGore/status/640430919954755585)
    - [Delete your code](https://www.youtube.com/watch?v=Oj4vXMRenFo)
   - [Succinctness is Power](http://www.paulgraham.com/power.html)
    - the measure of the power of a programming language is how small it makes your programs
    - programmers seemed to generate about the same amount of code per day regardless of the language
    - programs written in more powerful languages tend to have fewer bugs
    -  the notation is not the problem, even though it may feel like it is. The math paper is hard to read because the ideas are hard.
  - http://blog.codinghorror.com/the-magpie-developer/
  - https://blog.lelonek.me/jack-of-all-trades-but-master-of-none-2865d34a6442
  - Let me tell you about programming! It's like giving directions to a baby that has the ability to understand and implement what you are saying and telling it to do, but none of the life experience to infer about what you're telling it. You can't just say: "go get the shovel". If I asked you that, you would just go to the shed and grab it for me. With the programming baby, you have to explain what a shovel is, and where the shovel is, and how the baby can "get" the shovel, in order for the baby to be able to do anything. It will also do EXACTLY as you ask, and nothing more. I tell the baby that she shovel is in the shed, and he goes in the shed and comes back empty-handed, because the shovel was leaning up on the outside of the shed. Imbecile. https://devhumor.com/media/my-friends-accurate-description-of-programming
  - https://github.com/braydie/HowToBeAProgrammer
  - https://github.com/FreeCodeCamp/FreeCodeCamp
- stackexchange.com
  - http://meta.stackexchange.com/questions/3792/how-to-nest-code-within-a-list-using-markdown
- jspm
  - https://gitter.im/jspm/jspm
  - vs
    - webpack
      - http://ilikekillnerds.com/2015/07/jspm-vs-webpack/
        - https://www.reddit.com/r/javascript/comments/42cigp/jspm_vs_webpack_i_like_kill_nerds/
      - http://blog.dripstat.com/why-we-switched-from-jspm-to-webpack/
        - https://www.reddit.com/r/javascript/comments/42ozl3/why_we_switched_from_jspm_to_webpack/
- virtual DOM
  - [widely used in the game industry](http://en.wikipedia.org/wiki/Scene_graph) http://elm-lang.org/blog/blazing-fast-html
  - https://github.com/wilsonpage/fastdom
  - https://medium.com/google-developers/introducing-incremental-dom-e98f79ce2c5f
- speed
  - http://calendar.perfplanet.com/
  - http://calendar.perfplanet.com/2015/why-amp-is-fast/
  - https://www.devcasts.io/p/simple-hacks-to-dramatically-improve-your-page-loading/
  - https://github.com/wilsonpage/fastdom
  - http://calendar.perfplanet.com/2015/using-chrome-traces-to-automate-rendering-performance/
  - http://www.sitepoint.com/complete-guide-reducing-page-weight/
- image
  - http://calendar.perfplanet.com/2015/upgrading-jpegtran-to-mozjpeg/
  - http://calendar.perfplanet.com/2015/why-arent-your-images-using-chroma-subsampling/
- tools
  - browsers
    - userstyles
      - https://userstyles.org/styles/browse/global
      - https://userstyles.org/styles/47391/midnight-surfing-alternative
        - blacklist
          `regexp("^https?:\\/\\/(?!.*(stackoverflow|stackexchange|serverfault|superuser|stackapps|mathoverflow|askubuntu|github)\.(com|org)\\/).*")`
      - https://userstyles.org/styles/35345/stackoverflow-dark
      - https://userstyles.org/styles/37035/github-dark
      - https://userstyles.org/styles/79105/facebook-flat
      - blacklist
        - http://stackoverflow.com/questions/12904773/specify-urls-not-to-affect-wih-moz-document-in-stylish
      - https://github.com/JasonBarnabe/stylish/wiki/Valid-@-moz-document-rules
      - https://github.com/JasonBarnabe/stylish/wiki/Applying-styles-to-specific-sites
    - firefox
      - dark
        - https://support.mozilla.org/en-US/kb/firefox-reader-view-clutter-free-web-pages
        - https://addons.mozilla.org/en-US/firefox/addon/owl/
        - https://addons.mozilla.org/en-US/firefox/addon/ft-deepdark/
      - language translate
        - https://addons.mozilla.org/en-US/firefox/addon/google-translator/
      - suspend/unload tabs
        - https://www.reddit.com/r/firefox/comments/36qc63/which_tab_suspender/
          - https://addons.mozilla.org/en-US/firefox/addon/auto-unload-tab/ - maybe not needed, seems firefox has it built-in
        - https://addons.mozilla.org/pl/firefox/addon/tab-data/
      - buttons
        - https://addons.mozilla.org/en-US/firefox/addon/ClassicThemeRestorer/
      - https://services.addons.mozilla.org/en-US/firefox/discovery/addon/noverflow/
- tabs vs spaces
  - http://lea.verou.me/2012/01/why-tabs-are-clearly-superior/
- quantum computing
  - algorytmy odporne na ataki kwantowe np większość/wszystkie symetryczne, a z asymetrycznych między innymi NTRU (algorytm oparty na kratach). [source](http://antyweb.pl/komputer-kwantowy-nasa-google/#comment-2429625112)
    - https://en.wikipedia.org/wiki/Elliptic_curve_cryptography#Quantum_computing_attacks
- hardware
  - robots
    - https://www.hackster.io/projects/tags/robots
    - drone
      - http://www.instructables.com/id/DIY-Drones/
      - http://www.makershed.com/collections/drones-flight
      - http://diydrones.com/
      - http://myfirstdrone.com/build-your-first-quad/
- dynamic programming
  - http://stackoverflow.com/questions/6164629/dynamic-programming-and-memoization-bottom-up-vs-top-down-approaches
  - https://en.wikipedia.org/wiki/Dynamic_programming
  - http://stackoverflow.com/questions/12042356/memoization-or-tabulation-approach-for-dynamic-programming
  - http://addyosmani.com/blog/faster-javascript-memoization/
  - http://www.sitepoint.com/implementing-memoization-in-javascript/
  - using lodash

    ```
    var fibonacci = _.memoize(function(n) {
    return n < 2 ? n : fibonacci(n - 1) + fibonacci(n - 2);
      });
    ```
- learn
  - video courses
    - https://www.devcasts.io/
    - https://www.codeschool.com/
    - https://www.pluralsight.com/
    - http://meteorscreencasts.com/create-a-meteor-app-tutorial/appendix
    - https://www.codecademy.com/
- quotes
  -  Slaves are not allowed to say no. Laborers may be hesitant to say no. But professionals are expected to say no.  
  Indeed, good managers crave someone who has the guts to say no. It’s the only way you can really get anything done.  
  - Robert C. Martin, The Clean Coder: A Code of Conduct for Professional Programmers  
  http://javarevisited.blogspot.com/2015/12/20-java-quotes-to-learn-and-motivate-yourself.html
  - A programming language is low level when its programs require attention to the irrelevant - Alan Perlis
 - news/blogs
  - https://blog.codinghorror.com/
  - https://news.ycombinator.com/
  - https://rrrepo.co/repo/webdesign
  - http://www.smashingmagazine.com/
  - [Front-end, programming, design](https://gist.github.com/DrummerHead/bb62741ecf65a4e601a3)
  - https://www.nczonline.net/
- immutable
  - https://github.com/nzakas/ama/issues/34
- static websites
  - https://www.nczonline.net/blog/2015/08/wordpress-jekyll-my-new-blog-setup/
- open source
  - http://nolanlawson.com/2015/12/28/how-to-fix-a-bug-in-an-open-source-project/
  - ranking
    - https://www.facebook.com/groups/257881290932879/permalink/948608231860178/
- node.js
  - watch
    - https://github.com/paulmillr/chokidar
  - env
    - https://github.com/ryanlelek/atmosphere
  - http://davidvgalbraith.com/how-i-fixed-node-js/
  - https://github.com/totaljs/framework
- people/news
  - http://www.joezimjs.com/
  - http://www.raduangelescu.com/
- cms
  - https://github.com/relax/relax
- security
  - https://github.com/quantumfoam/DVNA/
- proxy
  - https://gist.github.com/rofrol/3eefaa43876719428f6e
  - atom https://github.com/atom/apm

   ```
   apm config set http-proxy <proxy>
   apm config set https-proxy <proxy>
   ```
   - bower
     - bower run such commands `git ls-remote --tags --heads git://github.com/jrburke/requirejs-bower.git` even when you specified `git config --global http.proxy` and `https.proxy`  
      `git config --global url."https://".insteadOf git://`
  - gem
    - http://stackoverflow.com/questions/5782631/how-to-install-gem-through-proxy-with-authorization/15387768#15387768  
      http://stackoverflow.com/questions/4418/how-do-i-update-ruby-gems-from-behind-a-proxy-isa-ntlm/34412185#34412185  
      in your ~/.gemrc  
      `http_proxy: http://<YOUR_USER>:<YOUR_PASSWORD>@<YOUR_PROXY_HOST>:<YOUR_PROXY_PORT>`  
      check with  
      `gem environment`
- ruby
  - windows http://stackoverflow.com/questions/18908708/installing-ruby-gem-in-windows/32957325#32957325
- bash
  - https://github.com/alebcay/awesome-shell
  - graphs https://github.com/holman/spark
- canvas
   - fabric.js
    - Fabric provides simple but powerful object model on top of native methods. It takes care of canvas state and rendering, and lets us work with “objects” directly http://fabricjs.com/fabric-intro-part-1/
    - downloads 65k http://npm-stat.com/charts.html?package=fabric
   - comparison
    - [Javascript 2D Canvas Libraries](https://docs.google.com/spreadsheets/d/1JYEGMN2jJtmwyjB4DMw3uaYLVMkduf61suKpiOzo0hc) - by kangax
    - http://danielsternlicht.com/playground/html5-canvas-libraries-comparison-table/
    - http://jsperf.com/canvas-lib-render
    - http://fabricjs.com/benchmarks/
    - https://www.smashingmagazine.com/2012/02/web-drawing-throwdown-paper-processing-raphael/
    - http://www.slant.co/topics/28/~javascript-drawing-library
  - [A scene management module for CreateJS](https://github.com/bloomingbridges/AtelierJS)
  - easel.js
    - downloads 12k https://bower.herokuapp.com/packages/easeljs
      - http://stackoverflow.com/questions/28558536/does-bower-expose-download-statistics-for-each-package
- translate
  - https://github.com/thejameskyle/babel-plugin-handbook/issues/29
- rx.js
  - v5 https://github.com/ReactiveX/RxJS/blob/master/MIGRATION.md
    - Better performance
    - Better debugging
    - Compliance with the ES7 Observable Spec
    - RxJS 5 is not ready yet and still has bugs https://twitter.com/andrestaltz/status/678485673863704576
  - http://staltz.com/how-to-debug-rxjs-code.html
  - http://rxmarbles.com/
  - pros/cons
    - cons
      - Reactive extensions (Rx) is like RegEx. Super concise/powerful if you know it; otherwise—what the hell is going on? https://twitter.com/kangax/status/664097597016154112
- race condition
  - The definition of race conditions is not tied to multithreading. It is simply when you have a system that is dependent on the sequence of events from multiple components and then the components behave in an unintended way http://amasad.me/2015/10/31/javascript-async-functions-for-easier-concurrent-programming
- async/await
  - Using async functions (or generally co-routines) you can write programs that makes the expected ordering of events explicit and makes it easier to recover from failures in subcomponents. http://amasad.me/2015/10/31/javascript-async-functions-for-easier-concurrent-programming
  - https://strongloop.com/strongblog/async-error-handling-expressjs-es7-promises-generators/
  - http://pouchdb.com/2015/03/05/taming-the-async-beast-with-es7.html
  - pros/cons
    - cons
      - They have no idea that they made a typo in asyncFunction, and it takes them a while to learn that run actually returns a promise http://jlongster.com/Stop-Trying-to-Catch-Me
      - await has also another problem in that if somewhere, deep down the call stack, something is intending to do async, then up the entire call stack everywhere you've got to insert await https://esdiscuss.org/topic/does-async-await-solve-a-real-problem#content-4
      - On the syntax side, I am not convinced by the await construct. The problem is that await is prefix. So it does not play well in chains of async calls. Consider the following:

        ```
        streamline: f1().f2().f3(_)
        async/await: await (await (await f1()).f2()).f3();
        ```
        https://esdiscuss.org/topic/does-async-await-solve-a-real-problem#content-11
      - https://spion.github.io/posts/es7-async-await-step-in-the-wrong-direction.html
  - vs
    - generator and yield
      - https://esdiscuss.org/topic/does-async-await-solve-a-real-problem#content-2
 - router
  - http://www.christianalfoni.com/articles/2015_08_20_What-if-the-adddressbar-worked-like-an-input
    - https://github.com/christianalfoni/reactive-router
    - https://github.com/cerebral/addressbar
    - https://github.com/cerebral/url-mapper
- seo
  - Apologies if you’re working for a great SEO company which doesn’t make unsubstantiated or misleading promises. I’m sure there are some out there — I’ve just never encountered one. http://www.sitepoint.com/10-web-predictions-2016/
- password
  - http://niebezpiecznik.pl/post/lamacz-hasel-do-sieci-wi-fi-dla-niektorych-routerow-upc/
- regex
  - https://github.com/VerbalExpressions/JSVerbalExpressions/wiki
- postgresql
  - Of course it's going to be obsolete next year as we drop everything into distributed, scaleable cloud systems with Amazon Dynamo, Redis and other NoSQL services.  
    And then reimplement the data-integrity systems that relational databases do for you already. No thanks, Postgres is rapidly gaining the ability to do both. JSONB, HSTORE, now lovely parallelism and hopefully multi-master replication soon.  
    Postgres is an example of a software solution solving things correctly and not inventing new solutions every 6 months.  
    http://www.phoronix.com/forums/forum/software/general-linux-open-source/834238-parallel-query-support-coming-to-postgresql-9-6?p=834426#post834426
  - 9.5 http://www.phoronix.com/forums/forum/software/general-linux-open-source/844049-postgresql-9-5-brings-upsert-big-data-features
    - To me, the best features of this new version is the UPSERT and jsonb_set, which allows update a property of a jsonb collumn
    - For me the best is native bi-directional replication
    - PostgreSQL has some exciting stuff in it. As someone working for a large company wanting to use it commercially as a "free" option, the biggest down side is the unpolished backup / recovery feature set. I am also not impressed with the older Oracle style one-process-per-connection scheme it deploys. I wish someone would change it over to an NginX style architecture to see what kind of performance benefit can be achieved.
- data visualization/chart
  - http://noeticforce.com/best-free-data-visualization-tools-javascript-charts-graphs
  - https://www.reddit.com/r/dataisbeautiful
  - pie
    - https://gionkunz.github.io/chartist-js/examples.html#pie-with-custom-labels
    - http://js.cytoscape.org/demos/173313aba1f31cae49a5/
  - http://www.tracemedia.co.uk/projects/terra/map/#type=ol&lang=ru,uk&map=language&loc=UA
- flat design
  - Users are forced to explore pages to determine what’s clickable. They frequently pause in their activities to hover over elements hoping for dynamic clickability signifiers, or click experimentally to discover potential links.  
  This behavior is analogous to the behavior of laboratory rats in operant-conditioning experiments: if a rat gets a food pellet at random intervals after performing a specific action, the rat will keep doing that action in the hope of getting fed again. Similarly, users have discovered that clicking elements that don’t have strong signifiers sometimes works. Like the lab rats, users will stick to random clicking as long as they get rewarded from time to time.  
  Even though users are mostly able to find their way through interfaces with this exploratory behavior, they’re still being forced to do extra work and are being distracted from their primary goals without gaining any tangible benefit.  
  https://www.nngroup.com/articles/flat-design-long-exposure/
- Readme Driven Development
  - In Agile, this is a "user story"http://programmers.stackexchange.com/questions/205706/how-can-i-apply-readme-driven-development-to-an-ongoing-project
  - My approach is the following with my startup project (but not with my day-job project):  
  I start to write this: brainstorm.txt  
  In brainstorm.txt I don't have to be concrete and concise. I just write down all kind of ideas.  
  After a while I start to write this: design.txt This is very concrete (factual) and concise. It is not an essay, it is not written for other people. It is just for myself: to make a conceptual skeleton. It is not too structured, because it is impossible if it is about an innovative product. The only way I can avoid chaos is that I apply extreme minimalism. (Minimalist things are easier to structure, and don't need to be too structured.) Meanwhile I start to write code, mostly bottom-up. And I continuously refine design.txt.  
  The User's guide (I call the Readme User's Guide) is already a quite different story for me. It must be written for the user and not myself. I don't like fluffy user's guides, but still it should not be as concise and as abstract as my notes to myself. If I would have to start with the User's Guide than my brain would work in a 'user's guide writer mode'. For me 'engineer/hacker mode' is different.  
  https://news.ycombinator.com/item?id=1630123
  - He mentioned in passing that writing a typical README requires just the right amount of planning upfront. It was tangential to his main point, about documentation, but I think it's a good observation.  
  It avoids both planning extremes: writing an incredibly detailed spec upfront without any feedback from prototyping (waterfall), and diving in without any planning and expecting tests to magically do your design for you (naive TDD).  
  It's good to having an articulate summary of your project, but for planning, the README is just a prop. It could just as well be "whiteboard-driven design" or whatever.  
  https://news.ycombinator.com/item?id=1628312
  - He mentioned in passing that writing a typical README requires just the right amount of planning upfront. "just the right amount of planning upfront" is exactly what Scrum should do https://news.ycombinator.com/item?id=1629522
  - User stories serve the same purpose as traditional requirements specifications, but their style and level of detail are different. https://www.computer.org/csdl/mags/so/2005/06/s6103.pdf
- group messaging/chat

- Certification Authorities
  - DNSSEC-based systems actually provide reduced trust agility. As unrealistic as it might be, I or a browser vendor do at least have the option of removing VeriSign from the trusted CA database, even if it would break authenticity with some large percentage of sites. With DNSSEC, there is no action that I or a browser vendor could take which would change the fact that VeriSign controls the .com TLD. http://www.thoughtcrime.org/blog/ssl-and-the-future-of-authenticity/
- live chat
  - https://www.facebook.com/groups/512365358860279/permalink/940426976054113/
    - https://www.tawk.to/ - free
    - http://zopim.com/ - basic free
    - https://www.livechatinc.com/
- slides/presentation
  - https://github.com/FormidableLabs/spectacle
  - https://github.com/jdan/cleaver
- REST
  - and postgresql https://github.com/srid/spas
- watchman
  - https://www.facebook.com/notes/facebook-engineering/watchman-faster-builds-with-large-source-trees/10151457195103920/
  - You're kidding me, right? "Of use"? This thing is a goddamn miracle, no two-ways about it https://algorithms.rdio.com/post/make/#comment-2224552519
- typescript
  - dead code elimination like rollup https://github.com/Microsoft/TypeScript/issues/6319
- https
  - https://github.com/EFForg/https-everywhere
- svg
  - http://teespring.engineering/posts/how-teespring-uses-canvas-svg-dom-to-design-tshirts/
- mobservable
  - https://medium.com/@mweststrate/becoming-fully-reactive-an-in-depth-explanation-of-mobservable-55995262a254
- increase traffic
  - http://sujanpatel.com/marketing/the-science-of-stickiness/
- logging/monitoring
  - https://www.graylog.org/
- http/2
  - https://www.facebook.com/smashmag/posts/10153897515457490
  - https://www.nginx.com/blog/7-tips-for-faster-http2-performance/
- transducers
  - definition http://ignaciothayer.com/post/Transducers-Are-Fundamental/
    - A transducer is a function that takes one reducing function and returns another.
    - A reducing function is a function that has the structure of what you'd pass to reduce.
    - It is a function which accepts an element of input and a previous reduction, and returns a new reduction.
    - Decoupling From Sequences
  - https://medium.com/@roman01la/understanding-transducers-in-javascript-3500d3bd9624
- conferences
  - non-profit tech conferences http://mloc-js.com/
- pipe things directly into the shell from internet
  - https://github.com/jbenet/hashpipe
- reveal.js
  - Vertically fill screen 100% https://github.com/hakimel/reveal.js/issues/180#issuecomment-173543708 http://stackoverflow.com/questions/23241903/positionfixed-in-reveal-js/34922750#34922750
  - PDF Export https://github.com/hakimel/reveal.js#pdf-export
- agile
  - http://blog.8thlight.com/uncle-bob/2015/10/16/agile-and-waterfall.html
  - http://martinfowler.com/bliki/FlaccidScrum.html
- how to browse in a privacy and security conscious manner https://gist.github.com/atcuno/3425484ac5cce5298932
- http://www.ted.com/talks/sebastian_wernicke_how_to_use_data_to_make_a_hit_tv_show
