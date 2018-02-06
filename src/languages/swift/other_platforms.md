Unfortunately it seems to me that Swift on non-Apple platforms will forever be stuck in Mono-like role: "kinda working", but always the second class citizen that just waits to spring a hard-to-debug issue on you due to different implementation of underlying libraries. I wouldn't trust it with production code, especially considering how many other stable and properly supported cross-platform languages exist.

I've been maintaining a project at work since Swift 2, where the goal has always been to add Linux support (in addition to macOS and iOS) as soon as it is viable. That project's fairly simple requirements include basic HTTPS networking, JSON encoding/decoding, managing multithreaded operation queues, and defining a hierarchy of objects to model an API's data structures. It doesn't need a GUI.

So I've looked at each Swift release through the lens of "Can we add Linux support yet?", and I would say Swift 4 will be the first release where it is viable. Viable, but still with caveats:

1. The best tooling is still Xcode; the best way to write Swift code for Linux is to do it on a Mac with Ubuntu running in a VM, sharing the Mac's filesystem. Of course you can write code on Linux, but there are no editors that have more than a rudimentary set of Swift tools for code-completion, static analysis, or visual debugging.
2. There are still many landmines lurking in the standard libraries on Linux. These are mostly obvious when you find them; various parts of the Foundation library (which is a Swift-native reimplementation of Apple's core framework for building apps, including basic networking, filesystem access, unicode string stuff, URL manipulation, UUIDs, etc.) have parts where the interface is there but the implementation on Linux just calls NSUnimplemented(), which immediately traps and halts the program. Fortunately, there are far fewer of these places in Swift 4 than Swift 3.

    For this reason, if you are writing cross-platform Swift code that needs to run on macOS and Linux, you will probably find yourself using Swift's #ifdef-like "#if os(Linux) ..." feature to conditionalize execution based on the platform.
3. Testing is a pain, because unlike on Apple platforms, which can borrow objc runtime features to do weird magic, Swift's native reflection capabilities still are not very strong, preventing it from doing useful things like finding and executing all your test cases automatically. You have to add an "#if os(Linux)" section to each test case class, and then manually add redundant boilerplate for each test method that your write. The more tests you write and refactor, the more annoying this is.
4. Nothing works at first. It's not straightforward to just unpack a dev release and get basic things working: importing libraries into the REPL, debug on Linux using lldb. Those things do work but you will have to visit the Swift JIRA tracker and to learn the magic collection of permission changes, command-line flags, and environment variables that make it all possible.
5. If Swift had a good answer for interprocess communication it would be awesome as a kind of scripting language. However, it does not. It has this terrible API based on the old Mac NSTask class, and you will probably end up abandoning that and trying to write an interface to popen(), write 100 lines of error-handling code just to launch some UNIX tool and get its result, rub your eyes, sigh, close the editor, delete the file, and write it in ruby or python.
However, there is also some really awesome stuff:

    a) Swift itself is awesome to program in, and except where explicitly unimplemented, it is stable and fast on Linux.
    b) Swift Package Manager is now robust and a pleasure to work with.
    c) The build system works great on Linux, aside from the slowness of a young compiler (which is not specific to Linux).
    d) The new Codable API for serialization is significant because none of the popular JSON libraries for Swift worked well on Linux (IBM had a fork of one that was purported to work). Now, it's built-in, awesome, and works great on Linux.
    e) If a web-delivered app UI is a requirement, there is some really awesome competition going between Vapor (I think still the most popular Swift web framework) and IBM's Kitura web app framework. Considering how niche Swift still is for web development, there is an amazing level of work being done in this area.

That's on off-the-top-of-my-head summary of where Swift on Linux is. I don't think it is at all advanced yet on any other non-Apple platforms.

https://news.ycombinator.com/item?id=14972637
