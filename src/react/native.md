- https://facebook.github.io/react-native/showcase.html

## Cons

Don’t use React Native.

There is little “native” about React Native. It’s something web “devs” like to convince themselves because they don’t know better.

Using merely UIView objects does not mean it is native. It’s not just an abstraction over native. The “great” minds at Facebook have decided to not only offer a JS wrapper around the native APIs and objects, but actually reinvent the wheel on everything. Tables? Let’s have a horrible implementation in JS. Gestures? Slow ones in JS. Navigation? Absolutely terrible in JS. Animations? Core Animation you say? Nope, in JS or in C++. Even simple stuff like buttons are not native UIButton objects. There is nothing “native” in React Native.

Also, the single threaded model of JS just does not scale. The larger the app gets, the more and more it starts to lag. UI is rendering at 60 FPS, sure, but the lag comes from a constantly busy single JS thread.

And that’s before mentioning things like accessibility, large type support, basic iOS concepts such as margins and layout guides, etc. that are sorely missing from RN.


I think it is best to write the "core" of your application using a language that can run on all of your target platforms -- which typically means you'll have to use C/C++/Rust or something similar that can be compiled to native code and supports somewhat sane FFI. The UI for each platform should be done using the Native UI toolkit for the platform. That way, you can avoid most of the code duplication.

https://news.ycombinator.com/item?id=14972637

## Code sharing between web views and native

So we've tried a lot of things to maximize code sharing. Our initial goal was to share non-visual code like reducers/action-creators/libs/utils etc… This was pretty interesting but it didn't give us the amount of sharing that we wanted. We were still building multiple versions of many things.

The next approach we started on was using https://github.com/necolas/react-native-web. This was very exciting and very fun to work with. However, we found it difficult to optimize the web experience. Most of our traffic is on the website so we are spending a lot of time optimizing the web experience. This might not line up with other's experience but we kind of came to the conclusion that react-native-web works great for apps where the native app is the primary driver and you want to offer a web experience as a secondary experience. This became more clear when we started trying to work with our SEO team. And again when we started trying to build responsive designs with react-native-web. Doable but we ended up spending a ton of time to make the web work the way we wanted to.

Eventually we decided to go a different direction. Most of our display logic is the same or very similar between the mobile web/ios/android with a few exceptions. We found that mixing ReactNative with the webview component gave us the ability to use webviews to share the majority of the code that can be shared. When we need more native functionality we communicate with postMessage and we have access to ReactNative. Once in ReactNative if we need to go down to iOS specific or Android specific code we have the ability to do that too. We found this to be much more powerful than Cordova and the user experience is honestly amazing. This is still a work in progress but we are excited about what we've seen so far.

https://news.ycombinator.com/item?id=15293885
