>One way to handle this would be a merge of the two where da.json provides defaults for da-DK.json which overrides any defaults with its specific strings. https://github.com/yahoo/react-intl/issues/292#issuecomment-172999966

##

Automatic Translation Fallbacks

Another great benefit to come out of this approach is automatic fallback to the default message if a translation is missing or something goes wrong when formatting the translated message. A major pain-point we faced at Yahoo which every app experienced was not wanting to wait for new translations to be finished before deploying, or placeholders like {name} getting translated to {nombre} accidentally.

Message formatting in v2 now follows this algorithm:

- Try to format the translated message
- If that fails, try to format the default message
- If either the translated or default message was formatted, return it.
- Otherwise, fallback to the unformatted message or its id.

https://github.com/yahoo/react-intl/issues/162

##

```
  if (!hasValues && process.env.NODE_ENV === 'production') {
    return message || defaultMessage || id;
  }
  //...
      if (process.env.NODE_ENV !== 'production') {
      // This prevents warnings from littering the console in development
      // when no `messages` are passed into the <IntlProvider> for the
      // default locale, and a default message is in the source.
      if (
        !defaultMessage ||
        (locale && locale.toLowerCase() !== defaultLocale.toLowerCase())
      ) {
        console.error(
          `[React Intl] Missing message: "${id}" for locale: "${locale}"` +
            (defaultMessage ? ', using default message as fallback.' : '')
        );
      }
    }
```

https://github.com/yahoo/react-intl/blob/master/src/format.js#L190

##


Add fallback with gulp https://gist.github.com/pselden/093965d29fc95ec7026b
