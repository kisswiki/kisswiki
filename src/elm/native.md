- https://github.com/NoRedInk/take-home/wiki/Writing-Native#should-i-be-writing-native
- https://github.com/NoRedInk/take-home/wiki/Writing-your-first-Elm-Native-module
- https://elm-community.github.io/elm-faq/#why-doesnt-the-elm-compiler-find-the-native-code-in-a-module-that-i-cloned-from-github
- http://stackoverflow.com/questions/37039870/elm-native-with-multiple-arity
- https://elmseeds.thaterikperson.com/native-modules

>I prefer native modules since they produce modules that can be easily dropped into various projects without any additional setup
>
>It may sound like a good thing to package up code that "can be easily dropped into various projects without any additional setup" - but when the code in question is arbitrary JS, this reduces to "dangerous code that can easily infect various projects, making them more prone to crashing and hard-to-debug errors."
>
>JS doesn't have the same guarantees that Elm does. The practical consequence of this is that any JS library you use is going to be at a much higher risk of crashing or running bug-inducing side effects without warning.
>
>"Easy infection" of these maladies is a bug, not a feature. If your project wires in JS interop explicitly, either through ports or through Web Components installed separately on the page, then the project's list of error-prone JS dependencies is clear. If things go wrong, you can look to that list first rather than hunting through all your Elm modules for a hidden pathogen.
>
>I would not recommend trying to defeat Elm's intentional safety features. They are there to help, especially as projects become successful and grow. In my opinion, saving a tiny bit of wiring is not worth the potentially massive increased debugging cost you will be liable to pay later!
>
>-- https://www.reddit.com/r/elm/comments/5iju89/help_with_native_virtual_dom_modules/db8wfsm/
