To keep settings and bookmarks after reopen, create some chrome profile and name it like `temp`, then:

`open -na Google\ Chrome --args --profile-directory=temp --disable-web-security -user-data-dir=/tmp/temporary-chrome-profile-dir`

- https://stackoverflow.com/questions/68151812/how-can-i-start-chrome-in-insecure-mode-in-mac/78489428#78489428
- https://superuser.com/questions/377186/how-do-i-start-chrome-using-a-specified-user-profile/377195#377195
