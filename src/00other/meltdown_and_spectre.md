- https://dev.to/isaacandsuch/how-meltdown-works-28j2

I am not 100% certain but I believe with the cache based attacks at least, the abuse of the speculation is only part of the process. The actual leak comes from a secondary stage.

One example would be to make the speculative execution access a place (let's call it X) in memory, causing it to be cached. The trick is that location X is actually a number that is read out of another protected memory location.

The thing is, normally you can't access that protected location. But the speculative execution ignores the protection (or, rather, it delays verifying the protection until later) so it actually does read that piece of memory, and uses that to then access and cache another piece of memory.

Then, the final stage is, you then read all the memory locations that X could have been, and see which one got cached. By seeing which one got cached, you then know what the value of the protected memory was.

It works because even when the processor realizes you weren't allowed to see that protected memory and eventually blocks it, the change to the cache remains and leaves the clue you need.

I don't know how the new one could work as it seems even more abstracted.


The speculative execution does not ignore the protection or do it later. CPUs could push that to later, but since determining the physical (RAM) address requires MMU translation anyway they end up checking permissions at the same time.

The value of the branch prediction trickery is you can find a piece of privileged code that will access the location you want if only certain conditions are true, then you can make it access the location even if the conditions aren't true by training the branch predictor to believe that the condition is true and so speculatively performing the access.

The most trivial version of this would be is if you had a function which will read from a privileged array for you but only after checking to see if it's okay you can train the CPU to think it will be okay and thus get the access done.

So basically, if it's a 1,000 element array you can ask for the 3,325,203rd entry to be read for you and train the CPU to think that the bounds check on the array will pass even though it won't. Then the CPU will speculatively perform the load of the 3,325,203rd entry. The code must also then make a decision based upon the value and read another location. Then you can test to see if that other location was speculatively loaded to see what the value of the first location was.

Since with a sufficiently low pointer value and no bounds checking (because you tricked it) you can access all of memory this could be a powerful tool.

https://www.reddit.com/r/programming/comments/87ijph/as_predicted_more_branch_prediction_processor/dwduc9g/