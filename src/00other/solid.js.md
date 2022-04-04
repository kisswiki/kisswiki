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

That said, I think that easily the most difficult aspects of react revolve around how re-renders are triggered. Maintaining referential equality to stop unnecessary renders gets tricky when you are passing functions or objects. Suddenly you need to be using `useMemo` and `useCallback` and passing dependency lists that all have to be primitive values unless you want to memoize them as well. It can become such a headache that the official line around it mostly seems to be "make the render fast, don't worry about unnecessary re-renders" – good advice, until you hit a use-case where you need to worry.

Solid takes these problems and just vanishes them. UI state knows what its dependencies are automatically and only updates when they change – even in a sub-component level!

To be fair, I've never used Solid in anger, and moving to it would be a big ask when there is such a good ecosystem built up around react. That said it is easily one of the most exciting projects on my radar, and the developer Ryan Carniato seems extremely knowledgeable in the area.

https://news.ycombinator.com/item?id=30510391

Knockout was similar to Solid.js in that they both have functions that you call which then log a data dependency, then when the data changes the UI updates. This led to lots of pain, because instead of a plain value, you have functions which return values, and you need to be very careful about when those functions are called, otherwise the data dependency might not be tracked properly.

Angular had a similar issue, as its state-based observation relied on special scopes. Updates in the wrong scope could be lost or delayed.

React’s approach of only diffing the rendered UI rather than trying to drive updates based on diffs of the input data was vastly simpler, it was much easier to understand the data flow through explicit state and props.

https://news.ycombinator.com/item?id=30511640
