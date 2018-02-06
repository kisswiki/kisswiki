https://www.reddit.com/r/elm/comments/5jd2xn/how_to_structure_elm_with_multiple_models/dbkgs2h/


In Elm, thinking in terms of "components" is a common and totally understandable mistake. :)
Elm intentionally does not have a component system, because that idea is counterproductive in Elm. The official guide makes this explicit, and talks about what to do instead of thinking in terms of components:

https://guide.elm-lang.org/reuse/

You mentioned earlier that your definition of "component" in Elm is something that has its own Model, Msg, and update.
If I think "here is a part of my UI that is logically separate from other parts, so I'll give it its own Model, Msg, and update" then I am either (worst case) making my code more complex than it needs to be, or (best case) making it exactly as complex as I would have if I'd never been thinking in terms of "components." There's no scenario where I come out ahead.
Maybe I needed a separate Msg type...and maybe I didn't. My code would have been simpler if I didn't impose that communication overhead on myself, and maybe I didn't need to. Maybe I needed a separate update function and maybe I didn't. Maybe I didn't even need a separate model; maybe a view function would have sufficed in this case.
Adopting the mindset that it's fine to introduce the maximum amount of complexity possible, whenever I want to logically separate parts of my UI, is counterproductive. It's better to do the opposite: to introduce the minimum amount of complexity necessary when I want to logically separate parts of my UI.

Here's my general advice.
First, start with one Model, one Msg type, one update function, and one view function, and then start building things.
When Things Get Too Big

When things start getting big and unwieldy, the key is to treat one symptom at a time. If something has gotten too big, split up just that one thing, without splitting up any of the other parts.
When view Gets Too Big

Almost always the view function is the first one to get this treatment. It starts getting big, so you split out a function called something like viewSidebar : User -> Html Msg to handle just the sidebar rendering logic. These split-out view functions can take Model, but they don't have to; maybe the sidebar only uses the User that's held inside Model, so you only pass it that.
Ideally you pass it only what it needs, but to be fair, that's more work than passing it more than it needs...and it's pretty easy to refactor later if you pass it the whole Model at first even though it doesn't need all that.
When Model Gets Too Big

The same strategy applies to splitting up a big Model. If Model is a record that feels like it's too big, you can split that record into smaller records. Again, you do this without splitting view, update, or Msg. You'll still have to change view and update to reflect the new Model structure - e.g. changing model.accountUsername and model.accountUrl to model.account.username and model.account.url - but that's it.
When Msg Gets Too Big

The same strategy applies to Msg. If Msg feels like it has too many constructors, find some that can be logically grouped together and then split them out into another Msg.
It doesn't even need to be in a separate file! You can take type Msg = SetUsername String | SetPassword String | Foo | Bar | Baz and split it into type Msg = UserMsg UserMsg | Foo | Bar | Baz and then define type UserMsg = SetUsername String | SetPassword String right below.
Once again, you'll have to update how you're calling these. onInput SetPassword will become onInput (UserMsg << SetPassword) and you'll move the parts of update that now live under UserMsg into a function like updateUser : UserMsg -> Model -> ( Model, Cmd Msg ) which update will call in the UserMsg branch like so: UserMsg subMsg -> updateUser subMsg model
Note how the type of updateUser is identical to the type of update except for its first argument, which is a UserMsg instead of Msg - the only symptom we're treating here is that we had more constructors than we wanted in Msg. So there is no need to make updateUser do anything more than handle the UserMsg cases that we split off from Msg. We could have made it return ( Model, Cmd UserMsg ) but that has the downside of forcing update to call Cmd.map UserMsg on the result, and there's no corresponding upside. We'd just be making life harder for ourselves.
When update Gets Too Big

Now if you feel like update itself is too long, but not because Msg has too many constructors, you can split whatever branches of its case-expression feel too big into smaller helper functions.
Summary

These are the techniques I recommend using for dealing with problems of "____ is too big and I want to split it up." The key again is to treat one symptom at a time.
If what you're dealing with is not a desire to split up something big, but rather to make something reusable, then you want a different set of techniques - specifically these: http://guide.elm-lang.org/reuse/

>The problem with your reasoning is that you could say something similar to argue against functions. Plain functions also add some complexity in that you have to name the function, define its types, and write it to work in a general case. There are a few good reasons for turning some chunk(s) of code into a function: 1. Because you'll want to repeat that functionality multiple times, 2. You want to remove the chunk of code so the hosting function is cleaner and less bloated, 3. You want to separate out the logic of something complex so you can build and test it separately.
>
>Components help with all three of these points when you are dealing with functionality that essentially has its own private state machine (model/Msg/update). Components help you decouple and reuse such complex functionality, helps keep your update functions and Msg types much cleaner, and helps you to build and test functionality separately.
>There are things that are just represented very well as components, and to try to include them in some non-component way is often confusing, less reusable, results in bloated code, and is harder to test. But by embracing component style, as a community, when it's appropriate, we can standardize how to represent and connect components and also make nice abstractions to make using them easier.

I've worked on Elm code bases that embraced the philosophy you're advocating, as well as on Elm code bases that rejected it. The code bases that rejected it were way nicer to work with.
What you're saying sounds reasonable on paper, but my experience has been the opposite. I've heard the same thing from multiple people who have tried it both ways on different code bases: the "component" mindset leads to worse Elm code. It's overcomplicated, bloated with unnecessary wiring, and more time-consuming to work with.
You are of course free to believe whatever you like, but I'm going to follow what my experience and the experience of others has told me leads to the best code. That includes trying to steer people away from cliffs so they don't have the same bad experiences I did when I naively embraced the notion of "Elm components" in the past.
