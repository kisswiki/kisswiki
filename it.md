- react.js
  - raw-reactjs router
  - https://www.reddit.com/r/reactjs/comments/3yjix3/explain_like_im_a_child_stateless_functional/
  - https://www.reddit.com/r/reactjs/comments/3yh1nv/should_i_use_reactcreateclass_es6_classes_or/
  - usages - http://builtwithreact.io/
  - testing
    - If you are using jsdom make sure you are creating the correct globals in the environment before any requires of React [source](If you are using jsdom make sure you are creating the correct globals in the environment before any requires of React) [source](https://github.com/facebook/react/issues/5046#issuecomment-146222515)
    - https://egghead.io/series/react-testing-cookbook
   - better than redux?
    - https://engineering.heroku.com/blogs/2015-12-16-react-refetch/
  - https://github.com/petehunt/react-howto
  - RactDOM vs https://groups.google.com/d/msg/scala-js/Z-8O2TtQJ0Q/oKW8TxVjBgAJ
  - with RxJS
    - https://medium.com/@garychambers108/functional-reactive-react-js-b04a8d97a540
    - http://www.aryweb.nl/2015/02/16/Reactive-React-using-reactive-streams/
- cycle.js
  - examples
    - https://github.com/Widdershin/cycle-music-sequencer
    - [minimal](https://medium.com/@fkrautwald/we-are-not-writing-much-code-5404fb7d39e)

      ```javascript
      Cycle.run(
        (sources) => ({DOM: Rx.Observable.timer(0, 1000).map(i => CycleDOM.h(`div`, `Seconds elapsed: ${i}`))}),
        {DOM: CycleDOM.makeDOMDriver(`#app`)}
      )
      ```
  - awesome list
    - https://github.com/Widdershin/cycle-ecosystem
  - community
    - [chat](https://gitter.im/cyclejs/cycle-core)
    - https://twitter.com/search?q=cycle.js
    - http://stackoverflow.com/questions/tagged/cyclejs?sort=votes
    - blogs
      - https://medium.com/@andrestaltz
      - https://medium.com/@fkrautwald
  - [canvas performance](https://gitter.im/cyclejs/cycle-core?at=5681a7610199d70069dffd60)
   - pros/cons
     - pros
      - Cycle.js is a paradigm changer, because it is the only framework in which you can extract explicit data flow graphs from the code base. When introducing new developers to large code bases, this can make them reason about the code without looking at code. [link](https://medium.com/@fkrautwald/we-are-not-writing-much-code-5404fb7d39e)
  - components
   - https://github.com/mmai/cyclejs-sparklines
- graphql
  - https://github.com/chentsulin/awesome-graphql
   - https://github.com/kadirahq/lokka
    - https://porter.io/github.com/chentsulin/awesome-graphql
    - https://voice.kadira.io/introducing-lokka-a-simple-javascript-client-for-graphql-e0802695648c
    - https://forums.meteor.com/t/lokka-a-javascript-client-for-graphql/14922
- github.com
  - contributions
    - yearly heat map https://github.com/rofrol?tab=contributions&period=yearly
    - https://developer.github.com/v3/repos/statistics/#get-the-last-year-of-commit-activity-data
    - most contributions https://gist.github.com/paulmillr/2657075/
  - https://github.com/tiimgreen/github-cheat-sheet
  - markdown
    - https://github.com/tchapi/markdown-cheatsheet
    - https://gist.github.com/micmcg/976172
    - new line inside list - use two spaces after line and indent next line with at least one space [source](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#lists)
  - gist
      - [Fenced code blocks inside ordered and unordered lists](https://gist.github.com/clintel/1155906)
      - Secret gists don't count as private repositories. You can create as many secret gists as you like.

        Warning: Secret gists aren't private. If you send the URL of a secret gist to a friend, they'll be able to see it. However, if someone you don't know discovers the URL, they'll also be able to see your gist. [link](https://help.github.com/articles/about-gists/)
      - gist.github.com supports search. So you can search your gist. I use #hashtag in description, so I can search my gist by tags via myusername #tag [link](http://stackoverflow.com/questions/2082723/how-do-you-manage-your-gists-on-github/5537451#5537451)
      - Issues and pull requests with task list items defined will summarize the task list on the pull request listing and any cross reference [link](https://github.com/blog/1375%0A-task-lists-in-gfm-issues-pulls-comments)
      - [What You Can Do With Gists on Github?](http://www.labnol.org/internet/github-gist-tutorial/28499/)
        - publish gist as a standalone web page using http://roughdraft.io
        - save the Gist as index.html and then use http://bl.ocks.org to serve the rendered version
        - save text snippets from web pages as public or private gists
        - embed any Gist in your web pages
        - use Google Analytics to measure the traffic to your Gists
      - [gist](https://github.com/defunkt/gist) - upload content from command line to https://gist.github.com/
  - http://brettterpstra.com/2013/02/13/quick-tip-chrome-extensions-that-make-github-rock/
  - browser extensions/styles
    - https://github.com/showcases/github-browser-extensions
    - chrome
      - https://chrome.google.com/webstore/detail/notifier-for-github/lmjdlojahmbbcodnpecnjnmlddbkjhnn
    - https://userstyles.org/styles/70979/github-better-sized-tabs-in-code
  - README
    - http://vadimdemedes.com/5-tips-to-make-your-readme-stand-out/
  - https://github.com/facebook/mention-bot
- git
  - [A workshopper module for learning Git and GitHub](https://github.com/jlord/git-it)
  - So you're rebasing and you resolve a conflict wrong? `git checkout --conflict=merge <FILE>` to get it back to its conflicted state https://twitter.com/maybekatz/status/677656507052392448
  - https://xkcd.com/1597/
  - http://think-like-a-git.net/
  - extra commands https://github.com/alebcay/awesome-shell
- web development
  - https://github.com/google/WebFundamentals
- html/css
  - http://cssdb.co/
  - interface/widgets
    - https://github.com/uikit/uikit
    - http://codecondo.com/minimal-css-frameworks-grid-systems/
  - frameworks
    - http://codecondo.com/minimal-css-frameworks-grid-systems/
      - https://github.com/owenversteeg/min
      - https://github.com/mrmrs/fluidity
      - https://github.com/andhart/bijou
      - https://github.com/matthewhartman/base
      - https://github.com/imperavi/kube
      - https://github.com/visiondesignzoo/Responsee
  - css
    - speed
      - https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Writing_efficient_CSS
      - http://calendar.perfplanet.com/2011/css-selector-performance-has-changed-for-the-better/
     - learn
      - books
        - [CSS Secrets: Better Solutions to Everyday Web Design Problems - Lea Verou](http://www.amazon.com/CSS-Secrets-Lea-Verou/dp/1449372635)
  - http://www.joezimjs.com/javascript/top-5-9-favorite-html5-apis/
 - flexbox
  - https://github.com/10up/flexibility
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
- programming
  - [Don't comment, delete the code. Next time you write the same logic with better code!](https://twitter.com/AjeyGore/status/640430919954755585)
    - [Delete your code](https://www.youtube.com/watch?v=Oj4vXMRenFo)
  - [Succinctness is Power](http://www.paulgraham.com/power.html)
    - the measure of the power of a programming language is how small it makes your programs
    - programmers seemed to generate about the same amount of code per day regardless of the language
    - programs written in more powerful languages tend to have fewer bugs
    -  the notation is not the problem, even though it may feel like it is. The math paper is hard to read because the ideas are hard.
- stackexchange.com
  - http://meta.stackexchange.com/questions/3792/how-to-nest-code-within-a-list-using-markdown
- jspm
  - https://gitter.im/jspm/jspm
- jsx
  - [use without react.js](http://stackoverflow.com/questions/30430982/can-i-use-jsx-without-react-to-inline-html-in-script/34262983)
  - It’s such a tight coupling to the DOM  
    Well, not really, it is just a declarative syntax to describe components in a tree…Virtual? DOM?  
    We are describing how trees SHOULD look like, not fiddling with the DOM itself.  
    https://medium.com/@abhiaiyer/dear-templating-sincerely-jsx-part-1-1df99c599001
- [elm](/elm.md)
- virtual DOM
  - [widely used in the game industry](http://en.wikipedia.org/wiki/Scene_graph) http://elm-lang.org/blog/blazing-fast-html
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
    - chrome
      - extensions
        - facebook
          - https://chrome.google.com/webstore/detail/best-simple-facebook-noti/meofonckdkomjeigbnlkgbfmcjfoboem
          - https://chrome.google.com/webstore/detail/facebook-messenger-notifi/pdndipdnnemoafpneeeljgiimhgkjkfg
          - http://www.fbpurity.com/
          - https://chrome.google.com/webstore/detail/friends-feed/nlenanfmnogchfccgdadohbacedphodd
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
  - editors
    - atom
      - https://atom.io/docs/
      - clickable links in markdown
        - ctrl+o https://atom.io/packages/open-path
        - ctrl+click https://atom.io/packages/nuclide-url-hyperclick + https://atom.io/packages/hyperclick
        - https://discuss.atom.io/t/clickable-links-in-markdown-file/15130
        - snippets installed with package langauge-gfm, look at settings to see the list
          - example: type b, tooltip shows, press tab
      - javascript
        - jump to definition
          - https://discuss.atom.io/t/is-there-a-simple-go-to-definition/11809/15
            - https://atom.io/packages/goto
          - https://atom.io/packages/js-hyperclick
        - https://atom.io/packages/autocomplete-modules
        - https://atom.io/packages/atom-ternjs
        - https://atom.io/packages/turbo-javascript
      - diff two files from tree view
        - https://atom.io/packages/compare-files
        - https://github.com/mupchrch/split-diff
      - git diff
        - https://github.com/atom/git-diff
        - side-by-side
          - ungit https://github.com/FredrikNoren/ungit/issues/126
          - https://atom.io/packages/git-history + https://github.com/mupchrch/split-diff
            - https://discuss.atom.io/t/compare-files-side-by-side-with-diff-highlight/13726/10
      - linter
        - to reload rules run `Linter: Toggle`
        - linter-plus is now linter:  
        https://github.com/steelbrain/linter-plus > https://github.com/AtomLinter/linter > https://github.com/atom-community/linter
        - eslint
          - error level http://devnull.guru/get-started-with-eslint/
            - 0 - Turn the rule off
            - 1 - Turn the rule on as a warning
            - 2 - Turn the rule on as an error
          - [recent versions of ESLint do not use any rules by-default](https://atom.io/packages/linter-eslint)
          - https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb
            - npm i -D eslint-config-airbnb eslint-plugin-react
            - .eslintrc

              ```json
              {
                'extends': 'airbnb',
                'rules': {
                  'react/react-in-jsx-scope': 0, // when using jsx with i.e. cycle.js and not with react.js
                  'comma-dangle': 0
                }
              }
              ```
            - When using --init, your configuration file will automatically [include](http://eslint.org/docs/user-guide/migrating-to-1.0.0.html) the following line:

              ```
              {
                  "extends": "eslint:recommended"
              }
              ```
          - https://github.com/walmartlabs/eslint-config-defaults
          - Illegal import declaration https://github.com/eslint/eslint/issues/2112#issuecomment-83633766
            - ecmaFeatures: { modules: true }
      - appearance/themes/syntax highlighting
        - https://github.com/silvestreh/atom-material-ui (uses background color from syntax theme)
        - https://atom.io/themes/oceanic-next
        - https://atom.io/packages/file-icons
      - git
        - https://atom.io/packages/git-plus
      - html
        - https://atom.io/packages/emmet
        - https://atom.io/packages/autoclose-html
        - https://atom.io/packages/html-entities
      - markdown
        - https://atom.io/packages/toggle-markdown-task
        - https://atom.io/packages/markdown-helpers
        - https://atom.io/packages/markdown-deluxe
        - https://atom.io/packages/linter-markdown
        - https://atom.io/packages/markdown-lists or https://atom.io/packages/gfm-lists
        - sort list
          - https://atom.io/packages/markdown-sort-list - changes `-` to `*`, doesn't sort for me
        - https://atom.io/packages/markdown-toc/
      - indent without moving to beginning Ctrl+]
      - terminal
        - https://atom.io/packages/term2 most popular - cannot install on windows and atom beta - node-gyp related
        - https://atom.io/packages/terminal-plus second most popular and installs without problems
      - focus
        - https://atom.io/packages/Zen
      - emmet
        - https://atom.io/packages/emmet-simplified
      - https://atom.io/packages/windows-carriage-return-remover
      - https://atom.io/packages/atom-diary
      - https://atom.io/packages/block-comment `ctrl+shift+/` works
      - https://atom.io/packages/image-view
      - https://atom.io/packages/incompatible-packages
      - https://atom.io/packages/notifications
      - https://atom.io/packages/aligner
      - https://atom.io/packages/list-edit
      - TimeCop: View
      - key binding
        - Keybinding Resolver
          - You can open and close the resolver using `cmd-.`
      - stars
        - `apm stars [--user thedaniel] --install`
        - http://blog.atom.io/2014/06/09/stars.html
        - error: `Command failed: fatal: Unable to find remote helper for 'https'` happend when installing terminal-plus from command line
          - solution: add `C:\Program Files\Git\mingw64\libexec\git-core` to %PATH%
          - http://stackoverflow.com/questions/28216987/impossible-to-install-atom-beautify-on-windows-7-64bit-machine-with-apm/30314943#30314943
      - default line ending - use .editorconfig
      - open recent files/folders
        - https://atom.io/packages/open-recent
- tabs vs spaces
  - http://lea.verou.me/2012/01/why-tabs-are-clearly-superior/
- quantum computing
  - algorytmy odporne na ataki kwantowe np większość/wszystkie symetryczne, a z asymetrycznych między innymi NTRU (algorytm oparty na kratach). [source](http://antyweb.pl/komputer-kwantowy-nasa-google/#comment-2429625112)
    - https://en.wikipedia.org/wiki/Elliptic_curve_cryptography#Quantum_computing_attacks
- operating systems
  - windows
    - screen capture/record
      - https://github.com/ShareX/ShareX
      - [LightShot](https://app.prntscr.com)
- javascript
  - framework
    - http://www.commitstrip.com/en/2015/09/16/how-to-choose-the-right-javascript-framework/
  - validation
    - https://github.com/SzybkiSasza/validators-pl
   - lint
     - eslint
      - [recent versions of ESLint do not use any rules by-default](https://atom.io/packages/linter-eslint)
      - http://devnull.guru/get-started-with-eslint/
       - https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb  
        `npm i -D eslint-config-airbnb`
  - key binding
    - https://github.com/piranha/keymage
  - computer science
    - https://github.com/nzakas/computer-science-in-javascript
  - testing
    - https://github.com/vdemedes/trevor
    - code coverage
      - https://github.com/bcoe/nyc
    - https://github.com/erykpiast/cross-tester
  - es6
    - https://github.com/domenic/count-to-6
  - storage
    - http://nolanlawson.com/2015/09/29/indexeddb-websql-localstorage-what-blocks-the-dom/
  - regex
    - https://github.com/slevithan/xregexp
   - modules
    - http://calendar.perfplanet.com/2015/loading-es2015-modules-using-combo-service/
  - codemod - take a JS file as input and turn them into Abstract Syntax Trees (AST) and apply transformations on this AST later converting them back to JS again https://vramana.github.io/blog/2015/12/21/codemod-tutorial/
  - documenation
    - https://github.com/documentationjs/documentation
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
- game
  - https://github.com/showcases/javascript-game-engines
  - for kids
    - http://phaser.io/news/2015/09/doctor-who-game-maker
    - http://phaser.io/news/2015/12/minecraft-meets-hour-of-code
    - http://phaser.io/news/2015/09/eastenders-soap-factory
  - for programmers
    - https://www.codingame.com
 - phaser/lazer
  - http://www.emanueleferonato.com/2015/01/02/html5-swipe-controlled-sokoban-game-made-with-phaser-step-2-adding-keyboard-controls-and-unlimited-undos/
  - http://www.emanueleferonato.com/2015/06/08/get-my-first-indie-minibook-from-null-to-full-html5-cross-platform-game/
  - https://academy.zenva.com/product/the-complete-mobile-game-development-course-platinum-edition/
  - http://phaser.io/news/2015/09/interphase-is-released
  - http://phaser.io/games
    -
- learn
  - video courses
    - https://www.devcasts.io/
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
- npm
  - http://nolanlawson.com/2015/10/19/the-struggles-of-publishing-a-javascript-library/
  - [remove confg entry](http://stackoverflow.com/questions/21228995/how-to-clear-https-proxy-setting-of-npm)
    - `npm config rm proxy`
- people/news
  - http://www.joezimjs.com/
- cms
  - https://github.com/relax/relax
 - security
  - https://github.com/quantumfoam/DVNA/
 - functional programming
  - pros/cons
    - cons
      - http://stackoverflow.com/questions/1786969/pitfalls-disadvantages-of-functional-programming/
        - the real challenge in multicore programming is taking advantage of CPU caches to make sure cores aren't starved of data, a problem that has never been addressed in the context of Haskell (...) This leaves a big question mark over the purely functional programming paradigm. This is the price you pay for abstracting away time and space, which was always the major motivation behind this declarative paradigm.
        - Functional idioms often do lots of inversion-of-control or laziness, which often has a negative impact on debugging (using a debugger). (This is somewhat offset by FP being much less error-prone due to immutability/referential transparency, which means you'll need to debug less often.)
        - easy to add new functions for existing datatypes, but it's "hard" to add new datatypes
      - Functional programming has one big advantage: it avoids (on conceptual level) 'states' during the runtime. Thus, the value of a term is always predetermined by the input. https://www.researchgate.net/post/What_are_the_advantages_and_disadvantages_of_functional_programming
    - pros
      - "immutability/referential transparency, which means you'll need to debug less often" ... and since everything is built of little independent functions, you can just test those directly; if each function is (a) a correct little function or (b) a correct composition of two or more correct little functions then wham! your program is correct http://stackoverflow.com/questions/1786969/pitfalls-disadvantages-of-functional-programming/#comment2238664_1786999
- proxy
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
      - http://jlongster.com/Stop-Trying-to-Catch-Me
      - await has also another problem in that if somewhere, deep down the call stack, something is intending to do async, then up the entire call stack everywhere you've got to insert await https://esdiscuss.org/topic/does-async-await-solve-a-real-problem#content-4
      - On the syntax side, I am not convinced by the await construct. The problem is that await is prefix. So it does not play well in chains of async calls. Consider the following:

        ```
        streamline: f1().f2().f3(_)
        async/await: await (await (await f1()).f2()).f3();
        ```
        https://esdiscuss.org/topic/does-async-await-solve-a-real-problem#content-11
  - vs
    - generator and yield
      - https://esdiscuss.org/topic/does-async-await-solve-a-real-problem#content-2
- router
  - http://www.christianalfoni.com/articles/2015_08_20_What-if-the-adddressbar-worked-like-an-input
    - https://github.com/christianalfoni/reactive-router
    - https://github.com/cerebral/addressbar
    - https://github.com/cerebral/url-mapper
