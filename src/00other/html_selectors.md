## querySelector find <div> by innerTEXT

```javascript
var headings = document.evaluate("//h1[contains(., 'Hello')]", document, null, XPathResult.ANY_TYPE, null );
var thisHeading = headings.iterateNext();

console.log(thisHeading); // Prints the html element in console
console.log(thisHeading.textContent); // prints the text content in console

thisHeading.innerHTML += "<br />Modified contents";  
```

https://stackoverflow.com/questions/37098405/javascript-queryselector-find-div-by-innertext
