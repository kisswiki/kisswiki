> I personally feel that HOCs are convoluted and unnecessarily complex. It just comes off dogmatic at the cost of real-world use cases.
> -- https://github.com/facebook/flow/issues/2135#issuecomment-235672280

- hoc explained https://medium.freecodecamp.org/understanding-higher-order-components-6ce359d761b
- Write a Higher Order Component from Scratch https://github.com/acdlite/recompose/wiki/Recipes#write-a-higher-order-component-from-scratch

##

At a high level HOC enables you to:
- Code reuse, logic and bootstrap abstraction
- Render Highjacking
- State abstraction and manipulation
- Props manipulation

We will see this items in more detail soon but first, we are going to study the ways of implementing HOCs because the implementation allows and restricts what you can actually do with an HOC.

HOC factory implementations

In this section we are going to study the two main ways of implementing HOCs in React: Props Proxy (PP) and Inheritance Inversion (II). Both enable different ways of manipulating the WrappedComponent.

- https://medium.com/@franleplant/react-higher-order-components-in-depth-cf9032ee6c3e
