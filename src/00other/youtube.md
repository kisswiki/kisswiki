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
