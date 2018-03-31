Router now automatically populates this.props.children of your components based on the active route.

```jsx
export const App = React.createClass({
  render: function() {
    return <div>
      <Header {...this.props} />
      { this.props.children }
    </div>;
  }
});
```

You should also fix your routes so AppContainer actually contain the rest of the components (and the Redirect):

```jsx
const routes = <Route component={AppContainer} />
  <Redirect from="/" to="/summary" />
  <Route path="summary" component={Summary} />
  <Route path="users"   component={Users} />
  <Route path="devices" component={Devices} /> 
</Route>;
```

- https://stackoverflow.com/questions/27612765/nested-routes-in-react-router/33250868#33250868
- https://stackoverflow.com/questions/39114016/how-to-nest-components-under-a-common-header
- https://github.com/ReactTraining/react-router/blob/c27b018268864c8671c4cc3c6c6819bb255114df/UPGRADE_GUIDE.md#routehandler
- https://egghead.io/lessons/react-create-nested-tab-routes-with-dynamic-paths-with-react-router