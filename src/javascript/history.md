```javascript
function updateURL() {
    if (history.pushState) {
        var newurl = window.location.protocol + "//" + window.location.host + window.location.pathname + '?para=hello';
        window.history.pushState({path:newurl},'',newurl);
    }
}
```
