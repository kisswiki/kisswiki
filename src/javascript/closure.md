> Closures are functions that refer to independent (free) variables (variables that are used locally, but defined in an enclosing scope). In other words, these functions 'remember' the environment in which they were created.
> A closure lets you associate some data (the environment) with a function that operates on that data. This has obvious parallels to object oriented programming, where objects allow us to associate some data (the object's properties) with one or more methods.
> -- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures

<br>

> ECMAScript allows inner functions; function definitions and function expressions that are inside the function bodes of other functions. And that those inner functions are allowed access to all of the local variables, parameters and declared inner functions within their outer function(s). A closure is formed when one of those inner functions is made accessible outside of the function in which it was contained, so that it may be executed after the outer function has returned. At which point it still has access to the local variables, parameters and inner function declarations of its outer function. Those local variables, parameter and function declarations (initially) have the values that they had when the outer function returned and may be interacted with by the inner function.
> -- http://stackoverflow.com/questions/1801957/what-exactly-does-closure-refer-to-in-javascript

<br>

> Two one sentence summaries:
> - a closure is one way of supporting first-class functions; it is an expression that can reference variables within its scope (when it was first declared), assigned to a variable, passed as an argument to a function, or returned as a function result. Or
> - closure is a stack frame which is allocated when a function starts its execution, and not freed after the function returns (as if a 'stack frame' were allocated on the heap rather than the stack!).
> -- http://stackoverflow.com/questions/111102/how-do-javascript-closures-work

<br>

> A closure is just an evolution of the concept of the stack.
>
> The stack is used to separate/isolate scope when functions are called. When a function returns the stack frame (activation record) is popped off the call stack thus freeing the used memory allowing the next function call to reuse that RAM for its stack frame.
>
> What a closure does is that instead of actually freeing that stack frame, if there's any object/variable in that stack frame that's referenced by anything else then it keeps that stack frame for future use.
>
> Most languages implement this by implementing the stack as a linked list or hash table instead of a flat array. That way, the stack can be re-ordered at runtime and is not constrained by physical memory layout.
>
> So. With this in mind, the answer is that variables in a closure are stored in the stack and heap. Depending on your point of view.
>
> From the point of view of the language, it's definitely the stack. Since that's what closures are in theory - a modified stack.
>
> From the point of view of the machine language or underlying C/assembly code, the idea of a linked-list stack is nonsense. Therefore the higher level language must be using the heap to implement its "stack".
>
> So the variable is in the stack but that stack is probably located in the heap.
>
> This of course depends on the implementation of your programming language. But the above description is valid for most javascript interpreters (certainly all the ones I've seen).
> -- http://stackoverflow.com/questions/29225834/where-is-the-variable-in-the-closure-stored-stack-or-heap

<br>

> Whenever a function is called, an object is allocated to hold all of that function's local variables. Typically, this is done on the stack, and we call that object (along with control flow information like the return address) a "stack frame", and it gets overwritten whenever a function returns and a new function is called after. But, you don't have to allocate variable storage on the stack. Rather than storing local variables in a stack frame, you can instead allocate an object on the heap for them instead. That way, local variables don't have to be deleted or overwritten when the function that created them returns- they can stick around as long as necessary, potentially forever.
>
> Then, whenever a closure is created, a reference to the object that stores all of the local context variables is stored with the closure. When all referencing closures are gone, the garbage collector can clean up that variable context object; but as long as the closure is accessible, it keeps access to the variables from the enclosing environment where it was created. Each context object also contains a reference to the context object for the next higher scope, so there's always a chain that lets the engine access variables from any arbitrarily higher scope for as long as they might be needed. It just has to remember, for each place where a variable is referenced, how many links back it has to go to find the right context object that holds the memory for that variable.
>
> Now, that works, but as I said it's not very efficient. Whenever a closure is created, it'll keep references to every context object for every higher lexical scope at that time, which can prevent a large amount of memory from being garbage collected for not reason. It also means that all variable access has to go through an pointer indirection to the heap, which slows things down. There are a lot of ways to improve it, but a fairly simple one, which V8 implements is as follows:
>
> When parsing the code, V8 keeps track of where each variable is referenced, and uses that information to divide the local variables for every function into two classes: those that are referenced inside a nested function (i.e., those that could be accessed from closures), and those that aren't (i.e., those that can never be accessed from a closure). That lets is allocate non-closure variables in a regular stack frame, which is automatically cleaned up and re-used on every new function call. But, if there are any closure variables, it allocates those in a context object on the heap, which may point to another context object from a higher scope (just like before) if variables from the higher scope are also closed over in the current scope.
>
> That means that the engine only has to keep around variables that might actually be used in the future on the heap, which saves a bunch of memory. Additionally, it only has to use pointer indirection for the variables that are actually used in closures- everything else can be accessed on the stack, which keeps it fast.
> -- https://www.quora.com/Technically-how-do-JavaScript-closures-work

<br>

> This is how local variables gets allocated and freed automatically - via pushing and popping objects off the stack
> A closure is a more advanced stack frame. But whereas normal stack frames gets deleted once a function returns, a language with closures will merely unlink the stack frame (or just the objects it contains) from the stack while keeping a reference to the stack frame for as long as it's required.
> -- http://stackoverflow.com/questions/31735129/how-do-javascript-closures-work-at-a-low-level

<br>

> Function scope encourages the idea that all variables belong to the function, and can be used and reused throughout the entirety of the function (and indeed, accessible even to nested scopes)
> -- https://github.com/getify/You-Dont-Know-JS/blob/master/scope%20%26%20closures/ch3.md

```javascript
function a() {
 var v = 2;
 function b() {
   function c() {
     console.log(v);
   }
   return c;
 }
 return b;
}
a()()(); // 2
```
