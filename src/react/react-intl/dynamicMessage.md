```jsx
<Checkbox
    label={<FormattedMessage id={label} />}
    name={name}
    value={value}
    defaultChecked={defaultChecked}
    onChange={onChange}
/>
```

```jsx
<FormattedMessage id={label}>
    {formattedValue => (
        <Checkbox
        label={formattedValue}
        name={name}
        value={value}
        defaultChecked={defaultChecked}
        onChange={onChange}
        />
    )}
</FormattedMessage>
```

```jsx
import { injectIntl, intlShape } from 'react-intl';

const CheckboxInput = ({intl}) => [
    <Checkbox
        label={intl.formatMessage({id: 'messageId'});}
        name={name}
        value={value}
        defaultChecked={defaultChecked}
        onChange={onChange}
    />
    <input type="text" placeholder={intl.formatMessage(messages.userNamePlaceHolder,{username:this.state.usernameText}) } />
];

CheckboxInput.propTypes = {
  intl: intlShape.isRequired
}

export default injectIntl(CheckboxInput);
```

- https://stackoverflow.com/questions/39630620/react-intl-how-to-use-formattedmessage-in-input-placeholder
- https://github.com/yahoo/react-intl/wiki/API#injection-api
- https://github.com/yahoo/react-intl/issues/810

>@joncursi If title is rendered as a child of another component, then you could set its prop type to PropTypes.node and then use title={<FormattedMessage .../>}.
>
>@langpavel that won't work in all cases since the function passed as a child to <FormattedMessage> will receive an array of PropType.nodes, not a string.
https://github.com/yahoo/react-intl/issues/438#issuecomment-214784283
