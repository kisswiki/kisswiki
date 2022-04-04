Solid's `<For>` doesn't rely on any build-time magic, other than the JSX custom function call syntax that is also present in React. If you want, you can even call it like an ordinary function:

```javascript
    function MyComponent() {
        return For({
            each: [1,2,3,4],
            children: x => <div>{x}</div>,
        })
    )
```

It's just a function call, and it doesn't even need `React.createElement`. What's more pure than that?

https://news.ycombinator.com/item?id=30514002

you can use functions and loops:

```typescript
  function displayTODOs<T>(todos: T[]): any {
    let arr: any[] = [];
    for(let [i, todo] of todos.entries()) {
      const { done, title } = todo;
      let elem = (/\* JSX \*/);
      arr.push(elem);

    }
    return arr;
  }
  //...
  return (
    <button ...>
    </button>
    {displayTODOs(state.todos)}
  );
```

2. Even with my bias, I must admit I found the `<For...` syntax to be surprisingly easy to read and fast to eye-parse; much more so than other 'templating' (using your term) languages/macros/syntax I've used over the years.

https://news.ycombinator.com/item?id=30532383

> we get a construct like <For> that reinvents a concept that's already in the language
> Isn't this optional? Can't Solid use regular JSX loops?

https://www.solidjs.com/docs/latest/api#control-flow

For reactive control flow to be performant, we have to control how elements are created. For example, with lists, a simple map is inefficient as it always maps the entire array.
This means helper functions.

https://news.ycombinator.com/item?id=30509806

I do worry that Solid also has these "If you know, you know" edges though. So I'm trading looking at a function and assuming it'll run over and over with, looking at a function and thinking, "how can I make this thing run again when it needs to?" I'm not saying it's wrong, it's just another piece of tacit knowledge one has to learn when adopting a new framework.

https://news.ycombinator.com/item?id=30514749
