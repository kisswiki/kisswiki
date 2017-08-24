## add state

```javascript
function updateURL() {
    if (history.pushState) {
        var newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + '?para=hello';
        window.history.pushState({path:newurl},'',newurl);
    }
}
```

- https://eureka.ykyuen.info/2015/04/08/javascript-add-query-parameter-to-current-url-without-reload/
- https://stackoverflow.com/questions/12508225/how-do-we-update-url-or-query-strings-using-javascript-jquery-without-reloading

## replace state with query string

`npm i query-string`

```javascript
import queryString from 'query-string';
const parsed = queryString.parse(window.location.search);
parsed.userId = data._id;
window.history.replaceState(null, null, window.location.pathname + '?' + queryString.stringify(parsed));
```

https://stackoverflow.com/questions/32828160/appending-parameter-to-url-without-refresh
