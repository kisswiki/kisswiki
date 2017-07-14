```jsx
class appTemplate extends React.Component {
    render() {
        return (
            <div>
                <Header lang={this.props.route.path}/>
                {React.Children.map(
                       this.props.children,
                       child => React.cloneElement(child,
                                   { 
                                      customProp: "Here is your prop",
                                      path: this.props.route.path
                                   })
                )}
                <Footer lang={this.props.route.path}/>
            </div>
        );
    }
}
```

https://stackoverflow.com/questions/40054774/how-can-i-pass-props-to-children-of-react-router
