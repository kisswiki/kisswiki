- http://blog.jenkster.com/2016/04/how-i-structure-elm-apps.html

> elm community is moving away from "components" structure (each with its own Model. update, view) like in Brian Hick's blog post). Instead, the common practice is to have a "flat" structure. It is explained well here in the official guide https://guide.elm-lang.org/reuse/. My favorite (bigger) example is the time tracker SPA https://github.com/knewter/time-tracker, which also includes routing (but not HOP)
> -- http://stackoverflow.com/questions/40343959/route-to-another-page-from-a-sub-page#comment67966169_40356258

<br>

> In the SPA I developed https://github.com/knewter/time-tracker, I started out with a simple structure with Main.elm, Update.Elm, Msg.elm, Model.elm.
>
> At some point I needed a datepicker, and built one with Elm. I started of with a DatePicker.elm module, which I put inside a separate Views folder.
The DatePicker also required some additional messages: HandleUpMonth, HandleDownMonth, DateSelected Date. And somewhere in my update, these messages need to be handled. And somewhere in my model, I needed to keep track of the currentMonth, in view in the DatePicker. (so the DatePicker view knows which month to display).
I started out by simply adding stuff to Msg.elm, Update.elm and Model.elm.
Putting the extra info in the model at the highest level on purpose. So my structure remained flat, not nested.
>
> In the next round, I found out that actually processing the selected date required quite a bit of code, to do the correct validations, update the right record in my data structure, and close my DatePicker page.
>
> This was related to the data update, not to the DatePicker, so I created a separate module for Exams, which handles the validation and updates for the exam.
>
> The nice thing about scaling in this way, is that the compiler has your back: once you add messages in Msg.elm, the compiler will complain that you need to change something in your Update.elm, because not all Msg are handled there. So it is not a big deal that your DatePicker view function and the related Msg are in different files. The compiler will protect their consistency.
>
> In short, the way I scale is simply:
> - Only put different pages in different view modules (and import them in the overall View.elm)
> - Everything else: simply put it in Msg.elm, Update.elm, etc. And only if one of these files becomes too big (300-400 lines is my threshold), take out stuff and put it in a separate module.
> By now, my app is getting pretty big. But it remains very managable.
I use the DatePicker now in several different places, and the flat structure still works for me
> -- https://groups.google.com/forum/#!topic/elm-discuss/Avuj3zLTVwk

<br>

>The pure version is indeed more aligned with the current recommendations but it is almost as bad from a library user point of view.
In the 5 months since this pattern emerged I have not seen an explosion of "not-a-component" libraries that follow it.
>
>-- https://groups.google.com/forum/#!msg/elm-discuss/y1CVQpQpRcc/r6PTWmEGCwAJ

<br>

>I would want to move all of the view code to a new module, exposing only the view function itself. In order to do that, you'll have to move the definition of Model and Msg to a module imported by both Main and View. You can call this module Common. I think the initial model belongs next to its definition, in Common. I wish there was a way to keep Msg near update but View needs it too.
If you have many helper functions that called from update directly, those can live in Main. If you have many helpers that are only called from other helpers, try to find the small interface update needs, expose that, and hide the rest.
>
>-- https://groups.google.com/d/msg/elm-discuss/cf_Gx9q3aJU/qgKq7Ut5CgAJ
