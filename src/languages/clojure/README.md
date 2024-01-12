## data inspector

- https://clojure.org/guides/repl/data_visualization_at_the_repl
- https://practical.li/clojure/data-inspector/
- morse
  - https://github.com/nubank/morse/blob/main/docs/lein.adoc
  - https://clojure.org/news/2023/04/28/introducing-morse
  - https://vlaaad.github.io/replicant
- https://github.com/nextjournal/clerk
  - [Moldable Live Programming with Clerk (by Philippa Markovics) | London Clojurians](https://youtu.be/3bs3QX92kYA)
  - https://news.ycombinator.com/item?id=35743261

## reveal

I have added to ~/.lein/profiles.clj based on https://vlaaad.github.io/reveal/setup

```clojure
{:repl {:dependencies [[vlaaad/reveal "1.3.280"]]
        :repl-options {:nrepl-middleware [vlaaad.reveal.nrepl/middleware]}
        ;; optional: preferences
        :jvm-opts ["-Dvlaaad.reveal.prefs={:theme,:light}"]}}
```

I needed to `sdk install java 21.0.1-zulu` with [sdkman](/src/languages/java/sdkman.md) to get reveal to work.

- https://gist.github.com/bhb/b44235034b0cb62604a565165abec39f
  - https://clojurians-log.clojureverse.org/reveal/2023-01-30
- https://vlaaad.github.io/reveal/
- [Cloure REPL driven development - a simple example | Practicalli](https://youtu.be/rQ802kSaip4)
  - https://practical.li/clojure/introduction/repl-workflow/#evaluating-source-code
