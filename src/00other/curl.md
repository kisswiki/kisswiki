# curl

## silent

`curl -s`

<http://stackoverflow.com/questions/7373752/how-do-i-get-curl-to-not-show-the-progress-bar>

## Auto file name: `curl -OJNL $url`

or `-OJNL`

- O and J for file name
- N for no buffer
- L for redirects
- <http://stackoverflow.com/questions/6881034/curl-to-grab-remote-filename-after-following-location>
- <http://stackoverflow.com/questions/7451299/how-do-i-preserve-the-remote-filename-when-downloading-a-file-using-curl>

## Specify file name

`curl -o mygettext.html http://www.gnu.org/software/gettext/manual/gettext.html`

## data file

`curl --data "@/path/to/filename" http://...`

- <http://stackoverflow.com/questions/15912924/how-to-send-file-contents-as-body-entity-using-curl>
- <http://stackoverflow.com/questions/6408904/send-post-request-with-data-specified-in-file-via-curl>

## Authorization Bearer and pre-flight OPTIONS request

```bash
curl https://calculations-s.gwidx.net/api/categories \
 -H "Authorization: Bearer <token>"
```

It sounds like you are asking if there's a way to prevent curl from making a request at all. This is impossible. curl can always make a request to the server, with or without CORS.

<https://stackoverflow.com/questions/20721747/testing-cors-with-curl>

## Suprress response body

Unix

`curl -s -o /dev/null -v http://google.com`

Windows

`curl -s -o nul -v http://google.com`

<https://stackoverflow.com/questions/32488162/curl-suppress-response-body>

## Verbose

<https://ec.haxx.se/usingcurl-verbose.html>
