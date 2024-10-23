## block unwanted

- my stylus styles
- https://addons.mozilla.org/en-US/firefox/addon/youtube-addon/ or https://addons.mozilla.org/en-US/firefox/addon/youtube-recommended-videos
- block scroll to next short video with ublock `www.youtube.com###shorts-inner-container > .ytd-shorts:not(:first-of-type)` https://www.reddit.com/r/uBlockOrigin/comments/yngmko/how_to_block_youtube_shorts_scrolling_to_next/
- add search keyword with `y` so that I don't go to home page

## json

Create API key and then enable it https://www.wonderplugin.com/youtube-api-key-and-playlist-id/

examples https://developers.google.com/youtube/v3/getting-started#Sample_Partial_Requests

https://developers.google.com/apis-explorer/?hl=en_US#p/youtube/v3/

https://console.developers.google.com/project

https://console.developers.google.com/apis/api/youtube/

```
var title;
fetch('https://www.googleapis.com/youtube/v3/videos?id=7lCDEYXw3mM&key=YOUR_API_KEY&part=snippet,contentDetails,statistics,status').then(response => response.json()).then(data => { title = data.items[0].snippet.title })
console.log(title);
```

## Download

- https://github.com/rg3/youtube-dl
- https://github.com/gantt/downloadyoutube
  - https://greasyfork.org/pl/scripts/search?q=youtube
  - http://tampermonkey.net/
- http://keepvid.com/

## Alternatives

- https://github.com/omarroth/invidious

## Trending

- [What 40,000 Videos Tell Us About The Trending Tab - YouTube](https://www.youtube.com/watch?v=fDqBeXJ8Zx8)
  - https://www.wykop.pl/link/4966099/analiza-40-tysiecy-filmikow-z-karty-youtube-trending/

## Upload and channel switcher

Upload with Firefox gave bad quality. With Chrome was ok.

- To create channel https://www.youtube.com/create_channel
- To switch channel https://www.youtube.com/channel_switcher

## Wiki

- https://youtube.fandom.com/wiki/5-Minute_Crafts

## copy link bookmarklet

```javascript
var v = new Proxy(new URLSearchParams(window.location.search), {
  get: (searchParams, prop) => searchParams.get(prop),
}).v;
var t =
  document.title.split(" - YouTube")[0].match(/^\([0-9]+\) (.*)/)[1] +
  " | " +
  document.querySelector(".ytd-channel-name a").innerText;
navigator.clipboard.writeText(`- [ ] [${t}](https://youtu.be/${v})`);
```

- [How to get the title of HTML page with JavaScript? - Stack Overflow](https://stackoverflow.com/questions/1057059/how-to-get-the-title-of-html-page-with-javascript)
- [How do I copy to the clipboard in JavaScript? - Stack Overflow](https://stackoverflow.com/questions/400212/how-do-i-copy-to-the-clipboard-in-javascript)
- [String.prototype.split() - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split)
- [Remove last 3 characters of string or number in javascript - Stack Overflow](https://stackoverflow.com/questions/31489413/remove-last-3-characters-of-string-or-number-in-javascript)
- [Groups and backreferences - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences)
- [Get the current URL with JavaScript? - Stack Overflow](https://stackoverflow.com/questions/1034621/get-the-current-url-with-javascript)
- [url - How can I get query string values in JavaScript? - Stack Overflow](https://stackoverflow.com/questions/901115/how-can-i-get-query-string-values-in-javascript)
