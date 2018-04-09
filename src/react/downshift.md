`Downshift` needs `render` prop
this prop is for rendering what’s below input
list of options
We have `DropdownRenderer` for rendering that
inside `DropdownRenderer` there is component for displaying single option: `DropdownItem`
we pass to this component function `selectItem`
which is passed by `Downshift` to `DropdownRenderer`
inside `DropdownItem` we use `handleClick` for div wrapping option

which fires `selectProperItem` from `../utils`
so return of `selectItem` is passed to `onChange`