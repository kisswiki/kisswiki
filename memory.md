## Memroy and power consumption

Now that you have read this far, you are probably wondering why we care so much about memory. Why do we think hat it is not ok to add features AND also add memory footprint in return for it too. Why does it really matter when we have multiple GB of memory available? Why spend time on such useless optimization? No. Seriously. Why?

Well, the answer is simple: speed and power consumption. Most of our tasks are memory bound. Using less memory gives us more room for doing the actual rendering. The CPU is actually so insanely fast that one core is almost able to fill all memory bandwidth for most rendering operations. By using less memory, we hope to use less memory bandwidth for things that don't really matter and then have more bandwidth available for things that do. So before we start using S2TC in our software engine, using less data for everything else is clearly a good move.

As for power consumption, thanks to my work at Samsung, I know now that using memory is much more costly on battery than using the CPU cache. In fact, every level of CPU cache uses more power than the previous one, so the more you stay in L1, the better. Of course this directly affects performance as well, so measuring performance is a simple way of measuring potential power consumption. Of course L1 is to small to put everything inside, but you get the idea. Being smaller means less battery usage. Also on a mobile phone the bigger the main memory, the more battery it uses, even if you don't access it. So if your system uses less memory, you can ship it with less memory (Yeah, the marketing department is going to hate us, they can't play the game of bigger numbers...) and having more battery life with the same kind of applications.

That's why Samsung cares about memory consumption and optimization.

https://phab.enlightenment.org/phame/live/1/post/3/efl_memory_consumption_-_moo/

## Why ARC better than Garbage Collection

GC is only efficient when given 3-4x more memory to work with than the process is using at any time, and this tradeoff is not acceptable for Swift.

https://github.com/apple/swift-evolution/blob/master/commonly_proposed.md

the fastest GC "matches or exceeds (by up to 9%) the runtime performance of the best explicit memory manager when given five times as much memory"
ARC "does not slow down in constrained memory environments."
https://www.reddit.com/r/programming/comments/2xj9ku/memory_management_myths_in_apple_circles/

## Idle power consumption

UFS offers a low active power level and a near-zero idle power level
https://www.reddit.com/r/Android/comments/2m9h1t/samsung_and_xiaomi_to_switch_to_faster_ufs_memory/cm2b4ai
