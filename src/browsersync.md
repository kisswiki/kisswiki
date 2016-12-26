
## About

>It's different than browsersync in that it isn't ridiculously huge. browser-sync has about 252 dependencies in its tree, and requires you to compile fsevents, bufferutil, and utf-8-validate.
>
>It is different from live-reload in that for live-reload you need to add a browser extension or a snippet of code to your html pages, which you don't need to in live-server.
>
>-- https://github.com/tapio/live-server/issues/100#issuecomment-198150493


## reload

>stream is correct for css changes, but not for js/coffee changes. js changes require a full page reload (refresh), which is done by browserSync.reload. css changes can just be injected into your page without doing a full page refresh, and the way you have done that is correct. The browserSync docs show both methods, one for sass and one for js.
>
>-- http://stackoverflow.com/questions/38861977/why-would-browsersync-live-reload-for-one-compilation-task-but-not-another
