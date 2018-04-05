
##


[–]cogman10
[+1] 21 points 6 hours ago 

DON'T WRITE SIMD!
Find a hot spot after profiling
Complain because the compiler didn't optimize this for you.
Measure the hotspot with realistic data
See if a better algorithm is more appropriate.
If all else fails, Write SIMD for hotspot
Measure and make sure SIMD is faster.
The really important point is to avoid explicit SIMD if you can. Because, compilers are constantly getting better about how they do things, SIMD is one of those "I'm taking the wheel" scenarios that keeps the compiler from doing optimizations. Similar to how you shouldn't bust out assembly for everything.

If you can think of a scenario where you want to perform some operation on 512 bytes of data, then SIMD is the way to do that. Everything from generating Hashes to compressing data. If you can imagine an operation where you are zipping over many bytes or numbers then you can probably figure out how to use SIMD there.

It really shines when you start talking about doing any sorts of math. Things like multiplying and adding a number to a bunch of numbers, or dividing a bunch of floats, those sorts of things are the playground of SIMD. You'll find that in games, image processing, etc.

But again, don't start by writing SIMD. The compiler can already tackles a lot of the simple scenarios for SIMD and you should just let it do that. This will allow faster performance on more platforms and faster performance in the future as the compiler gets better.

permalink embedsave parentreportgive goldreply

[–]anttirt
 2 points 54 minutes ago 
0. Design your data flow in a way that's amenable to batch array processing, because otherwise there's not going to be a "hotspot" to optimize later on.

https://www.reddit.com/r/rust/comments/89szbq/this_commit_stabilizes_the_simd_in_rust_for_the/