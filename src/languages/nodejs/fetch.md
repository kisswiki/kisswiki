I don't recommend using node-fetch. Although it works with some browsers, it doesn't on those who doesn't support window.fetch natively such as IE11-. One possible candidate would be whatwg-fetch but it's not suitable for node environments.

isomorphic-fetch found a way to get the best of both worlds but it came with a flaw: a bug that stops it from working on React-Native enviroments, issue 125, also mentioned on #14. The problem is that repo is not maintained anymore. So we're orphans here.

We have issues with a lot of fetch alternatives in the community. For instance, isomorphic-fetch has this bug, is no longer maintained and is outdated. fetch-everywhere is in the same situation but with the bug fixed. In both of them polyfill is mandatory. This can be an issue sometimes.

That's why I created cross-fetch. We have this project for a huge e-commerce company here that the same javascript codebase needed to run on several platforms (react-native included). No lib felt right for this job. But now we use cross-fetch: it's fixed, updated and cross-platform.

https://github.com/graphcool/graphql-request/issues/16