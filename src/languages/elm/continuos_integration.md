## Circle and Travis misreport their number of CPUs

rtfeldman: https://elmlang.slack.com/archives/general/p1484149451013255

there's a known speed problem with both Circle and Travis because they misreport their number of CPUs, but there's a workaround: add the equivalent of these to your Circle config:

* https://github.com/elm-community/elm-test/blob/master/.travis.yml#L6
* https://github.com/elm-community/elm-test/blob/master/.travis.yml#L22-L30
* https://github.com/elm-community/elm-test/blob/master/.travis.yml#L39-L41 (edited)

they basically swap out `elm-make` for a script that runs `elm-make` with `sysconfcpus -n 2` so that `elm-make` becomes aware of the *actual*  number of CPUs available

I talked with the Circle folks a bit about this, and the tl;dr is that they're not interested in fixing it, but it may fix itself in a future release of some upstream stuff they're using
