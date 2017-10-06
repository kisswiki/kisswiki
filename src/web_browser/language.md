- https://help.localizejs.com/docs/detecting-language-of-a-visitor

to change in Google Chrome on Ubuntu, the only option is to start it like:

`LANGUAGE=pl google-chrome`

https://askubuntu.com/questions/202670/change-google-chrome-language/484302#484302

These answers do not work for changing `navigator.language` https://superuser.com/questions/478565/chrome-extension-for-switching-locale-accept-languages

to change `navigator.languages` in Google Chrome go to `chrome://settings/languages`.

In Google Chrome returns the browser UI language, not the value of the Accept-Language HTTP header.

In IE userLanguage or browserLanguage.

https://developer.mozilla.org/en-US/docs/Web/API/NavigatorLanguage/language

###

>This change is just the beginning for changing the behavior of navigator.language since web content has no reason to access the browser UI language given that it does not interact with it. https://plus.google.com/+FrancoisBeaufort/posts/S4aDXS3621R

Now there is a way to get Accept-Languages in Firefox and Chrome using `navigator.languages`.

>I think the main problem here is that the browser settings don't actually affect the navigator.language property that is obtained via javascript.
>What they do affect is the HTTP 'Accept-Language' header, but it appears this value is not available through javascript at all.

- https://ajaxhttpheaders3.appspot.com/?callback=a 
- https://stackoverflow.com/questions/1043339/javascript-for-detecting-browser-language-preference/3335420#3335420

```javascript
<script>
    var bLocale='raw'; // can be used at any other place
    function processHeaders(headers){
        bLocale=headers['Accept-Language'];
        comma=bLocale.indexOf(',');
        if(comma>0) bLocale=bLocale.substring(0, comma);
    }
</script>
<script type="application/javascript" src="http://ajaxhttpheaders.appspot.com?callback=processHeaders"></script>
```

https://stackoverflow.com/questions/1043339/javascript-for-detecting-browser-language-preference/21590840#21590840

### Internet Explorer

The following properties exist on the navigator object (which can also be known as clientInformation on IE but there's no reason ever to use that name):

- language (non-IE, browser install language)
- browserLanguage (IE, browser install language)
- userLanguage (IE, user-level OS-wide language setting)
- systemLanguage (IE, OS installation language)

But! You should never use any of these properties! They will be the wrong language in many cases.

None of them reflect the language settings the user actually gets to configure in the browser's ‘preferred languages’ UI, and they are difficult-to-impossible for users to change. You will cause big frustration by using any of these values without an additional easy manual way to switch languages.

- https://stackoverflow.com/questions/2678230/how-to-getting-browser-current-locale-preference-using-javascript
- Change language > http://windowsitpro.com/windows/how-quickly-change-default-language-internet-explorer

###

```javascript
var getFirstBrowserLanguage = function () {
    var nav = window.navigator,
    browserLanguagePropertyKeys = ['language', 'browserLanguage', 'systemLanguage', 'userLanguage'],
    i,
    language;

    // support for HTML 5.1 "navigator.languages"
    if (Array.isArray(nav.languages)) {
      for (i = 0; i < nav.languages.length; i++) {
        language = nav.languages[i];
        if (language && language.length) {
          return language;
        }
      }
    }

    // support for other well known properties in browsers
    for (i = 0; i < browserLanguagePropertyKeys.length; i++) {
      language = nav[browserLanguagePropertyKeys[i]];
      if (language && language.length) {
        return language;
      }
    }

    return null;
  };

console.log(getFirstBrowserLanguage());
```

https://stackoverflow.com/questions/1043339/javascript-for-detecting-browser-language-preference/29106129#29106129

###

https://github.com/leighmcculloch/acceptedlanguages.js

https://stackoverflow.com/questions/1043339/javascript-for-detecting-browser-language-preference/31531274#31531274
