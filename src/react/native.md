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

## pros and cons

- Layout: It's the main reason to go all in with RN. You're much faster building these with RN then using native stuff.
Infinite Scrolling: ListViews and RN are a thing. There's a new List Type since a few Versions - if you're following the book regarding DataStrucure everything should work.
- REST Client: RN provides basic API so nearly everything which works in Browser works in RN too. I use Redux Sagas and fetch. Working great so far.
Image Handling: It's built on top of fresco and works great so far.
- Push: Can't say mush about it, because i don't use it but should work ok.
- In-App: There's a great Plugin.
- Animation: Native Animations are around for some time. Should work ok, but depends what you're planning to do.

Basically it's extremely easy to go native if necessary. But at that point you need to implement it on every platform. Even though for usual use cases it shouldn't be necessary. You just need to keep Track of your renderings and make sure you use PureComponents at the right point, so there are no unnecessary rerenders congesting the bridge and slowing everything down. But if you do it right you will achieve performance and an feature level that is on par with every native development in less time. And with 95% Code Share.

Push works great!

https://news.ycombinator.com/item?id=15295691

###

Pros
- We haven't done performance tuning and haven't had any user complaints about performance (it's a multi-channel chat app)
- Most of the time, changes "just work" on both platforms
- Javascript :D
- Development velocity is great, especially w/ UI changes
Cons
- Wish we had better text input control
- You still need someone who knows about native app development on each platform
- Upgrading versions can cause breaking issues (this has gotten better)
- Lesser used 3rd-party packages are often incomplete across platform, so a fair amount of patches
- Changes on one platform have the potential to break the other platform (so testing can require a lot of back and forth)

https://news.ycombinator.com/item?id=15294338

###

RN's been a good move for our smaller 2-3 person teams (2-3 devs, plus part-time designer, QA, various other roles full or part time—call it 6 personnel) though not without trade-offs. Big wins:
1. JS devs can contribute quickly and comfortably.
2. Can still easily write native code if needed (win over other native-but-not-native frameworks)
3. If you decouple business logic (Redux, even) and, say, REST client code, that stuff's largely portable to an awful lot of platforms. RN's supported platforms (including kind-of supported, like FireTV and Apple TV), plus desktop (well, "desktop"—Electron) and (depending on what you're doing) web.
4. It actually does look pretty OK on both iOS and Android with few special considerations (conditionally rendered sections, different views) for each. This surprised the hell out of me.
5. Papers over a lot of stupid, badly-designed, and/or broken crap on Android, and does a decent job of it.
These add up to a ton of time saved, which manages to overcome:
1. Immature, kinda poorly managed ecosystem. If you stray from RN+Redux and one or two other core libs, Here Be Dragons. Like, good luck ever upgrading RN if you load up on dependencies like a typical JS project, if those dependencies touch RN itself at all. Part of this is just JS "culture", part of it's the relative youth of the project, and part of it's FB's choices.
2. It's Javascript. We've fixed this by using Typescript, which is great. Makes Redux actually manageable—way less bouncing around between files, bouncing out to documentation, more just writing code. Fewer red screens due to typos or related dumb mistakes.

https://news.ycombinator.com/item?id=15294157

###

Builds are very complicated. It's not as simple as 'JS is your whole app'. The package manager is getting better at injecting native code (react-native link) but has a long way to go.

I spent a lot of time debugging RN. The instant reload feature comes with hangups. Tracebacks don't always appear.

Navigation isn't cross-platform.

Interacting with native APIs is nightmarish. JS wasn't built for java interop.

https://news.ycombinator.com/item?id=15293820

###

No, I don't regret it. We picked it for our startup as we wanted a cross platform solution, that genuinely felt native (without the huge effort it takes to make a webapp feel that smooth), and that still gave us a chance to easily native code for certain features. Big wins:
- With a little effort, it genuinely feels native.
- The talent pool is much larger. We didn't hire React Native folk, just good JS people who picked it up quickly.
- Blending native code with JavaScript is easy.
- There are methods to perform app updates without going through the app store release processes of either platform (and waiting for end users to actually download the update).
- It moves quickly, so bugs are squashed pretty quickly, and features arrive at a fast clip.
There have been challenges:
- It moves quickly. Backwards compatibility is doesn't seem to be high on the maintainers priority list, so almost every update will break _something_. We instituted policies of never falling far behind the public release (to avoid needing huge changes at once), and using very few external components (which are often not kept up-to-date with RN).
- If your use cases are outside of the maintainers, there will be problems. The release process seems to be "Does it work for the contributors projects? Ship it". Things like Pod based builds broke for months because they just weren't tested.
- The JavaScript ecosystem is still insane. Our project has ended up with one of the most complex build processes I've worked with (and I've worked with autotools).
My key advice would be:
- Stick with their release cycle, and follow their processes. Don't colour outside the lines, or you will have pain.
- Don't include third party modules unless you have _no other choice_.
- Test on both iOS and Android regularly (i.e. continuously). Things that work well on one platform may be broken on the other.
Based on our outcomes, present me would happily tell past me I'm making a good call, as I'm confident we'd otherwise never have shipped two native-feel applications with 5 developers.

https://news.ycombinator.com/item?id=15293997

## typescript

Facebook have decided they won't support it (Flow is their thing, so that makes sense) but Microsoft has stepped up with some pretty serious support, including good docs for the process of converting a new RN project to TypeScript:
https://github.com/Microsoft/TypeScript-React-Native-Starter
Not sure whether that'd play nicely with Expo without a bunch of extra work. It is quite a bit harder to convert an existing project than to start a new one with TypeScript.

This transformer: https://github.com/ds300/react-native-typescript-transformer worked perfectly for me so far. You don't have to change your code at all but just add a single file to your project and the packager will do all the rest for you.

https://news.ycombinator.com/item?id=15297534


## Expo

With RN, though, we've only really had problems with it when using Expo. Taking that out of our stack pretty much solved our periodic whole-day-wasting build problems, and excising it and other tightly-coupled libs freed us to upgrade RN from time to time, which is nice. A++++, would aggressively remove RN-specific 3rd party libs again.

I don't use react native for work, just for my own projects, but what you said about expo is resonating with me. I thought it would be a clear winner but it's much slower to do anything with it, the app is constantly crashing, etc. Feels much less productive.

https://news.ycombinator.com/item?id=15294365
