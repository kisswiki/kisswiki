
## add

- https://stackoverflow.com/questions/44710877/how-do-i-add-days-to-a-chrono-utc
- http://exercism.io/submissions/1264089798d244e5b8278e588919901c

##

If you want precise date and time calculations for scientific applications, I would recommend hifitime. It handles leap seconds, Julian dates, and moving reference frames (i.e. time dilation).

Disclaimer: I'm the author and maintainer of this crate. I wrote it specifically for my astrodynamics toolkit which is validated against NASA software.

- https://www.reddit.com/r/rust/comments/9s4zs8/best_crate_for_datetime_handling/e8ne5fw/
- https://crates.io/crates/hifitime

##

humantime is pretty great for RFC3339 date/time parsing too. Around 5-10x the speed of chrono.

- https://crates.io/crates/humantime
- https://www.reddit.com/r/rust/comments/9s4zs8/best_crate_for_datetime_handling/e8mkuti/

