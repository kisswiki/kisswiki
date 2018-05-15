
- Show HN: InKino – An open-source movie app made with Flutter https://news.ycombinator.com/item?id=16818170
  - https://github.com/roughike/inKino
- https://hackernoon.com/whats-revolutionary-about-flutter-946915b09514

## Pros

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

##

teraz cisne fluttera bo mysle ze wyprze react nativa

duzo szybciej sie rozwija

i na kazdym urzadzeniu apka wyglada tak samo bo dziala to na takim dart vm a native przeksztalca to na prawdziwy native w locie
a to jest duzy plus bo zawsze na jakism samsungu s6 bedzie inaczej niz s9 i masz przez to wiecej pracy
a performace tego dart jest elegancki bez problemu 60 fps
no i jednak jest typowania a nie js :slightly_smiling_face:
a w native czasem pol dnia sie jebiesz bo nowe biblioteki wyjebaly caly projekt i musisz od nowa stawiac

##

On the flip side of Flutter (The Cons):

- A large threshold of occurrence. Due to the fact that Dart is used, with its inheritance, polymorphism and all OOP buns, for those who only study JS, or come from RN, it will be hard.

- There is no JSX to which we all got used to after RN. Look at the Dart file in which there is no division into the template, styling and working with the data, it becomes unpleasant.

- Styling is a pain. Considering the fact that there is no separation into Styles, templates, and controller, there is a problem that when describing a component, we also need to describe the styles at the same time.

- The animation is kind of more difficult. Though it has some good animations, it is more difficult to animate unlike in RN.

- Optimization. In Fluter, there is only the widget inheritance with a changeable (stateful) and non-changeable (stateless) conditions. While in React-Native we can manage the life cycle. Also, a big drawback is the lack of tools to save the state of the application, this problem can, however, be solved by serializing the current state.

Finally, Flutter will have a great future if they can come up with a way to reduce code writing on Dart, replace any functionality class declaration, and JSX or XML as a description of the structure of the widgets.

https://medium.com/@openGeeksLab/flutter-vs-react-native-what-you-need-to-know-89451da3c90b

##

But React Native still has the same flaws as Xamarin – trying to create a great app out of widgets from both android and iOS. With React Native your bridging with a custom javascript runtime onto native APIs from 2 different platforms. Your gonna end up with an app that regresses to the lowest common denominator. Anything complex requires you to create custom implementations on the native platforms which defeats the object. With Flutter there are no OEM widgets. Flutter draws it own widgets directly into each platforms blank canvas. THIS is the magic of flutter, and why it’s so much better than react native of xamarin

Kotlin multiplatform has all the same downsides as xamarin or react native – your still bridging into the native APIs and widgets. Flutter does it very differently by drawing its own widgets, which is why it stands out as a significantly better cross platform solution

Dartlang does take a little getting used to. It’s definitely fit for purpose, but my worry is that the general lack of interest in Dartlang as a language might end up being flutter’s undoing. It would have been better is they’ used something like Swift or Kotlin, which have a much higher level of developer interest. I understand why they didn’t use Javascript or Typescript, and I think C# would have been problematic too.

https://deanchalk.com/why-im-giving-up-everything-for-flutter-eea87464599d