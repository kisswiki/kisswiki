 it's possible to make them happen, but most of the time you have to really understand Elm to make them happen. Unless you're using Array or Regex, of course. Both of these can lead to runtime exceptions - e.g Regex.regex "[a". However, you'll not likely run into that in production - unless you are taking using input as regex input.. which probably isn't a good idea unless you're escaping things.

 https://dev.to/rtfeldman/i-am-the-author-of-elm-in-action-ask-me-anything
