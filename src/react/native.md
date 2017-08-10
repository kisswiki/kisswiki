- https://facebook.github.io/react-native/showcase.html

## Cons

Don’t use React Native.

There is little “native” about React Native. It’s something web “devs” like to convince themselves because they don’t know better.

Using merely UIView objects does not mean it is native. It’s not just an abstraction over native. The “great” minds at Facebook have decided to not only offer a JS wrapper around the native APIs and objects, but actually reinvent the wheel on everything. Tables? Let’s have a horrible implementation in JS. Gestures? Slow ones in JS. Navigation? Absolutely terrible in JS. Animations? Core Animation you say? Nope, in JS or in C++. Even simple stuff like buttons are not native UIButton objects. There is nothing “native” in React Native.

Also, the single threaded model of JS just does not scale. The larger the app gets, the more and more it starts to lag. UI is rendering at 60 FPS, sure, but the lag comes from a constantly busy single JS thread.

And that’s before mentioning things like accessibility, large type support, basic iOS concepts such as margins and layout guides, etc. that are sorely missing from RN.


I think it is best to write the "core" of your application using a language that can run on all of your target platforms -- which typically means you'll have to use C/C++/Rust or something similar that can be compiled to native code and supports somewhat sane FFI. The UI for each platform should be done using the Native UI toolkit for the platform. That way, you can avoid most of the code duplication.

https://news.ycombinator.com/item?id=14972637
