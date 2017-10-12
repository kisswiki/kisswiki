- https://github.com/ratson/react-intl-redux
- https://github.com/yeojz/redux-intl-connect
- https://stackoverflow.com/questions/36717880/how-to-use-react-intl-2-with-redux
- https://github.com/ratson/react-intl-redux/blob/master/examples/initial-locale/src/index.js
- https://github.com/gpbl/react-locale-hot-switch
- https://alicoding.com/language-code-url-in-react-intl/
- https://alicoding.com/localizing-react-app-using-react-router-with-react-intl/
- https://www.slideshare.net/CatherineZoller1/internationalization-in-a-reactredux-javascript-application

##

`BrowserRouter` should be inside `IntlProvider`:

`ConnectedIntlProvider.js`:

```javascript
import { connect } from 'react-redux';
import { IntlProvider, addLocaleData } from 'react-intl';
import enLocaleData from 'react-intl/locale-data/en';
import frLocaleData from 'react-intl/locale-data/fr';
import itLocaleData from 'react-intl/locale-data/it';
import nlLocaleData from 'react-intl/locale-data/nl';
import zhLocaleData from 'react-intl/locale-data/zh';
import deLocaleData from 'react-intl/locale-data/de';
import esLocaleData from 'react-intl/locale-data/es';
import ptLocaleData from 'react-intl/locale-data/pt';
import jaLocaleData from 'react-intl/locale-data/ja';
import ruLocaleData from 'react-intl/locale-data/ru';
import messages from 'intl/messages.json';

addLocaleData([
  ...enLocaleData,
  ...frLocaleData,
  ...itLocaleData,
  ...nlLocaleData,
  ...zhLocaleData,
  ...deLocaleData,
  ...esLocaleData,
  ...ptLocaleData,
  ...jaLocaleData,
  ...ruLocaleData,
]);

const mapStateToProps = ({ languages: { language } }) => ({
  locale: language,
  key: language,
  messages: messages[language],
});

export default connect(mapStateToProps)(IntlProvider);
```

```jsx
const App = () => (
  <Provider store={store}>
    <ConnectedIntlProvider>
      <BrowserRouter>
        <div>
          <Switch>
            <Redirect exact from="/" to="/register" />
            {
              routes.map((route, i) =>
                <RouteWithSubRoutes key={route} {...route} />)
            }
          </Switch>
        </div>
      </BrowserRouter>
    </ConnectedIntlProvider>
  </Provider>
);
```

- https://stackoverflow.com/questions/35776663/react-intl-multi-language-app-changing-languages-and-translations-storage/40603629#40603629
- https://github.com/DWboutin/react-webpack-startup
