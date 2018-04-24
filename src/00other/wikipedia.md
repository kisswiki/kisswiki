- https://commons.wikimedia.org/wiki/Category:Image_placeholders_in_English
- https://userstyles.org/styles/105844/wikipedia-dark-st
- https://chrome.google.com/webstore/detail/m-wiki/ibnmikddaopgfbbngcgcfmanjfgbcopf

## Parse markup

I've also had to parse Wikitext. The fact that there are 54 parsers in various states of disrepair listed here (and I have written a 55th) is not because people really like reinventing this wheel; it's because the complete task is absolutely insurmountable, and everyone needs a different piece of it solved.
The moment a template gets involved, the structure of an article is not well-defined. Templates can call MediaWiki built-ins that are implemented in PHP, or extensions that are implemented in Lua. Templates can output more syntax that depends on the surrounding context, kind of like unsafe macros in C. Error-handling is ad-hoc and certain pages depend on the undefined results of error handling. The end result is only defined by the exact pile of code that the site is running.

If you reproduce that exact pile of code... now you can parse Wikitext into HTML that looks like Wikipedia. That's probably not what you needed, and if it was, you could have used a web scraping library.

It's a mess and Visual Editor has not cleaned it up. The problem is that the syntax of Wikitext wasn't designed; like everything else surrounding Wikipedia, it happened by vague consensus.

https://news.ycombinator.com/item?id=16907119