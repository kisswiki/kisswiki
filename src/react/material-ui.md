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