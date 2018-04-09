>Mock functions are also known as "spies", because they let you spy on the behavior of a function that is called indirectly by some other code, rather than just testing the output. You can create a mock function with jest.fn(). If no implementation is given, the mock function will return undefined when invoked.
https://facebook.github.io/jest/docs/en/mock-function-api.html

`spyOn`

https://facebook.github.io/jest/docs/en/jest-object.html#jestspyonobject-methodname

>In Jasmine, mocks are referred to as spies. There are two ways to create a spy in Jasmine: spyOn() can only be used when the method already exists on the object, whereas jasmine.createSpy() will return a brand new function https://www.htmlgoodies.com/html5/javascript/spy-on-javascript-methods-using-the-jasmine-testing-framework.html

>Mock functions make it easy to test the links between code by erasing the actual implementation of a function, capturing calls to the function (and the parameters passed in those calls), capturing instances of constructor functions when instantiated with new, and allowing test-time configuration of return values.
>
>There are two ways to mock functions: Either by creating a mock function to use in test code, or writing a manual mock to override a module dependency.
> https://github.com/facebook/jest/blob/v22.1.1/docs/MockFunctions.md