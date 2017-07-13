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

https://stackoverflow.com/questions/32686728/how-to-avoid-jsx-component-from-condensing-when-react-js-rendering-it
