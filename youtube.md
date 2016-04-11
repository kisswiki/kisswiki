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
