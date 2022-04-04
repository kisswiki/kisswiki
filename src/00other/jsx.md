JSX - the syntax for HTML templates inside JavaScript http://2ality.com/2017/11/about-reasonml.html

##

- [use without react.js](http://stackoverflow.com/questions/30430982/can-i-use-jsx-without-react-to-inline-html-in-script/34262983)
- It’s such a tight coupling to the DOM  
  Well, not really, it is just a declarative syntax to describe components in a tree…Virtual? DOM?  
  We are describing how trees SHOULD look like, not fiddling with the DOM itself.  
  https://medium.com/@abhiaiyer/dear-templating-sincerely-jsx-part-1-1df99c599001
- https://medium.com/@housecor/react-s-jsx-the-other-side-of-the-coin-2ace7ab62b98
- JSX is an ugly artefact of legacy PHP and HTML spread into JS because Facebook runs (ran) on PHP https://github.com/jsforum/jsforum/issues/1 https://twitter.com/andrestaltz/status/653960734112673794
- https://www.facebook.com/notes/facebook-engineering/xhp-a-new-way-to-write-php/294003943919
- http://jamesknelson.com/wp-content/uploads/2016/05/jsx-cheatsheet.pdf
- https://github.com/streamich/jsx-plus-plus

##

> Because you sometimes want to filter, sort or project your data. Then you have to handle this in viewmodels >or invent more and more features for the templating language. Then you want to refactor into components. So >you need facilities for invoking subcomponents. Maybe you want something recursive to display tree-like >data.
>
> So you end up with a secondary full featured language usually with worse IDE support, worse error messages, >more surprising issues, etc. You need to understand the scoping mecanisms and if things go wrong hope there >is a debug tool available.
>
> And in the end those templating languages do not prevent you from mixing UI responsibilities from the rest >of your code.
>
> If you want a reactive model you can have one. I personally prefer explicit messages like calling setState.

> The idea that this type of thing should be happening anywhere near the view rendering loop is the exact >reason I've not had a great time picking up React codebases.
>
> By the time you're rendering data into markup, the data should be in the exact state you need it. No >further filtering or data mangling or sorting. That type of data manipulation should happen at the point of >data change and then it shouldn't happen again until the data changes again.
>
> The simplistic templating languages in Vue/Svelte/Alpine/whatever-comes-next force you to pull your data >manipulation back to somewhere more appropriate, with Vue even throwing a warning if you try to filter >within v-for construct.
>
> Because React is JS, people are let loose to do wildly inefficient operations and do them over and over and over whenever _anything_ in that component changes.

https://news.ycombinator.com/item?id=30512151
