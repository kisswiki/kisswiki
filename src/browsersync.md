>stream is correct for css changes, but not for js/coffee changes. js changes require a full page reload (refresh), which is done by browserSync.reload. css changes can just be injected into your page without doing a full page refresh, and the way you have done that is correct. The browserSync docs show both methods, one for sass and one for js.
>
>-- http://stackoverflow.com/questions/38861977/why-would-browsersync-live-reload-for-one-compilation-task-but-not-another
