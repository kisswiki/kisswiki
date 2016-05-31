# Redux

- https://www.reddit.com/r/reactjs/comments/4fmgb8/reactthunk_functional_stateless_components_as/
- https://github.com/JiriChara/redux-blower

## Saga

https://github.com/yelouafi/redux-saga

From:

React
- Functional programming
- React-router
- Sass/ css modules
- Flow

Redux:
- Immutablejs
- Reselect
- Working with Async reducers
- Redux/react routing
- Saga

Testing mocha + karma

https://www.facebook.com/groups/jsjobs/permalink/839006739556048/

## vs Mobx

all your components in the app get their actions trough props. MobX encourages you to have a model. With the model, you probably have normal methods to manipulate your state. All while having regular javascript imports for any file you might need. So when something fails, anyone who knows how import works will be able to figure it out. Redux obfuscates dependency graph by injecting actions, state through props throughout whole app.

https://www.reddit.com/r/reactjs/comments/4f60j9/fluxredux_how_necessary_are_they/d279kas

I just gave an example where it wasn't possible, the computed function does not accept any parameters which means its "computation" must be derived from instances variables this, from a variable enclosed upstream, or globals. It is currently not possible for computed to be pure. Every aspect of redux emphasizes pure functions and/or composition.

https://www.reddit.com/r/reactjs/comments/4f60j9/fluxredux_how_necessary_are_they/d27fv6r

https://www.reddit.com/r/reactjs/comments/4fojit/what_is_your_structure_when_using_mobx_with/
