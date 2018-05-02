DI and IoC just mean following one simple rule: When you are writing a definition, never instantiate anything inside it. It's a definition, it shouldn't have concrete instances floating around.

So you want to write a function that will read user input and spit it out.

```java
myFunc() {
    reader = new Reader();
    input = reader.getUserInput();
    return input;
}
```

That's bad! Your function now has a dependency on Reader. This is way better

```java
myFunc(IReader reader) {
    input = reader.getUserInput();
    return input;
}
```

But this is only half of the work that's involved. People generally stop giving the explanation here, but where these concepts really get interesting is how you are forced to code around them. Before, if you wanted to get a user's input all you had to do was say

```java
user_input = myFunc();
```

Now you have to instantiate a `Reader` first

```java
reader = new Reader();
user_input = myFunc(reader);
```

But we want our fancy dependency injection here too! It's starting to become clear that the `Reader` needs to be a property of an object.

```java
class MyClass {
    constructor(IReader reader) {
        this.reader = reader;
    }
    doStuff() {
        user_input = myFunc(this.reader);
    }
}
```

Cool, but how is this actually helping us? It was a lot easier to just declare the `Reader` in the function that actually uses it, and the code compiled just as well that way.

Well, what if we end up with several function in different child objects that rely on a `Reader`, and we decide one day that the `Reader` library we are using sucks balls and we'd much rather use the shiny new one that proggit has been raving about? Or we decide to write our own `Reader`? By employing this strategy of "try not to instantiate things in your code," we have made our application extremely configurable. We can just drop any new `Reader` that fits the interface (and we can force it to fit the interface if we must), and voila our work is done.

"Configurable," hey that sounds like we could make some sort of configuration file. Hey, I bet we could create a system that lets us define exactly what types of common libraries and dependencies we want in our project and swap them in and out at will without breaking our code!
Now you're starting to realize what a DI Framework is.


Pretty remarkable that Fowler mentioned 3 different ways to do Dependency Injection using containers, but failed to mention that you can achieve same result without containers -- simply by writing functions.

How's that?

Partial application


DI also helps you write macaroni code. Macaroni code is like spaghetti code except it's chopped into a million little fucking pieces, and when it's all compiled you just pray that the pieces somehow accidentally form into a tube that lets your data through.

https://www.reddit.com/r/programming/comments/8cwa4o/dependency_injection_is_a_25dollar_term_for_a/

## Mocking

`mocking.md`