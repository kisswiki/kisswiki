## Do not reload when printing

```jsx
import React from 'react';
import ReactResponsive from 'react-responsive';

class Responsive extends ReactResponsive {
  static printMql = global.matchMedia('print');

  /* eslint-disable no-underscore-dangle */
  updateMatches = () => {
    if (Responsive.printMql.matches || this._mql.matches === this.state.matches) {
      return;
    }

    this.setState({ matches: this._mql.matches });
  };
  /* eslint-enable no-underscore-dangle */

  render() {
    if (typeof this.props.children === 'function') {
      return this.props.children(this.state.matches, Responsive.printMql.matches);
    }

    return super.render();
  }
}
```

storybook:

```javascript
const matchMediaMock = require('match-media-mock').create();
matchMediaMock.setConfig({ type: 'screen', width: 1400 });
global.matchMedia = matchMediaMock;
```

App.jsx

```jsx
//...
              <Mobile>
                {(matches, inPrintView) => (
                  matches && !inPrintView
                    ? <RoutesMobile />
                    : <RoutesDesktop />
                )}
              </Mobile>
//...
```
