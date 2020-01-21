- https://github.com/rokoroku/react-redux-typescript-boilerplate
- https://github.com/piotrwitek/react-redux-typescript-guide
- http://patrickdesjardins.com/blog/typescript-react-and-redux-part-1-the-big-picture
- https://github.com/3ygun/tutorial-react-with-ts
- https://rjzaworski.com/2016/08/getting-started-with-redux-and-typescript
- http://michaellawrie.com/typesafe-redux-in-typescript
- https://github.com/ServiceStackApps/typescript-redux
- https://egghead.io/lessons/typescript-bootstrap-a-typescript-react-project

[Using TypeScript with React | Hacker News](https://news.ycombinator.com/item?id=20765187)

- https://basarat.gitbook.io/typescript/
- https://simonknott.de/articles/Using-TypeScript-with-React.html
- https://github.com/typescript-cheatsheets/react-typescript-cheatsheet
- https://github.com/piotrwitek/react-redux-typescript-guide

You can use redux with TS just by adding @types/react-redux

- https://redux.js.org/recipes/usage-with-typescript#usage-with-react-redux
- https://github.com/piotrwitek/typesafe-actions
- https://github.com/typestack/class-validator
 
I use [serializr](https://github.com/mobxjs/serializr) to convert json to my classes, and afterwards I can have all the deligtful methods I want. :-) I love the code clarity this gives, methods are where they are most logical, instead of on some helper object.

There is also class-transformer[1] and class-validator[2] which also do the same job but integrate a bit better into the whole typescript cosmos.

[1] https://github.com/typestack/class-transformer [2] https://github.com/typestack/class-validator


ESLint is the "official" way to go with TS from this point on. It has better integration with Prettier too, since Prettier formatting differences shows as errors/warnings.. and you can share JS/TS rules if needed. 


When it comes to API responses you don't control, I recommend taking a look at user-defined type guards https://basarat.gitbooks.io/typescript/content/docs/types/typeGuard.html

