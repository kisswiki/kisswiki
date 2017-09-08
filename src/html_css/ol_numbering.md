```html
 <body>
 <ol>
  <li>one</li>
  <li>two
  <ol>
   <li>two.one</li>
   <li>two.two</li>
   <li>two.three</li>
  </ol>
     </li>
  <li>three 
  <ol>
   <li>three.one</li>
   <li>three.two</li>
    <ol>
     <li>three.two.one</li>
     <li>three.two.two</li>
    </ol>
   </ol>
     </li> 
  <li>four</li>
  </ol>
```

```css
OL { counter-reset: item }
LI { display: block }
LI:before { content: counters(item, ".") ". "; counter-increment: item }
```

- http://jsfiddle.net/qGCUk/538/
  - https://stackoverflow.com/questions/10405945/html-ordered-list-1-1-1-2-nested-counters-and-scope-not-working
