- http://sinonjs.org/releases/v4.0.1/spies/
- http://sinonjs.org/releases/v4.0.1/spy-call/
- http://sinonjs.org/releases/v4.0.1/assertions/

##

>Spies are implemented directly in Jest as well – sinon.spy() becomes jest.fn() and works the same way. This integration allows for useful additions to the matchers – the properties .called and .calledOnce on Sinon’s spy object are manageable directly with .toBeCalled() and .toHaveBeenCalledTimes(). https://www.springload.co.nz/blog/why-were-migrating-unit-tests-jest-and-why-you-should-too/

>Mock functions are also known as "spies", because they let you spy on the behavior of a function that is called indirectly by some other code, rather than just testing the output. You can create a mock function with jest.fn(). If no implementation is given, the mock function will return undefined when invoked.
https://facebook.github.io/jest/docs/en/mock-function-api.html

`spyOn`

https://facebook.github.io/jest/docs/en/jest-object.html#jestspyonobject-methodname

>In Jasmine, mocks are referred to as spies. There are two ways to create a spy in Jasmine: spyOn() can only be used when the method already exists on the object, whereas jasmine.createSpy() will return a brand new function https://www.htmlgoodies.com/html5/javascript/spy-on-javascript-methods-using-the-jasmine-testing-framework.html

>Mock functions make it easy to test the links between code by erasing the actual implementation of a function, capturing calls to the function (and the parameters passed in those calls), capturing instances of constructor functions when instantiated with new, and allowing test-time configuration of return values.
>
>There are two ways to mock functions: Either by creating a mock function to use in test code, or writing a manual mock to override a module dependency.
> https://github.com/facebook/jest/blob/v22.1.1/docs/MockFunctions.md

##

```javascript
it("should be able to Login", function () {
  spyOn(authobj, 'isEmpty');  
  authobj.Login('abc', 'abc');  
  expect(authobj.isEmpty).toHaveBeenCalled();
});
```

https://stackoverflow.com/questions/16787351/trying-to-understand-jasmines-tohavebeencalled-matcher