My experience of late is that I’ve been building in a lot of ‘just in case’ that isn’t worth the hassle. If I ever do actually need to change that thing I can just do it. The reality is there will be less time spent doing that than building for a whole load of unlikely what ifs. For example, you can continue to change the roots size of text, even after the initial site is built and shipped but how often do you need to do that, really?
Plus if you’re using variables to provide consistent sizing it’s pretty easy to alter sizes throughout an entire design whether px, rem, or otherwise.

https://benfrain.com/just-use-pixels/

So please do yourself a favour and trash your “rem” lengths and use pixel instead! The best practice today, which is also obvious due to the promotion and placement of today’s browser user interfaces, is to use the zoom function if you are visually impaired. This will change the CSS reference pixel and the whole page will be zoomed including your pixel length, “em”, “rem” and everything else too.

https://mindtheshift.wordpress.com/2015/04/02/r-i-p-rem-viva-css-reference-pixel/

in most modern browsers zooming by default also enlarges the size of the CSS pixel/modifies the browser's interpretation of the dpr, so scalability is nowadays also achievable quite comfortably with px units. however, the missing part is that px units don't take into account browser/user default font size. as such, rem still win out.

https://github.com/twbs/bootstrap/issues/19943#issuecomment-224439306
