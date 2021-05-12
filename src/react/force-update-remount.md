Use forceUpdate for class components or simulate forceUpdate for functional components or change key.

```javascript
function App() {
  const [fooKey, setFooKey] = useState(1);
  const refreshFoo = () => setFooKey(fooKey + 1);
  return (
    <>
      <button onClick={refreshFoo}>Refresh Foo</button>
      <Foo key={fooKey}>some content...</Foo>
    </>
  );
}
```

- https://spectrum.chat/react/help/how-to-remount-refresh-a-react-component~7119779f-245f-4c1b-bcdb-a01c00cdb1e6
- https://stackoverflow.com/questions/35792275/how-to-force-remounting-on-react-components/48451229#48451229
- https://stackoverflow.com/questions/46240647/react-how-to-force-a-function-component-to-render
- https://reactjs.org/docs/react-component.html#forceupdate
- https://reactjs.org/docs/hooks-faq.html#is-there-something-like-forceupdate
