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

## Examples

- https://webassembly.github.io/demo/
