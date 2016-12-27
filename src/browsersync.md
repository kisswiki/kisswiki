
- https://scotch.io/tutorials/how-to-use-browsersync-for-faster-development
- https://github.com/mgechev/angular-seed/wiki/Add-a-Proxy-to-browsersync
- http://stackoverflow.com/questions/39459731/express-with-browser-sync
- https://www.sitepoint.com/improve-workflow-browsersync-2-0/
- http://stackoverflow.com/questions/30233218/browser-sync-is-blocked-by-chrome-csp

## Doesn't work on Windows when there is no network connection

- maybe related https://github.com/BrowserSync/browser-sync/issues/1088

## No 'Access-Control-Allow-Origin' header is present on the requested resource - CORS

If You want to resolve Cross Origin for all URL containing /api, first you should forward your Angular requests to your BrowserSync Server

So

`$http.get('http://food2fork.com/api/search?key='+key+'&page=1')`

Should become

`$http.get('/api/search?key='+key+'&page=1')`

The BrowserSync will receive the call

## About

>It's different than browsersync in that it isn't ridiculously huge. browser-sync has about 252 dependencies in its tree, and requires you to compile fsevents, bufferutil, and utf-8-validate.
>
>It is different from live-reload in that for live-reload you need to add a browser extension or a snippet of code to your html pages, which you don't need to in live-server.
>
>-- https://github.com/tapio/live-server/issues/100#issuecomment-198150493

<br>

>The most important reason people chose Browsersync is:
>
>It is not constrained to a single device, it works across desktop and mobile devices at the same time. It will update code changes, synchronize scroll positions and form inputs automatically across all browsers and devices.
>
>-- https://www.slant.co/versus/5065/5066/~livereload_vs_browsersync


## reload

>stream is correct for css changes, but not for js/coffee changes. js changes require a full page reload (refresh), which is done by browserSync.reload. css changes can just be injected into your page without doing a full page refresh, and the way you have done that is correct. The browserSync docs show both methods, one for sass and one for js.
>
>-- http://stackoverflow.com/questions/38861977/why-would-browsersync-live-reload-for-one-compilation-task-but-not-another
