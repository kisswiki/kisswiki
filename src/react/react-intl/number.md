Im using the "ReactIntl Nested JSON" Export from Phraseapp and have written an own little PluralComponent for this - maybe also helpful for others.

```javascript
import React, {PropTypes} from 'react';
import {injectIntl, FormattedPlural, formatMessage} from 'react-intl';

const Component = ({id, value, intl}) => (
    <span>
      <FormattedPlural 
        one={intl.messages[id].one} 
        other={intl.messages[id].other} 
        zero={intl.messages[id].zero} 
        value={value} 
      />
    </span>
);

Component.propTypes = {
    value: PropTypes.number.isRequired,
    id: PropTypes.any.isRequired
};

export default injectIntl(Component);
```

https://github.com/yahoo/react-intl/issues/553#issuecomment-273768760