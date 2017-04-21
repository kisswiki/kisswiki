```javascript
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function demo() {
  console.log('Taking a break...');
  await sleep(2000);
  console.log('Two second later');
}

demo();
```

http://stackoverflow.com/questions/951021/what-is-the-javascript-version-of-sleep
