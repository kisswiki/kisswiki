```jsx
      <FormattedMessage id={label}>
        {formattedValue => (
          <Checkbox
            label={formattedValue}
            name={name}
            value={value}
            checked={checked}
            onChange={onChange}
          />
        )}
      </FormattedMessage>
```

https://stackoverflow.com/questions/35186297/how-to-retrieve-a-string-in-reactintl-2-0-without-using-formattedmessage

or

```jsx
title={formatMessage(messages.tooltip)}
```

https://github.com/yahoo/react-intl/issues/162

- https://gist.github.com/oun/395fabdc24cacbd78b1b37422b07e2c2
- https://github.com/yahoo/react-intl/issues/218
- https://github.com/yahoo/intl-messageformat
- https://stackoverflow.com/questions/42414416/react-intl-define-messages-outside-of-react
- https://stackoverflow.com/questions/39630620/react-intl-how-to-use-formattedmessage-in-input-placeholder
