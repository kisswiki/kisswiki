- In `next` branch `defaultProps` are removed from production build https://github.com/facebook/create-react-app/pull/3818/files
- Rule proposal: prefer-default-props - Disallow ES6 default parameter syntax on component defintions https://github.com/yannickcr/eslint-plugin-react/issues/666
- Stateful components with default props: You can tell TypeScript that a property will be provided externally (by React) by using a null assertion operator (this isn't ideal but is the simplest minimum extra code solution I could think of). https://basarat.gitbooks.io/typescript/content/docs/jsx/react.html#default-props
- https://medium.com/@wbobeirne/mutually-exclusive-react-proptypes-with-typescript-97cfd2ebc6a0
- https://medium.com/@linmic/its-time-to-remove-proptypes-and-just-use-flow-for-react-4a3de615aac5
- https://stackoverflow.com/questions/47774695/react-functional-component-default-props-vs-default-parameters
- https://github.com/facebook/flow/issues/4462
- https://stackoverflow.com/questions/36783982/should-reacts-proptypes-and-defaultprops-be-used-in-conjunction-with-flowtyp

## default value

the default value is only used when the prop is undefined, but not when it's null
we intentionally treat undefined and null differently, as does JS

- https://github.com/facebook/react/issues/2166
- https://stackoverflow.com/questions/37842868/how-can-i-declare-a-proptype-corresponding-to-a-nullable-number