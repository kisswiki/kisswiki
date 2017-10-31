- there is no `onFocus` for `Input` https://react.semantic-ui.com/elements/input
- https://stackoverflow.com/questions/44535840/unable-to-make-the-checkbox-work-with-redux-form-and-react-semantic-ui1

## event.target.value is undefined

This is a known limitation. The event.target is a browser event property. However, many Semantic UI components, such as a Dropdown, Checkbox, and Radio do not work directly with native browser form controls such as input and select. They are built using stylized markup and custom internal state.

Because of this, there are no native browser events available for certain callbacks. This is why all change events in Semantic-UI-React provide the event first (when available) but also a second argument which contains the data you need. You should never have to access the native browser event for most tasks.

https://github.com/Semantic-Org/Semantic-UI-React/issues/638#issuecomment-252035750
