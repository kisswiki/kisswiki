Html.lazy works by memoization, meaning that you’re using less CPU power at the cost of more memory usage. It’s also worth nothing that while reference equality is very cheap, it’s still something that is being done in addition to running the view function in the case where the arguments fails the equality test.

For view functions which are likely passed different arguments each time they’re called, you’re just wasting memory and adding overhead.

For view functions which are likely to be given the same argument every time they’re called, but are cheap to run, you’re using more memory for little benefit.

Html.lazy is an optimization and like all optimization, it involves trade offs.

Lazy should only be used when it’s known to have a good effect, and that is pretty hard for a compiler to know.

https://discourse.elm-lang.org/t/any-disadvantage-in-always-using-html-lazy/4086/17

##

It can also be useful to use lazy in long lists of items. In the TodoMVC app, it is all about adding entries to your todo list. You could conceivably have hundreds of entries, but they change very infrequently. This is a great candidate for laziness! By switching viewEntry entry to lazy viewEntry entry we can skip a bunch of allocation that is very rarely useful. So the second tip is try to use lazy nodes on repeated structures where each individual item changes infrequently.

https://guide.elm-lang.org/optimization/lazy.html

Also https://guide.elm-lang.org/optimization/keyed.html

##

In a project I’m working on I tried the following approach to do animations: store an animationClock : Float value in the top-level module and pass it down to the views that need it. This allows to not add an onAnimationFrame subscription each time I need an animation, but to use it only once at the top level.

Unfortunately, if I need animations everywhere and pass animationClock to most of the parts of the app, this approach basically makes Html.Lazy useless (because the value changes every frame), and the entire view tree (or most of it) must be recalculated on every frame.

It is still fast – I can’t really notice any performance issues visually. But since the view is recalculated on every frame, I can see high CPU usage all the time. To optimize this, I need to find a way to disable the subscription when no animations are running. It’s not that simple, for example some of the views that use animations are just stateless functions like spinner : Animation.Clock -> Element msg that show a loading spinner that just spins forever. So to disable the subscription I need to somehow know if there are any spinners rendered at the moment (and other views that require an animation).

If we used a similar technique like Svelte use (if I understand it correctly) we could evaluate the application’s view function only once during the compilation and detect which parts of it are static or dynamic, and changes to which parts of the Model affect which parts of the view. In this world there would be no need to do any optimizations in my example above, moreover I think Html.Lazy would not be needed anymore. Of course it’s not an easy task because it’s not possible to implement this on elm/virtual-dom level and it requires changes to the compiler, but would be cool :slight_smile:

https://discourse.elm-lang.org/t/could-updating-the-dom-directly-instead-of-the-virtual-dom-get-any-advantage-for-elm-the-way-it-does-for-svelte/3995/7
