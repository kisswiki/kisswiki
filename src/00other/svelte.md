## Killer feature of vDOM

There is a killer feature of vDOM that Svelte has nothing to replace with. It is the ability to treat component hierarchy as an object.
React code:

```jsx
const UnorderedList = ({children}) => (
  <ul>
    {
      children.map((child, i) => <li key={i}>{child}</li>
    }
  </ul>
)
const App = () => (
  <UnorderedList>
    <a href="http://example.com">Example</a>
    <span>Example</span>
    Text
  </UnorderedList>
);
```

This is a very simple task for React and literally impossible for Svelte. Because templates are not Turing-complete, and if they were, they would require vDOM. It might seem like a small thing but for me it is more than a valid reason to add an extra of 0.15–0.25 seconds to my app’s time-to-interactive. This is exactly what we need the vDOM for — we might not need it for reactive state updates, conditional rendering or list rendering, but as long as we have it we can treat our component hierarchy as fully dynamic and controllable object. You cannot code a serious fully declarative app without this feature.

https://javascript.plainenglish.io/why-svelte-wont-kill-react-3cfdd940586a
