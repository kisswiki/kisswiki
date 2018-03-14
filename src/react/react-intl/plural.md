```javascript
const messages = defineMessages({
  counting: {
    id: 'app.counting',
    defaultMessage: 'I need to buy {count, number} {count, plural, one {apple} other {apples}}'
  },

…

    <LocaleButton locale={this.props.intl.locale} />
    <div>{this.props.intl.formatMessage(messages.counting, { count: 1 })}</div>
    <div>{this.props.intl.formatMessage(messages.counting, { count: 2 })}</div>
    <div>{this.props.intl.formatMessage(messages.counting, { count: 5 })}</div>
```

https://www.smashingmagazine.com/2017/01/internationalizing-react-apps/

```javascript
            <FormattedMessage
                id="num_emails"
                defaultMessage="You have 1.{teaspoons, plural, one {# teaspoons} other {# teaspoons}}."
                values={{
                    teaspoons: 2,
                }}
            />
```

https://stackoverflow.com/questions/41089804/fractional-plural-forms-in-react-intl-or-intl-messageformat-javascript-i18n-pac

## ICU message syntax

This is supported via the ICU Message syntax.

```javascript
You have {unreadCount, plural,
  one {{unreadCount, number} unread message}
  other {{unreadCount, number} unread messages}
}
```

By using the number argument types, the value will pass through Intl.NumberFormat which for Arabic will use Arabic's numbering system.

You can also use # shorthand to achieve the same result:

```
You have {unreadCount, plural,
  one {# unread message}
  other {# unread messages}
}
```

https://github.com/yahoo/react-intl/issues/366#issuecomment-198747315

##

You should also have this available:

>a plural category string: "zero", "one", "two", "few", "many", or "other"

https://github.com/yahoo/react-intl/wiki/API#formatplural

- example https://github.com/yahoo/react-intl/blob/381b3d82daab342ffb84f29429523dcc93922d60/examples/hello-world/src/App.js
- test https://github.com/yahoo/react-intl/blob/e749a389313641eb3230954e19a0f1fa42bc6df2/test/unit/components/plural.js
- https://egghead.io/lessons/react-render-content-based-on-a-number-using-react-intl-formattedmessage

- https://stackoverflow.com/questions/37620425/handling-abbreviated-numbers-pluralization-w-react-intl/49277834#49277834

## Rules

- https://formatjs.io/guides/message-syntax/#plural-format
- http://userguide.icu-project.org/formatparse/messages
- http://cldr.unicode.org/index/cldr-spec/plural-rules
- http://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html