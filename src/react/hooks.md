## `useSelector` and `dispatch`

Use can use `useSelector` and `dispatch` instead of `connect` and `mapStateToProps` https://thoughtbot.com/blog/using-redux-with-react-hooks

## Hooks and stale closure

Hooks implementation assumes that between the component re-renderings, the latest closure supplied as a callback to the hook (e.g. useEffect(callback)) has captured the freshest variables from the component’s function scope.

- https://dmitripavlutin.com/react-hooks-stale-closures/
  - diff https://gist.github.com/rofrol/2ac749eab2fe30782701238b04bcd682/revisions

## componentDidMount equivalent is useLayoutEffect

> This hook similar to the useEffect hook, however, it fires synchronously after all DOM mutations. It also renders in the same way as componentDidUpdate and componentDidMount.

- https://www.smashingmagazine.com/2020/04/react-hooks-api-guide/
- https://reacttraining.com/blog/useEffect-is-not-the-new-componentDidMount/

## Using Set is problematic

Probably better to use array.

```javascript
function handleMultiple(val, fn) {
  return function (checkedName) {
    const newVal = val.includes(checkedName)
      ? val.filter((name) => name !== checkedName)
      : [...val, checkedName];
    fn(newVal);
  };
}
```

- https://stackoverflow.com/questions/58806883/how-to-use-set-with-reacts-usestate/58806947#58806947
- https://codesandbox.io/s/material-demo-639rq?file=/demo.js
  - https://stackoverflow.com/questions/61475234/material-ui-react-form-hook-multiple-checkboxes-default-selected/61593933#61593933

## hooks, useState, useEffect and maximum update depth exceeded

I had problem with error `maximum update depth exceeded`.

Turned out, `useAssets` is using `useEffect`, so like in `What color is your function?`, or in book `Black Hat Rust` that async or lifetime annotations are like virus, you also need to have all chain of values like:

first variable uses useState -> second uses useState and useEffect to update itself when first changes -> and so on.

Ali told me:

> the arguments you pass to "useAssets" should have referential equality

```javascript
const { branches } = useCompanyBranches();

const [allBranchesIds, setAllBranchesIds] = useState(
  branches.map(({ id }) => id)
);

useEffect(() => {
  setAllBranchesIds(branches.map(({ id }) => id));
}, [branches]);

const [branchesChecked, setBranchesChecked] = useDependentState(allBranchesIds);

const [filtersChecked, setFiltersChecked] = useState({
  branches: branchesChecked,
});

useEffect(() => {
  setFiltersChecked({
    branches: branchesChecked,
  });
}, [branchesChecked]);

const { assets } = useAssets(searchTerm, filtersChecked);
```

> Ali:house_with_garden: 3:22 PM
> I'm going to review your merge request later, but I gotta tell you already this that I'm not happy with the fact we used useDeepCompareEffect.
> 3:22
> Even the idea of it pushes me away.
> 3:22
> I pretty much think that implementation can be done with the objects that are having the same references.. which I mentioned it above in this >conversation and created a merge request to demonstrate it to you.
> 3:23
>
> WARNING: Please only use this if you really can't find a way to use React.useEffect. There's often a better way to do what you're trying to do than >a deep comparison.
>
> This is what Kent, the author himself, mentioned in their README file even.

- https://kentcdodds.com/blog/usememo-and-usecallback#referential-equality
