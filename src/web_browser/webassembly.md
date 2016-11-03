## About

>> Why does it need support in a JavaScript engine
> I think the situation is more like this http://www.2ality.com/2015/06/web-assembly.html#webassembly_does_not_replace_javascript
> because it's a little much to expects browser to implement 2 vms
> WebAssembly is a low-level, portable bytecode that is designed to be encoded in a compact binary format and executed at near-native speed in a memory-safe sandbox. As an evolution of existing technologies, WebAssembly is tightly integrated with the web platform, as well as faster to download over the network and faster to instantiate than asm.js, a low-level subset of JavaScript.
> http://v8project.blogspot.sg/2016/03/experimental-support-for-webassembly.html
> https://www.reddit.com/r/programming/comments/4aif1n/v8_javascript_engine_experimental_support_for/

> Technically WebAssembly is a virtual ISA
> http://blog.golovin.in/how-to-start-using-webassembly-today/
> https://www.reddit.com/r/WebAssembly/comments/4u0rxv/how_to_start_using_webassembly_today/
> https://en.wikipedia.org/wiki/Instruction_set

> WASM is ASM.js on steroids. It'll start as a bytecode version of JS with a few new features and no GC - then it'll be the compile target for ASM.js - then it'll be the last binary format that matters.
> https://www.reddit.com/r/programming/comments/4aif1n/v8_javascript_engine_experimental_support_for/d11oia2

> currently one of the performance bottle-necks with {asm.,}js is parsing the source code. This is specifically what web-assembler is here to address.
> https://www.reddit.com/r/programming/comments/4aif1n/v8_javascript_engine_experimental_support_for/d113qrk

> Why create a new standard when there is already asm.js?
> ... especially since pthreads (Mozilla pthreads, Chromium pthreads) and SIMD (simd.js, Chromium SIMD, simd.js in asm.js) are coming to JavaScript.
> https://github.com/WebAssembly/design/blob/master/FAQ.md

> The original vision of the browser was a cross-platform vehicle for delivering applications over the network. It's not just an idea, it was always the explicit goal and WASM is the last piece of the puzzle.
Java was supposed to be key to that goal, but it didn't match the capabilities of the network and processing speed of the time. As painful as HTML, CSS, and JavaScript are to use, they actually worked.
Compile-to-JS, NaCL, and asm.js culminated in a realistic blueprint for how to build a low-level network-oriented runtime. Combined with increases to network speed (the average webpage is the size of the original DOOM) WASM is finally doable.
On the plus side, holy shit we can do (almost) anything! WASM will also mean outside money pumped into improving the browser runtime, such as Ethereum's migration to WASM.
Some of the parent comment is tongue-in-cheek, but you can already see one downside: fragmentation. Any good API gets screwed up in committee, so we end up with the most bare-bones and verbose implementation possible (WebComponents, IndexedDB, etc). Since they are so painful to use we end up importing 3rd party libraries which entails incompatibility. The content itself also becomes more opaque, as we can't just parse HTML to figure out the contents of the page.
That being said, holy-shit we can do anything!
> The original vision for the browser was as a vehicle for browsing through interlinked documents. Web apps were an afterthought.
> "network-driven hypervisor" is what we have already with modern browsers. WebSockets, WebWorkers, WebRTC ... all that.
> -- https://news.ycombinator.com/item?id=12843224

- http://www.2ality.com/2015/06/web-assembly.html
- https://medium.com/javascript-scene/why-we-need-webassembly-an-interview-with-brendan-eich-7fb2a60b0723

## Examples

- https://webassembly.github.io/demo/

## Speed

> I'm currently working on a large-ish code based designed primarily to run via Emscripten. Current optimized .js size is 3MB. While the WASM size is noticeably smaller <2MB, startup time is actually worse due to browsers compiling everything ahead of time.
> with WASM browsers can potentially save a snapshot of the compiled code to speed up re-runs.
> True, and I've seen great results with Firefox's asm.js AOT mode, but the app I'm working on has a lot of non cached users.
> -- https://news.ycombinator.com/item?id=12840000

<br>

> WebAssembly doesn't permit unstructured branching. That is, the bytecode doesn't support "goto". All conditionals and loops use structured mechanisms. Reconstituting branches and loops is the hardest part of decompiling, which means WebAssembly decompilers will have the hardest part already solved for them. It doesn't matter what binary or text formats the WebAssembly team chooses, they'll all be equally easy to parse, and even generate, in this regard.
> The downside is that translating goto constructs in languages like C can be tricky and sometimes computationally very expensive. Even supporting multi-level "break" can be tricky. And constructs like "computed goto", which are often used in C, Fortran, etc to improve the readability (easier to read state machines) or performance (faster state machines for bytecode interpreters) cannot be supported by WebAssembly directly, which means instead of always being faster they'll always be slower.
> But the downside is mostly irrelevant for people concerned by decompiling WebAssembly to readable source code.
> -- https://news.ycombinator.com/item?id=12842923

## Other languages

> Libraries like libgc can't be directly ported over to Emscripten since they depend on platform specific behavior to inspect the execution stack and registers.
In asm.js/WASM the execution stack is not inspectable from code.
> -- https://news.ycombinator.com/item?id=12845918
