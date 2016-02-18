- language
  - https://swift.org/blog/swift-api-transformation/
  - https://developer.apple.com/swift/blog/?id=29
  - http://www.infoworld.com/article/3027100/mobile-development/seven-swift-2-enhancements-every-ios-developer-will-love.html
  - roadmap https://github.com/apple/swift-evolution/blob/master/README.md
- game
  - https://medium.com/magnetis-backstage/your-first-ios-game-fda99504c3e4
  - http://open.bekk.no/a-swift-run-through-making-an-ios-game
- job
  - http://artsy.github.io/blog/2016/01/30/iOS-Junior-Interviews/
- vs
  - http://www.slideshare.net/KyleSherman/swift-at-linkedin
  - objective-c
    - http://ericasadun.com/2016/02/08/when-your-client-demands-swift/
    - For larger apps, well, I have a Swift app that isn't really very big, probably still small but significantly bigger than a tutorial, and it keeps freezing Xcode. (Edit something in Interface Builder, switch to the ViewController class with IBOutlets in it, then switch back and forth between ViewControllers making edits. Each time it takes longer and longer until I just force-quit Xcode to avoid twiddling my thumbs for 5 minutes.) So I don't think Swift is ready for any app that isn't pretty small anyway. https://news.ycombinator.com/item?id=10925916
    - I think the gain is mostly that Swift allows you write code which more resistant to bugs than its ObjC counterpart would be. In Yaron Minsky's "Effective ML" talk, he mentions the idea of "Make illegal states unrepresentable": https://vimeo.com/14313378 The combination of enums and non-optional variables allows you to get much closer to this ideal than you could with ObjC. https://news.ycombinator.com/item?id=10925793
    - Yeah as nice as Swift is, Cocoa was designed for Objective-C.  
      e.g. -[NSBezierPath setLineDash:count:phase:] takes a C array in Objective-C, but an UnsafePointer<CGFloat> in Swift.  
      Apple needs new API interfaces for their new language, and that will take time.  
      https://news.ycombinator.com/item?id=10925668  
      This will improve in Swift 3.0, via an improved mapping of Cocoa APIs into Swift (naming wise):  
      https://github.com/apple/swift-evolution/blob/master/proposals/0005-objective-c-name-translation.md  
      At some point in the future I imagine we would also see native Swift APIs.  
      https://news.ycombinator.com/item?id=10927557
    - We tried using Swift for a new app but the language isn't ready for prime time. It's an impressive language by itself, but the support for it just isn't there yet. Since it's still in infancy things change too much and documentation/stackoverflow is pretty weak. Our app was simple but we spent more time trying to make it work than actually programming and ended up doing an obj-c rewrite in less time. I'm sure this scenario won't be the case for long, but it's the case for now. https://news.ycombinator.com/item?id=10924737
    - So far there are some performance issues with containers as value types. Other bottlenecks are structs that contain many references types. https://news.ycombinator.com/item?id=10924984
    - http://www.slideshare.net/KyleSherman/swift-at-linkedin/31
- most loved - swift http://stackoverflow.com/research/developer-survey-2015#tech-super
- learn
  - http://blog.pusher.com/5-reasons-you-should-learn-swift-in-2016-2/
- 89% of top 100 apps don't use Swfit (2016-01-10) https://medium.com/art-marketing/are-the-top-apps-using-swift-42e880e7727f
- style guide https://github.com/SlideShareInc/swift-style-guide/
- Migrattion tips from Objective-C https://www.reddit.com/r/swift/comments/451xmo/transitioning_from_objective_c_to_swift_without/
- https://github.com/vsouza/awesome-ios#getting-started
- https://www.reddit.com/r/swift/comments/456y2c/what_are_some_of_the_best_swift_app_github_repo/
- https://github.com/allenwong/30DaysofSwift
