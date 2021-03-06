## Create your own component

```jsx
const styles = theme => ( {
  root: {
    width: "100%",
    maxWidth: 360,
    backgroundColor: theme.palette.background.paper,
  },
} );

const MyComponent = ( props ) => {
  const { classes } = props;
  return <div className={classes.root}>Foo</div>;
};

export default withStyles( styles )( MyComponent );
```

or inline

```jsx
const MyComponent = withStyles(theme => {
  root: {
    width: "100%",
    maxWidth: 360,
    backgroundColor: theme.palette.background.paper,
  },
})(props => <div {...props} className={props.classes.root}>{children}</div>);
```

https://stackoverflow.com/questions/52656880/how-to-style-a-functional-stateless-component-in-reactjs-using-classes-object/52657396#52657396

## Change opacity of material-ui-search-bar and maybe also works for TextField

```jsx
const useStyles = makeStyles((theme) => ({
  root: {
    padding: '10px 0 10px 0',
    "& input::placeholder": {
      opacity: 1,
    },
  },
}
//...
    <div className={classes.root}>
      <SearchBar />
    </div>
```

- https://stackoverflow.com/questions/64413949/reactjs-how-to-change-placeholder-font-size-of-material-ui-autocomplete/64414167#64414167

## Change color alpha / transparency / opacity

```javascript
import { fade } from '@material-ui/core/styles/colorManipulator'
...
fade(defaultTheme.palette.primary[500], 0.18)
```

- https://stackoverflow.com/questions/47268652/jss-how-to-change-opacity-for-a-color/48063918#48063918
- https://github.com/mui-org/material-ui/blob/v4.11.2/packages/material-ui/src/styles/colorManipulator.js
