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

- https://stackoverflow.com/questions/40054774/how-can-i-pass-props-to-children-of-react-router
- https://stackoverflow.com/questions/35835670/react-router-and-this-props-children-how-to-pass-state-to-this-props-children    

>Children.map [...]. This is needed, typically because children can be an object or an array, and in the latter case, you clone each element.
https://stackoverflow.com/questions/35835670/react-router-and-this-props-children-how-to-pass-state-to-this-props-children#comment59338544_35835837
