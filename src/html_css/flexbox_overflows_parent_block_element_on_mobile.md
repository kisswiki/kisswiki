Problem: wrapper div over flexbox has set width to viewport.

But flex children have set `min-width: 300` and they overflow wrapper.

Solution is to add `overflow: auto` to wrapper.

>you can use overflow-y: auto on the parent container, if scrolling doesn't matter you"

https://stackoverflow.com/questions/50068078/how-to-prevent-flex-items-from-overflowing-flex-parent-with-no-wrap/50068141#50068141

>How about putting overflow:auto; on the .box-grow

https://stackoverflow.com/questions/41674979/flex-child-is-growing-out-of-parent/41675925#41675925

>You're forcing your child elements to have a specific width, much like @Michael_B mentioned, this essentially creates a static environment where they will remain the set width regardless of the parent.
>
>Essentially at this point, since you know the min-width of your children elements, I would create a media query, at the specific width requirement, which in this case is 100px. Once your screen reaches said size, force your parent to have wrapping items by adding flex-wrap: wrap; to your parent. When you're outside the said width, be sure to set your parent's CSS back to not allow wrapping, flex-wrap: nowrap; . This will allow your child items to wrap, and your parent will create a horizontal to the page.

https://stackoverflow.com/questions/50068078/how-to-prevent-flex-items-from-overflowing-flex-parent-with-no-wrap/50068702#50068702

>You're asking for the container to re-size fluidly in order to prevent the child elements from overflowing. This is dynamic behavior, which is the realm of JavaScript, not HTML or CSS.
>
>Because the HTML and CSS rendering engines do not automatically re-flow the source documents when child elements overflow their container, there is no way for the container to know when the children have overflowed and, therefore, expand. You're in a static environment. The concept applies to wrapping, as well.
>
Here's a more detailed explanation (that covers wrapping behavior, but applies to overflow, as well):
>
>Make container shrink-to-fit child elements as they wrap
You'll need a script or possibly media queries to make your layout work as desired.

https://stackoverflow.com/questions/50068078/how-to-prevent-flex-items-from-overflowing-flex-parent-with-no-wrap/50105308#50105308