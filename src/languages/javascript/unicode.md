- https://dmitripavlutin.com/what-every-javascript-developer-should-know-about-unicode/
- https://mathiasbynens.be/notes/javascript-unicode
- https://blog.jonnew.com/posts/poo-dot-length-equals-two
- https://flaviocopes.com/javascript-unicode/
- http://simonsapin.github.io/wtf-8/
- https://stackoverflow.com/questions/25292855/counting-unicode-characters-in-javascript

## UCS-2 or UTF-16 or WTF-8

You could argue that it resembles UTF-16, except unmatched surrogate halves are allowed, surrogates in the wrong order are allowed, and surrogate halves are exposed as separate characters. I think you’ll agree that it’s easier to think of this behavior as “UCS-2 with surrogates”.

https://mathiasbynens.be/notes/javascript-encoding