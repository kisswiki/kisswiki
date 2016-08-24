- raw-reactjs router
- https://www.reddit.com/r/reactjs/comments/3yjix3/explain_like_im_a_child_stateless_functional/
- https://www.reddit.com/r/reactjs/comments/3yh1nv/should_i_use_reactcreateclass_es6_classes_or/
- usages - http://builtwithreact.io/
- Dan Abramov (gaearon) on Facebook's PATENTS clause https://www.reddit.com/r/reactjs/comments/4ybhzw/

  > Facebook needs to find a patent that they own that relates to React to sue you for using React.
If they didn't give you the patent grant in the first place, they could do that anyway. In fact anyone with a patent that relates to React could sue you for using React.

- testing
  - If you are using jsdom make sure you are creating the correct globals in the environment before any requires of React [source](If you are using jsdom make sure you are creating the correct globals in the environment before any requires of React) [source](https://github.com/facebook/react/issues/5046#issuecomment-146222515)
  - https://egghead.io/series/react-testing-cookbook
  - http://teropa.info/blog/2015/09/10/full-stack-redux-tutorial.html
 - better than redux?
  - https://engineering.heroku.com/blogs/2015-12-16-react-refetch/
- learn
  - https://github.com/petehunt/react-howto
  - books
    - Pro React http://www.apress.com/9781484212615
- RactDOM vs https://groups.google.com/d/msg/scala-js/Z-8O2TtQJ0Q/oKW8TxVjBgAJ
 - with RxJS
  - https://medium.com/@garychambers108/functional-reactive-react-js-b04a8d97a540
  - http://www.aryweb.nl/2015/02/16/Reactive-React-using-reactive-streams/
- immutability
  - https://github.com/arqex/freezer
- https://github.com/nmn/react-infinity
- http://airbnb.io/infinity/
- pros/cons
  - pros
    - [smart approach](https://www.reddit.com/r/javascript/comments/3zr6i0/conversation_whats_the_core_differences_between/cyohtnu)  
      I think React + Reactive Strems via bacon.js or something is great (currently loving elm).  
      However, I think React is smart in that their approach brings a lot of benefits of functional programming in a very approachable way. It lets you move things over gradually, maintain components, and feels very "familiar" which helps with adoption.  
      Personally, I started with Angular, moved to React due to the hype, learnt Flux really well, saw where the concepts came from, and started learning Elm. I think this is a really great path, but I don't think I would have ever checked anything out if React enforced full FRP all the time.  
      In my mind, it's the natural path to take, but React nails adoptability. Relatively familiar, can implement incrementally. I would even go as far to say React is responsible for the huge surge in interest around FRP lately, even though FRP solutions have been around longer.  
      In fact, it's easy to imagine doing this...the Redux docs even state:  
      The question is: do you really need Redux if you already use Rx? Maybe not. It’s not hard to re-implement Redux in Rx. Some say it’s a two-liner using Rx .scan() method. It may very well be!
  - cons
    - https://www.reddit.com/r/javascript/comments/3zcdky/what_are_the_cons_of_react/
    - First of all RxJS Observables are not event buses. RxJS Subjects are event buses, and these are known to be frowned upon, people are supposed to avoid using them. Second, Flux's Dispatcher is an Event Bus, so whatever disadvantages you attribute to event buses apply to Flux. Read more http://staltz.com/nothing-new-in-react-and-flux-except-one-thing.html https://www.reddit.com/r/javascript/comments/3zr6i0/conversation_whats_the_core_differences_between/cypclav
    - http://staltz.com/nothing-new-in-react-and-flux-except-one-thing.html
 - components
  - https://github.com/MattMcFarland/react-markdown-area
 - internationalization
  - http://blog.getsentry.com/2016/01/07/react-i18n.html
- svg
  - https://www.smashingmagazine.com/2015/12/generating-svg-with-react/
- vs
  - Elm, Cycle.js
    - Elm and Cycle are similar, but still have important facts:
    - Elm has only first-order Signals, Cycle which uses RxJS supports higher-order Observables (meaning: Observable of Observables).
    - Elm ports and Cycle drivers are essentially the same concept.
    - Elm Arch utilizes Signals at the extremes (for input and for output), but not that much in between. Cycle.js uses Signals/Observables at the extremes but also in between, extensively.
    - Elm follows the React way when it comes to event handlers: they are specified and attached to the virtual DOM element. In Cycle.js, the virtual DOM elements we create in the app never have event handlers attached to them. This gives a clear separation of what exits the system (HTML without event handlers) and what enters the system (events through an event delegation system). In Elm and React, what exits the system is a data structure that has callbacks to return to the system.  

    To compliment some points you mentioned: indeed React is only "reactive" with regard to rendering. Render happens when state or props changes. Other parts are not reactive. In Redux and Flux, the Store however is "observable" by components. And the Dispatcher is observable by the Store.  

    React is in fact clearly multiparadigm: it uses OOP as a the main building block (for components), uses reactive pattern for its advertised "one-way data flow" from state to rendering, uses functional pattern with regard to "UI as a pure function of state". It is not properly seeking to be functional because it does not make effects explicit and push effects to the boundary of the application. They may be spread out in the application and there is no prescribed interface for effects. (Both Elm and Cycle have prescribed interfaces for effects: ports/drivers. Elm is strict about purity, Cycle cannot be because it is JavaScript, so purity is a matter of discipline). Conclusion: I disagree with your claim that React is plain FP. It's not.  

    Discussion point: why are we not aiming to using a true FRP approach?
    Beats me. React's multiparadigm confusion plus its almost unanimous praise really intrigues me.  

    https://www.reddit.com/r/javascript/comments/3zr6i0/conversation_whats_the_core_differences_between/cyoj29a
- starter kit/boilerplate
  - https://github.com/mxstbr/react-boilerplate
- elm-inspired redux modification https://github.com/raisemarketplace/redux-loop
- [ ] https://engineering.heroku.com/blogs/2015-12-16-react-refetch/
- [ ] React.js Conf 2016 - Aditya Punjani - Building a Progressive Web App https://youtu.be/m2tvYGCdOzs
- [ ] http://www.sitepoint.com/getting-started-react-jsx/
- [ ] https://github.com/markerikson/react-redux-links
- [ ] https://github.com/skellock/reactotron
- [ ] https://github.com/react-materialize/react-materialize

## Pass argument to onChange functional

### bind

```javascript
onChange={props.onChange.bind(null, current.id)}
// ...
function update(id) {
}
```

We can preset multiple arguments `props.onChange.bind(null, current.id, current.name)`.

And we still have access to event

```javascript
onChange={props.onChange.bind(null, current.id)}
// ...
function update(id) {
}
```

but

> performance of reading data-attributes compared to storing this data in a JS data warehouse is poor. Using dataset is even slower than reading the data out with getAttribute().
https://developer.mozilla.org/en/docs/Web/Guide/HTML/Using_data_attributes

but

> A bind call or arrow function in a JSX prop will create a brand new function on every single render. This is bad for performance, as it will result in the garbage collector being invoked way more than is necessary. https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-no-bind.md

## value

```javascript
value={current.id} onChange={props.onChange}
// ...
function update(event) {
  var id = parseInt(event.target.value);
}
```

## value

```javascript
value={current.id} onChange={props.onChange}
// ...
function update(event) {
  var id = parseInt(event.target.value);
}
```

## data-*

```javascript
data-id={current.id} onChange={props.onChange}
// ...
function update(event) {
  var id = parseInt(event.target.dataset.id);
}
```

## RxJS

- [ ] https://www.reddit.com/r/reactjs/comments/30w2o5/anybody_used_rxjs_with_react/
- [ ] https://www.reddit.com/r/reactjs/comments/3ruqw2/rxjs_or_kefir_worth_it_with_react/
- [ ] https://github.com/Cmdv/React-RxJS
- [ ] https://www.codementor.io/reactjs/tutorial/using-rxjs-to-create-a-scroll-table-with-adjustable-width
- [ ] https://github.com/fdecampredon/react-rxjs-todomvc
- [ ] https://github.com/zxbodya/rx-react-container
- [ ] http://qiita.com/kimagure/items/22cf4bb2a967fcba376e
- [ ] https://github.com/justinwoo/react-rxjs-flow
- [ ] https://medium.com/@milankinen/containers-are-dead-long-live-observable-combinators-2cb0c1f06c96#.usr4b52sg
- [ ] http://michalzalecki.com/use-rxjs-with-react/
- [ ] https://github.com/acdlite/recompose/tree/master/src/packages/rx-recompose

## checkbox and radio buttons

Potential Issues With Checkboxes and Radio Buttons
Be aware that, in an attempt to normalize change handling for checkbox and radio inputs, React uses a click event in place of a change event. For the most part this behaves as expected, except when calling preventDefault in a change handler. **preventDefault stops the browser from visually updating the input, even if checked gets toggled**. This can be worked around either by removing the call to preventDefault, or putting the toggle of checked in a setTimeout.

https://facebook.github.io/react/docs/forms.html

Side note: avoid defaultChecked/defaultValue and use checked/value with onChange instead. http://stackoverflow.com/questions/27750864/conditionally-setting-html-attributes-in-react-js/27750979#27750979

http://stackoverflow.com/questions/10610249/prevent-checkbox-from-ticking-checking-completely

https://jsfiddle.net/rofrol/4pLjm8hu/1/

## CSS

- http://engineering.khanacademy.org/posts/aphrodite-inline-css.htm
- `:local` and css-loader
  - https://www.facebook.com/groups/972937362726271/permalink/1211423268877678/
  - https://github.com/MichalZalecki/react-the-boring-part/blob/master/src/components/App.jsx
  - https://github.com/webpack/css-loader
- css-modules and server-side rendering https://github.com/css-modules/css-modules/issues/9
- https://webpack.github.io/docs/stylesheets.html
- Use 'Local scope' in isomorphics code https://github.com/webpack/css-loader/issues/59
- https://github.com/kriasoft/isomorphic-style-loader

## Stateless functional components

- Props http://buildwithreact.com/article/stateless-functional-components
- example http://jsbin.com/xowixu/edit?js,console
