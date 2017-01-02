
## SVG USE

>Inline SVG is an awesome way to use SVG because, among other reasons, the individual shapes that make up the graphic can be scripted and styled. The shapes are right in the DOM. But does that mean we have to define those shapes right in the HTML on every page? Nope, we can <use> to reference them from elsewhere. Ideally, that "elsewhere" is an external file, because that means that file can be cached by the browser, efficiency!
>
>SVG for Everybody https://github.com/jonathantneal/svg4everybody. The idea is this: just use <use> as if it works, and the script will handle it in IE 9, 10, 11. A polyfill, except just for this scenario (it doesn't make this work anywhere that doesn't already support inline SVG use).
>
> example https://css-tricks.com/examples/svg-for-everybody/
>
>-- https://css-tricks.com/svg-use-external-source/

<br>

>SVG references this way has it's own separate DOM. It goes beyond the regular Shadow DOM boundary that all <use> is subject to.
>
>you can't style individual shapes like you could before
>
>-- https://css-tricks.com/svg-use-with-external-reference-take-2/

or not? https://www.html5rocks.com/en/tutorials/webcomponents/shadowdom-201/

<br>

>`symbol` elements define new viewports whenever they are instanced by a `use` element.
>
>-- https://sarasoueidan.com/blog/structuring-grouping-referencing-in-svg/

Some remarks:

- viewport is important
- if icon not centered use svgo https://github.com/svg/svgo or center somehow with options
- styling https://tympanus.net/codrops/2015/07/16/styling-svg-use-content-css/
- filter works https://developer.mozilla.org/en-US/docs/Web/CSS/filter
- enable shadow dom in google chrome inspector
- https://css-tricks.com/using-svg/

## SVG clean

- svgo
- http://stackoverflow.com/questions/9009305/what-are-some-options-for-optimizing-svg
- https://github.com/codedread/scour http://wiki.inkscape.org/wiki/index.php/Save_Cleaned_SVG
- remove meatada, rdf etc.
  - remove `standalone` http://stackoverflow.com/questions/5578645/what-does-the-standalone-directive-mean-in-xml
  - remove `version` http://stackoverflow.com/questions/18467982/are-svg-parameters-such-as-xmlns-and-version-needed

## SVG color

- https://css-tricks.com/cascading-svg-fill-color/

## SVG scale

Cannot set stroke inside yet set and want to have the same width and height for two shapes no mater if there is stroke on one.

http://stackoverflow.com/questions/7241393/can-you-control-how-an-svgs-stroke-width-is-drawn/28787545#28787545

So wrapping with div. To scale svg to div, viewport must be added.

To scale svg to enclosing element, there must be viewport attribute in svg.

https://css-tricks.com/scale-svg/

## SVG stroke inside

>The stroke-alignment attribute was on April 1st moved to a completely new spec called SVG Strokes.
>No browser support this property, or, as far as I know, any of the new SVG 2 features.
>There seems to be some issues as to how to the property should behave on open paths as well as loops. These issues will, most probably, prolong implementations across browsers.
>
>http://stackoverflow.com/questions/7241393/can-you-control-how-an-svgs-stroke-width-is-drawn/28787545#28787545

- https://github.com/Fyrd/caniuse/issues/1772

```svg
<svg style="background: light-blue;" height="500" width="500"> <circle cx="250" cy="250" r="250" stroke="black" stroke-width="10" stroke-alignment="inner" fill="none" /> </svg>
```

## SVG coordinates

- https://sarasoueidan.com/blog/svg-coordinate-systems/

## SVG

- https://css-tricks.com/icon-fonts-vs-svg/

>we’ve landed on directly injecting the SVGs directly in our page markup. This allows us the flexibility to change the color of the icons with CSS using the fill: declaration on the fly.
>
>External .svg — We first attempted to serve a single external “svgstore”. We’d include individual sprites using the <use> element. With our current cross-domain security policy and asset pipeline, we found it difficult to serve the SVG sprites externally.
>
>-- https://github.com/blog/2112-delivering-octicons-with-svg

<br>

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

>Fonts also have special characters called ligatures—subtle, often hardly noticeable, tweaks to the letterforms that are used to aid reading. Take, for instance, two consecutive “f” characters. A good font will convert that “ff” into a single ligature where the fs connect smoothly. There are several standard ligatures, including ff, fl, and fi. But there is no reason you can’t also define your own. In a font file, it is a simple substitution; all the ligature is looking for is the right sequence of letters. When they’re typed, they are replaced with another glyph. This means you can have a string like “A List Apart” and convert it into a single symbol icon of the logo.
>
>-- http://alistapart.com/article/the-era-of-symbol-fonts

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
- social svg icons https://alexpeattie.com/projects/justvector-icons
- https://icomoon.io/
  - https://github.com/Keyamoon/IcoMoon-Free
- https://materialdesignicons.com/
- http://zurb.com/playground/foundation-icon-fonts-3
- http://ionicons.com/
- https://octicons.github.com/
- http://glyphsearch.com/
- https://thenounproject.com/
  - >The noun project is multiple ind invidual images by different authors in different styles. Many are not open source / public domain. Many are CCA and need attribution on your site which could get extensive after using many of them. https://www.reddit.com/r/web_design/comments/58c9wg/font_awesome_5_kickstarter/d8znp2g/
- http://iconmonstr.com/
- social icons https://github.com/larsenwork/web.svg.min
- Each icon is hand-coded along a 32x32 grid, and uses SVG stroke allowing for maximum style flexibility; meaning you can adjust the weight, color, size, and if you want the edges to be round or square. https://github.com/danklammer/bytesize-icons
- https://github.com/iconic/open-iconic
  - https://www.kickstarter.com/projects/207474036/iconic-advanced-icons-for-the-modern-web
- http://glyphicons.com/
  - https://github.com/twbs/bootstrap-sass/blob/master/assets/fonts/bootstrap/glyphicons-halflings-regular.svg
### Creating set

- http://fontello.com/
- http://fontastic.me/

>Don't include all the icons then. I parse my CSS file (I embed content:"\f..." strings instead of fa-... classes) to see what I'm actually using and then hack up the font file to only include those characters. The how is a little technical but I've gone through it here: http://askubuntu.com/q/557980/449
>
>-- https://news.ycombinator.com/item?id=12787048

<br>


>You should be able to extract the SVG really easily from the fontawesome-webfont.svg file, and colorize those with simple css e.g. fill: #ff0; The svg font file contains SVG path elements as glyph elements.
>
>We're doing a lot more than just SVG support. Our goal is to make them as easy to use as icon fonts. That means you can auto-inherit color, size, drop-shadow, etc. And more.
(And the SVG font file format automatically flips the icons. So you'd need to invert. TOTALLY doable, if with a good bit of effort.)
>
>But how often do people share attributes between fonts and icons? And how often do you need to inherit attributes that way?
>
>-- https://news.ycombinator.com/item?id=12780510

## Fontawesome

- http://fontawesome.io/
- commercial monthly payment https://fortawesome.com
- many not resolved requests for free version https://github.com/FortAwesome/Font-Awesome/issues?q=is%3Aissue+is%3Aopen+sort%3Acomments-desc
- >I don't use FA's hosting anymore since they switched to that annoying javascript loading crap. https://www.reddit.com/r/web_design/comments/58c9wg/font_awesome_5_kickstarter/d9blrlz/

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

#### 16px

>why it's necessary to redesign the set though.
>
>16px grid system is the biggest reason. Currently, FA is at 14px. To do it pixel-sub-perfect, we'll need to do it all from scratch.
Oh, and the icons aren't that consistent. It happens over time as you do 40-ish icons per release. It wanders a bit and you lose consistency.
>
>-- https://news.ycombinator.com/item?id=12780543

#### vertical centering

>the grid system in 4 is quite inconsistent, especially with vertical centering.
>
>Really happy that this will be addressed.
>
>-- https://news.ycombinator.com/item?id=12780683
