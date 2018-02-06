https://elmlang.slack.com/archives/general/p1484202446013584

jessta:

`fullscreen()` is generally a bad idea anyway, better to `embed` on a div

having Elm handle `<body>` will make it difficult for your page to work with any third-party scripts that want put anything in the DOM

your users might also be using browser extensions that add something to the DOM
