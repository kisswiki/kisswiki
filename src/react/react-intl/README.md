- https://github.com/yahoo/react-intl
- THIS --> https://mikebridge.github.io/articles/typescript-i18n-react-intl/
- webpack https://github.com/Ognian/react-intl-webpack-plugin
- https://egghead.io/courses/add-internationalization-i18n-to-a-react-app-using-react-intl
- https://medium.freecodecamp.org/internationalization-in-react-7264738274a0
- https://www.abidibo.net/blog/2017/03/17/internationalization-react-redux-starter-kit/
- https://www.smashingmagazine.com/2017/01/internationalizing-react-apps/
- https://github.com/yahoo/react-intl/tree/master/examples/translations
- https://medium.com/i18n-and-l10n-resources-for-developers/i18n-for-react-5cd0297d7c98
- extraction messages from source code
  - https://github.com/yahoo/babel-plugin-react-intl
  - https://github.com/yahoo/react-intl/issues/162
  - I think http://l10ns.org/ is the best tool I have tried https://github.com/yahoo/intl-messageformat/issues/106#issuecomment-116799864
- Localizing message containing HTML https://github.com/yahoo/react-intl/issues/137#issuecomment-120416578
- React.js Conf 2015 - Formatting with FormatJS and react-intl https://youtu.be/Sla-DkvmIHY
  - is there a way to use react-intl with your service? no, unfortunately, that's not possible right now. https://twitter.com/transifex/status/583663690341289984
- https://www.ogi-it.com/presentation/react_i18n.pdf
- https://jsolyk.wordpress.com/2016/08/24/react-redux-react-intl-inject-directly-without-any-element/
- markdown https://github.com/wrwrwr/react-intl-marked
- https://github.com/Ognian/reactIntlJson-loader
- https://github.com/danilobuerger/react-intl-loader

## what to choose?

1. `const locale = user.locale || navigator.language || 'en';`
2. Load translations dynamically with webpack and System.import - will that work on IE11?
3. Translation process
  - Ognian/react-intl-webpack-plugin and memspace or okapi rainbow
  - https://bitbucket.org/bflower/react-intl-editor/overview
  - https://github.com/maniax89/react-intl-aggregate-webpack-plugin
4. react-intl + redux - do we want that?
5. https://github.com/danilobuerger/react-intl-loader
