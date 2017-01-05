# curl

- `curl -s` http://stackoverflow.com/questions/7373752/how-do-i-get-curl-to-not-show-the-progress-bar

## Auto file name: `curl -O -J -L $url`

- http://stackoverflow.com/questions/6881034/curl-to-grab-remote-filename-after-following-location
- http://stackoverflow.com/questions/7451299/how-do-i-preserve-the-remote-filename-when-downloading-a-file-using-curl

## Specify file name

`curl -o mygettext.html http://www.gnu.org/software/gettext/manual/gettext.html`

## data file

`curl --data "@/path/to/filename" http://...`

- http://stackoverflow.com/questions/15912924/how-to-send-file-contents-as-body-entity-using-curl
- http://stackoverflow.com/questions/6408904/send-post-request-with-data-specified-in-file-via-curl
