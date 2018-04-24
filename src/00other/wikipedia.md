- https://commons.wikimedia.org/wiki/Category:Image_placeholders_in_English
- https://userstyles.org/styles/105844/wikipedia-dark-st
- https://chrome.google.com/webstore/detail/m-wiki/ibnmikddaopgfbbngcgcfmanjfgbcopf

## Parse markup

I've also had to parse Wikitext. The fact that there are 54 parsers in various states of disrepair listed here (and I have written a 55th) is not because people really like reinventing this wheel; it's because the complete task is absolutely insurmountable, and everyone needs a different piece of it solved.
The moment a template gets involved, the structure of an article is not well-defined. Templates can call MediaWiki built-ins that are implemented in PHP, or extensions that are implemented in Lua. Templates can output more syntax that depends on the surrounding context, kind of like unsafe macros in C. Error-handling is ad-hoc and certain pages depend on the undefined results of error handling. The end result is only defined by the exact pile of code that the site is running.

If you reproduce that exact pile of code... now you can parse Wikitext into HTML that looks like Wikipedia. That's probably not what you needed, and if it was, you could have used a web scraping library.

It's a mess and Visual Editor has not cleaned it up. The problem is that the syntax of Wikitext wasn't designed; like everything else surrounding Wikipedia, it happened by vague consensus.

https://news.ycombinator.com/item?id=16907119


I hit the same thing recently, but that's basically what Wikidata was founded for - and I'm sure it has the latest version of macOS. It's really easy to fetch Wikidata data using the Wikidata API (my example: https://gitlab.com/Flockademic/whereisscihub/blob/master/index.js#L122)

If you're just interested in a single value, using the SPARQL endpoint[0] is probably still more simple, since you don't have to filter out deprecated statements, for example.
[0] http://tinyurl.com/ya957wem

Unfortunately that data isn't granular enough for what I need: I'm looking for the build number, which Wikipedia somehow keeps up to date.

https://news.ycombinator.com/item?id=16902141