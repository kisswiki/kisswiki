https://elmlang.slack.com/archives/general/p1484198736013574

jessta: you might try using `Html.keyed` module and put a key on the div element, when you change the key you can be sure the element will be removed and not reused.

<br>

https://elmlang.slack.com/archives/general/p1484218749013609

felix:

the src changes depending on user interaction, think of it like a meme generator or t-shirt color selection, where I want to hide the previous image until the new one is fully loaded (edited)
 
is there some other property I can set on the image that will let the browser discard the old img tag?

jessta:

you can use the Html.Keyed module to add a key to the element, and change it when you change the img src so virtual-dom replaces the DOM node
