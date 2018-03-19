## combine

The createSelector function provided by Reselect implements the most basic way to derive a selector from previous selectors. The simplest use case is to derive a selector from a single other selector. In this case, the parameters to createSelector are the input selector and a function transforming the result of that selector into the result of the new selector. For example

https://docs.mobify.com/progressive-web/0.15.0/guides/reselect/

You can combine selectors as follows:

```javascript
export const computedStateSelector = createSelector(
    state => state.A,
    state => state.B,
    (A, B) =>  {
        return state.A + state.B
    })

export const selector = createSelector(
    computedStateSelector,
    state => state.C,
    (computedState, C) =>  {
        return {
            computedState,
            C
         }
    })
```

https://github.com/reactjs/reselect/issues/73#issuecomment-171980131