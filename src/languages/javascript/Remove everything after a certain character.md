```javascript
var s = '/Controller/Action';
var n = s.indexOf('?');
s = s.substring(0, n != -1 ? n : s.length);
document.write(s);
```

https://stackoverflow.com/questions/5631384/remove-everything-after-a-certain-character/5631434#5631434
