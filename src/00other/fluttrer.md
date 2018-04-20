
- Show HN: InKino – An open-source movie app made with Flutter https://news.ycombinator.com/item?id=16818170
  - https://github.com/roughike/inKino
## Some good points of Flutter so far:

- Hot reloading is fast, much easier to iterate on designs and experiments
- Plugins seem to be easy to make, they made an architecture that focuses on minimal boilerplate
- Being able to use async-await syntax on a whole UI view is a cool idea (like Android's onActivityResult() with much less typing involved). Push a view onto the navigation stack, let it collect input from the user, pop off the stack with a data structure representing the user input)
- Animations are easy
- Minimal opening of Xcode. Most days I can get by without ever opening it.
- Data flow architectures like the Elm Architecture or Redux are well supported

## Cons

- Having null
- Material design is pushed way too hard - Cupertino widget documentation/examples are lacking
- Code generation needed for JSON parsing
- State for StatefulWidgets are generic over the Widget and not the other way around - I would have expected a StatefulWidget to be generic over a State e.g. `MyHomePage extends StatefulWidget<MyHomePageState>`
- Because of the previous point, the UI building function, build(), is usually on the State class and not the Widget class
- My relatively barebones app is around 33MB on iOS

https://news.ycombinator.com/item?id=16821216