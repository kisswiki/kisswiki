
## error is not catched

also using node-fetch: https://github.com/Yoctol/fetch-graphql-schema/issues/7

error:

```
VM448:8 Uncaught (in promise) SyntaxError: Unexpected end of JSON input
    at fetch.catch.then.result (<anonymous>:8:26)
```

code:

```javascript
(async () => { // this line can and the last can be omitted in web browser dev tools console
  await fetch('http://127.0.0.1:8080/graphql2', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ query: "{ __schema { types { name } } }"}),
  })
  .catch(error => console.error('BAD', error))
  .then(response => response.json())
  .then(json => console.log(JSON.stringify(json, null, 2)));
})()
```

solution - use try..catch:

```javascript
(async () => { // this line can and the last can be omitted in web browser dev tools console
  try {
    const response = await fetch('http://127.0.0.1:8080/graphql', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ query: "{ __schema { types { name } } }"}),
    })
    const json = await response.json();
    console.log(JSON.stringify(json, null, 2));
  } catch (error) {
    console.error(error);
  }
})()
```

https://medium.com/@thejasonfile/fetch-vs-axios-js-for-making-http-requests-2b261cdd3af5

## POST

```javascript
fetch('https://httpbin.org/post', {
  method: 'post',
  headers: {
    'Accept': 'application/json, text/plain, */*',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({a: 7, str: 'Some string: &=&'})
}).then(res=>res.json())
  .then(res => console.log(res));
```

https://stackoverflow.com/questions/29775797/fetch-post-json-data/42493030#42493030

## links

- https://medium.com/@shahata/why-i-wont-be-using-fetch-api-in-my-apps-6900e6c6fe78
- https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch
- https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Basic_concepts
- http://seanamarasinghe.com/developer/fetch-api/
- https://developers.google.com/web/updates/2015/03/introduction-to-fetch
- https://hacks.mozilla.org/2015/03/this-api-is-so-fetching/
- https://jakearchibald.com/2015/thats-so-fetch/
- https://jakearchibald.com/2016/streams-ftw/
- https://davidwalsh.name/fetch
- http://stackoverflow.com/questions/9922101/get-json-data-from-external-url-and-display-it-in-a-div-as-plain-text
- headers example http://richardkho.com/making-ajax-calls-in-react-native/
- http://caniuse.com/#feat=fetch

## Code

- https://github.com/matthew-andrews/isomorphic-fetch
- https://github.com/bitinn/node-fetch
- https://github.com/mdn/fetch-examples
- https://github.com/yutakahirano/fetch-with-streams/

## CORS

- There is no content in Response with no-cors. So JSON.parse will fail. I just wonder why 'web-security': false does not work with window.fetch. Now I turn into using superagent instead of native window.fetch. https://github.com/atom/electron/issues/1990#issuecomment-120860477
- http://stackoverflow.com/questions/32722409/access-control-allow-origin-header-not-present-with-fetch-api-call
- http://stackoverflow.com/questions/32859611/no-access-control-allow-origin-header-is-present-origin-is-therefore-not-allo
- http://stackoverflow.com/questions/34189883/cors-problems-no-access-control-allow-origin-header-is-present-on-the-requeste
- https://chrome.google.com/webstore/detail/allow-control-allow-origi/nlfbmbojpeacfghkpbjhddihlkkiljbi?hl=en
- https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS
- https://jvaneyck.wordpress.com/2014/01/07/cross-domain-requests-in-javascript/
- https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy#Cross-origin_network_access

## stream with progress

### upload

- https://github.com/SitePen/javascript-streams-blog-examples
  - https://stackoverflow.com/questions/35711724/progress-indicators-for-fetch/35747208#comment80458102_35747208
- https://gist.github.com/domenic/95e689d0be5e24fb08ec
  - https://github.com/github/fetch/issues/202#issuecomment-141795929

### download

>I think we're still waiting for experimentation on top of streams before figuring out exactly what to expose.
https://github.com/yutakahirano/fetch-with-streams/issues/24#issuecomment-330865507

