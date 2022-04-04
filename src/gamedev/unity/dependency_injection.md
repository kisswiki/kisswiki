- Fortunately, a code-centric approach to Unity development (ex., via Zenject) can minimize these kinds of problems, while also supporting numerous software development best practices that are often lacking in Unity development. https://thoughtbot.com/blog/how-to-git-with-unity
- I'm personally in love with VContainer https://forum.unity.com/threads/di-ioc-alternatives-to-zenject.1065593/#post-7245200
- https://github.com/danielpalme/IocPerformance
- https://vcontainer.hadashikick.jp
  - https://github.com/hadashiA/VContainer
  - https://vcontainer.hadashikick.jp/integrations/messagepipe
    - https://github.com/Cysharp/MessagePipe#unity
  - https://medium.com/kadinche-engineering/learning-architecture-messagepipe-and-vcontainer-by-creating-a-game-requested-by-my-own-daughter-8ee8303a718
- Due to a complete lack of interest from the community to support this project, it has been archived and will no longer be maintained https://github.com/unitycontainer/unity
- SOLID principles for Unity devs P1 - Introduction https://www.youtube.com/watch?v=eS3ny8mPn2c&list=PLcRSafycjWFfaHAnpFudWYRl7dK9w2nud&index=1

## cons

Pro AAA projects do not use DI for game or engine code. 15 years as a pro AAA game developer. I've worked on every conceivable engine and framework and I can say with 100% confidence that not a single one uses DI.

DI in unity - and even in games in general - is far more trouble than what it's worth.

A few reasons -
you usually only inject one thing. The whole point of DI is to make it easy to write scaffolding/testing code, but that code likely won't be written for a game anyway. Very rarely do you have a good reason to write unit tests for games.
it clobbers your ability to adequately debug. Usually the "right" way to do DI is also very event driven, where things happen, you publish the fact that they happened, and something else subscribes to that event and acts on it. Debugging these types of pubsub models is far more difficult than just stepping through code that's called GetComponent<>.
It muddles the order of WHEN things get created, which, in games, is usually way more important than in other software.

Event-based message passing systems with multiple subscribers and senders are an absolute nightmare to debug. The cleaner and simpler your control flow, the better. Pretty looking one-liners are nice, but if it causes havoc on your stack traces it isn't worth it.

Dependency Injection in Unity is silly, and here's why: Dependency Injection is an Inversion of Control Pattern. Unity relies on the Component Pattern, which uses the Service Locator Pattern, which is also an Inversion of Control Pattern. If you implement IoC on top of IoC, you've effectively made a redundant decoupling system, while simultaneously increasing code complexity. You've accomplished nothing but to make your code hard to trace and debug.
I've stepped into projects where they've implemented some DI framework, and it's just headache-inducing, and does nothing good. Not that I don't make use of dependency injection, because it's a very simple pattern to implement using just an interface and a public property.
In Unity, if you want to automagically wire things up, you use the Service Locator. You use GetComponent, FindObjectOfType, and so on. Because the service locator is also compatible with Interfaces, if you design right, it's very easy to do everything you'd do with DI. Sure, you could create a factory to create your "enemy" object and wire it up, or you could just instantiate a damn prefab, and have it locate its necessary components and services itself.
tl;dr: Don't waste your time implementing redundant top-heavy frameworks. Unity has built-in IoC.

FindObjectOfType doesn't have exceptionally poor performance, as long as you're not doing it every single frame. If its limitations become annoying, it's trivial to write your own service locator. Far more trivial than implementing a DI framework. A simple HashSet of all objects that qualify for service location will give you an effective service locator in a single line, with the caveat that objects will have to manage their subscriptions to the HashSet.

https://www.reddit.com/r/Unity3D/comments/5na0m2/dependency_injection_for_unity/

Not everyone is going to like using reflection. Many people assume that use of reflection will result in poor performance. In at least some cases that will be right, so I won't dispute claims like this. However using dependency injection gives me such a productivity boost when building complex application that I'm willing to put up with less than perfect startup performance.

Normally I use dependency injection on start up and load and prefer not to use it at runtime unless it is triggered by a user initiated event where slightly less than the best performance can be tolerated. I've used reflection-based dependency injection in numerous Windows and Android applications and the performance has always proven tolerable.

If you want many of the benefits of dependency injection without the potential performance issues you should instead consider the service locator pattern. This pattern is very simple to implement and is very effective, I used it extensively myself before I adopted full dependency injection.

What's the difference? With dependency injection the system understands what a component needs and automatically provides it. With the service locator pattern a component understands it's own dependencies and must ask the service locator to provide them. The service locator pattern usually operates with no magic. It doesn't require reflection and it doesn't need to scan the scene to automatically connect components. Typically this means you must write code to register and retrieve dependencies. This is more work than dependency injection, although it is still more productive then manual wiring.

If you are concerned about the performance or under the hood magic of dependency injection then the service locator pattern might be what you are looking for. If you are interested in it please let me know and I might dedicate a future post to it.

https://www.the-data-wrangler.com/dependency-injection-for-unity-part-3/#dependency-injection-alternative-the-service-locator-pattern

https://moderncsharpinunity.github.io/post/dependency-injection-on-unity/

- He talks that it was hard to understand what is going on when you use big DI library. [KISS Dependency Injection in Unity — The Non-Overengineered Way!](https://www.youtube.com/watch?v=ScD-ZqYhYf4)

Unity's inbuilt serialization system is dependency injection. When you make a serialized field, you're telling Unity to inject a value into that field from the data saved in the scene or prefab. This makes your system flexible since you can drag and drop references from anywhere instead of specifically limiting your script to GetComponentInChildren and it makes debugging easy because you can see what's referencing what in the Inspector.
With that in mind, the only other place I use dependency injection is for injecting asset references into static fields since Unity doesn't have a good inbuilt way to do that so I made my own system for it.

A better solution would be to use "FindObtectOfType()" instead so you don't need to drag and drop, but this doesn't work with interfaces, so you lose some flexibility.

I’ve worked on some large projects that used DI and it’s definitely a significant overhead. There’s cost in boilerplate as well as maintenance and debugging (what is really being called here?). Generally I use DI only when I have to and design my code to need it as little as possible.
My recommendation is to, as much as possible, factor your code into small which don’t have complicated dependencies and do have good unit tests. Lightweight reliable components don’t need to be mocked when testing so there’s no real reason to inject them.
Injection is most useful for components which take a too long for a unit test, don’t have predictable behavior, or have heavy external dependencies (like a database).

You solve the "problem" of injecting dependencies in start/awake or through modular editor drag and drop, and in doing so create the problem of relying on and constantly updating/maintaining a giant god object that handles all of your dependencies through a bloated framework...
Not the best tradeoff IMHO.

My advice, from 2 decades of non-Unity professional software development experience, and someone who loves DI, is, if you have never used DI before, don't start with Unity. As others have noted, Unity itself holds the configuration root (others have called that a "god object" which isn't correct, if you've implemented DI correctly). If you start using something like Zenject in Unity, you've now got your configuration in two places, and one of those (the Unity editor) has it spread out all over the place.
Build some non-unity projects with DI (.Net Core comes with a capable system) and experiment with it to see the benefits and drawbacks it provides. When you really start to understand DI, then you can start thinking about adding an additional DI framework in your Unity projects.
You are right to worry about mixing patterns, that can cause confusion later when you have to maintain your code if there isn't an immediately obvious answer to "where is this dependency configured?"
Unity's GetComponent methods are the Service Locator Pattern. There is a very good article comparing that to DI here: https://martinfowler.com/articles/injection.html

https://www.reddit.com/r/Unity3D/comments/oxeiqy/should_i_use_dependecy_injection_for_everything/

Whereas the old form of DI is as rigid as it comes, most frameworks are built on IoC (Inheritence over composition) and ECS on the other hand is strictly CoI (composition over inheritance).

You can argue the point which one is better but the tech industry has moved to CoI and even Unity encourages using CoI and ECS over the old rigid OOP paradigm with custom IoC code. C# IoC, unlike C++ IoC is just not machine, nor memory friendly so it has a conceptual flaw when judged by the raw performance.

ECS is based on DI. But it uses DI for CoI (composition over Inheritance) in contrast to IoC which most DI frameworks prefer.
So, same concepts but from a different angle. After all both ECS and DI are concepts to solve programming problems and more to the point, memory related problems. But one actually solves it and the other turns into a non-performant mess. Tech companies moved away from IoC because they know it's a mess. It was mostly popular in C++ and historically made total sense there. But even the C++ programmers have moved on to CoI. In C#, DI makes sense for open source modules but for Unity games? When the game is so complicated it needs a framework, why choose a framework that's known for not scaling well?

https://www.reddit.com/r/Unity3D/comments/brdr3j/dependency_injection_in_unity/

Every time you use a serialized field, that's dependency injection. Instead of your class being responsible for finding the thing it needs, you mark a field with [SerializeField] (or make it public) to move that responsibility to the scene/prefab/etc.
The only other place I use a framework for dependency injection is the [Asset Injection](https://kybernetikgames.github.io/weaver/docs/asset-injection/the-problem) system I implemented in [Weaver](https://kybernetikgames.github.io/weaver) which is specifically for static fields and properties to reference assets so I can set up global/shared references without littering my scenes with pseudo-singletons and other nonsense.
I've tried a few general purpose dependency injection systems like Zenject over the years, but gave up on them pretty quickly because it just didn't seem like my code was any easier to debug and maintain.

https://www.reddit.com/r/Unity2D/comments/dg9p5i/how_do_you_use_dependency_injection_in_unity_or/
