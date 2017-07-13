If you want whitespace between elements which appear on different lines, you can either add some manually...

```jsx
<div id="wrapper">
  <span>1</span>{" "}
  <span>2</span>{" "}
  <span>3</span>
</div>
```

...or open new elements on the same line with whitespace between them (the JSX transpiler respects content between elements, just not linebreaks which are adjacent to elements):

```jsx
<div id="wrapper">
  <span>1</span> <span>2</span> <span>3</span>
</div>
```

- https://stackoverflow.com/questions/32686728/how-to-avoid-jsx-component-from-condensing-when-react-js-rendering-it


This is an intentional deviation from HTML because usually you don't want extra whitespace between tags.

HTML and CSS have a notion of inline and block elements. Whitespace between inline elements is significant and shouldn't really be altered in any way by any processor. The situtation is complicated by the fact you can change which elements are inline and which are block in CSS.

Still the most correct way would be to refer to the list of default inline and block elements as those are rarely swapped in practice. And never strip whitespace between inline and text elements by default.

https://github.com/facebook/react/issues/1643
