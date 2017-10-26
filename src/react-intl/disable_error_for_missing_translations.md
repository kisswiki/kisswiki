I end up monkey patching console.error to suppress the warnings. For those who are not ready to add messages prop yet, here is a hacky snippet to rescue.

```
if (process.env.NODE_ENV !== 'production') {
  const originalConsoleError = console.error
  if (console.error === originalConsoleError) {
    console.error = (...args) => {
      if (args[0].indexOf('[React Intl] Missing message:') === 0) {
        return
      }
      originalConsoleError.call(console, ...args)
    }
  }
}
```

https://github.com/yahoo/react-intl/issues/251#issuecomment-166077090

##

Currently I use the filter /^(?!\[React Intl]).*$/ in console.log filter

https://github.com/yahoo/react-intl/issues/465#issuecomment-320499922
