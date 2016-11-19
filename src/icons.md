## SVG

>I'm not sure why an icon font would be easier to use than SVGs. Yes, you only have to reference a file once (the font file), but that actually makes it more difficult to use, because now you have to remember two things: how to reference the file, and how to reference the icon.
With SVG, it's simpler, because everything is usually contained in one CSS rule. Yes, it has a reference to a file, but does that matter from the viewpoint of simplicity? I.e., make another icon? Then just copy a CSS rule and edit it.
Also, using an icon font makes it difficult to substitute a single icon by another icon. Suddenly, you have to start rearranging your CSS. With SVGs not so: just edit the referenced url.
>
>-- https://news.ycombinator.com/item?id=12780271

## Litgature icons

>ligatures is a better way to load icons as it gives contextual meaning to search engines. https://css-tricks.com/ligature-icons/
>
>-- https://www.reddit.com/r/web_design/comments/58c9wg/font_awesome_5_kickstarter/d90fmyc/

<br>

>This example uses a typographic feature called ligatures, which allows rendering of an icon glyph simply by using its textual name. The replacement is done automatically by the web browser and provides more readable code than the equivalent numeric character reference.
>
>-- http://google.github.io/material-design-icons/

<br>

>Pseudo elements (i.e. ::before and ::after) have been a big help to me when creating sites, so I came up with an approach for using them alongside ligature icons to create more readable and maintainable code.
>
>-- https://css-tricks.com/ligature-icons/

## Sets

- https://www.reddit.com/r/webdev/comments/564btf/open_source_material_design_iconic_font/
- create custom font from many sets http://fontello.com/
- social svg icons https://alexpeattie.com/projects/justvector-icons
- https://icomoon.io/
- https://materialdesignicons.com/
- http://zurb.com/playground/foundation-icon-fonts-3
- http://ionicons.com/
- https://octicons.github.com/
- http://glyphsearch.com/

## Fontawesome

- http://fontawesome.io/
- commercial monthly payment https://fortawesome.com
- many not resolved requests for free version https://github.com/FortAwesome/Font-Awesome/issues?q=is%3Aissue+is%3Aopen+sort%3Acomments-desc

>I just wonder how licensing for the pro version works in regards to open source projects? If I buy the license, can I use it for my open source project?
>
>I'd say just don't put the commercial version in a public code repo where other folks could easily use it
>
>-- https://news.ycombinator.com/item?id=12780271

### kickstarter campaign

- https://www.kickstarter.com/projects/232193852/font-awesome-5
- 20 USD (early bird) for fontawesome pro - personal/small business - cannot have both for business and personal
- more icon sets
- svg framework - in open source license only basic svg
- voting
- https://www.reddit.com/r/webdev/comments/595n9i/if_nothing_else_font_awesome_5_deserves_to_be/
- https://www.reddit.com/r/web_design/comments/58c9wg/font_awesome_5_kickstarter/
- https://news.ycombinator.com/item?id=12780271

>You should be able to extract the SVG really easily from the fontawesome-webfont.svg file, and colorize those with simple css e.g. fill: #ff0; The svg font file contains SVG path elements as glyph elements.
>
>We're doing a lot more than just SVG support. Our goal is to make them as easy to use as icon fonts. That means you can auto-inherit color, size, drop-shadow, etc. And more.
(And the SVG font file format automatically flips the icons. So you'd need to invert. TOTALLY doable, if with a good bit of effort.)
>
>But how often do people share attributes between fonts and icons? And how often do you need to inherit attributes that way?
>
