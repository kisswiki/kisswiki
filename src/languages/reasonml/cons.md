ReasonML on the other hand requires that the boundary between itself and existing JavaScript code is explicitly defined. Types can to some extent be inferred, but they must still be determined at compile-time. This makes JavaScript interoperation more laborious, especially if the boundary gradually moves as an existing JavaScript code base is converted. It's also not always obvious how to type some of the weird stuff that goes on In JavaScript, but it's usually possible, and hopefully just temporary until everything has been converted to ReasonML anyway :)

https://stackoverflow.com/questions/46147250/reasonml-vs-typescript/46222952#46222952

##

```jsx
<div foo={bar}> {child1} {child2} </div>
```jsx

transforms into

```reasonml
ReactDOMRe.createElement("div", ~props=ReactDOMRe.props(~foo=bar, ()), [|child1, child2|]);
```

```reasonml
let theChildren = [| <div />, <div /> |];
<MyReasonComponent> ...theChildren </MyReasonComponent>
```

- https://github.com/reasonml/reason-react/blob/master/docs/jsx.md
- https://reasonml.github.io/docs/en/jsx.html

##

I'm using `Array.fold_left` because `Array.filter` is not supported yet. However we need to track the `index` ourselves.

https://github.com/reasonml-community/bs-downshift/blob/master/examples/reason_downshift.re

## Resonml does not guarantee `no runtime exception`

ReactiveConf 2016 - Sean Grove: The Age of Reason(ML) https://youtu.be/8LCmLQ1-YqQ