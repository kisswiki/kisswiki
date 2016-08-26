```javascript
console.log('\334')                 // Ü
console.log('\xDC')                 // Ü
console.log('&#220;')               // &#220;
console.log('&Uuml;')               // &Uuml;
console.log(unescape('%DC'))        // Ü
console.log(decodeURI('%C3%9C'))    // Ü
document.write('\xDC')              // Ü
document.write('&#220;')            // Ü
document.write('&Uuml;')            // Ü
document.write(unescape('%DC'))     // Ü
document.write(decodeURI('%C3%9C')) // Ü
```

- https://r12a.github.io/apps/conversion/
- http://www.javascripter.net/faq/accentedcharacters.htm
- http://www.tuxlanding.net/how-to-display-the-accented-characters-in-javascript/
- URI is percent-encoding https://en.wikipedia.org/wiki/Percent-encoding
- https://en.wikipedia.org/wiki/List_of_Unicode_characters
- https://en.wikipedia.org/wiki/List_of_XML_and_HTML_character_entity_references
- https://www.w3.org/TR/html5/syntax.html#named-character-references

> UTF-8 represents code points above U+007F using more than one byte. So when you want ä (U+00E4), the UTF-8 representation is the two bytes C3 A4 and thus the percent-encoding is %C3%A4. A handy website that will help you with these conversions is
> http://stackoverflow.com/questions/2117942/twitter-sharing-problems-with-umlauts-%C3%A4-%C3%B6

> for a solution that correctly encodes all except safe & printable ASCII symbols in the input (including astral symbols!), and implements all named character references (not just those in HTML4), use the he library
> http://stackoverflow.com/questions/18749591/encode-html-entities-in-javascript/23834738#23834738
