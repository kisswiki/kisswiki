- Some good advices and challenges of redux-loop https://blog.scottnonnenberg.com/better-async-redux-i18n-and-node-js-versions/

## Cancel Cmd

- when this be natively supported the Cmd.cancel could cancel the Promises as well, in the mean time, it could only ignore the responses of the Promises when they come. https://github.com/redux-loop/redux-loop/issues/134#issuecomment-318415211

##

Reducers that yield side effects but compose effortlessly.

This would just let any child reducer "throw" effects. Store would catch them and put into an array until root reducer returns.

Same as redux-loop but without the incredible awkwardness of explicitly accumulating them from child reducers.

- One-shot Delimited Continuations with Effect Handlers https://esdiscuss.org/topic/one-shot-delimited-continuations-with-effect-handlers

https://twitter.com/dan_abramov/status/710654722269650945
