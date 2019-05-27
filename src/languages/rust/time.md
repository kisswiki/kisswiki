## parse string to datetime

`cargo add chrono`



```rust
extern crate chrono;
use chrono::DateTime, Local};
use chrono::format::ParseError;

let date_published: Datetime<Local> =
	DateTime::parse_from_rfc3339(&date_published_string)
		.unwrap()
		// below converts from FixedOffset to Datetime<Local>
		.with_timezone(&Local);
```

>There is an important identity that `utc.with_timezone(&Local).with_timezone(&UTC)` should be equal to utc (except for the exceptional case, where the local time zone has been changed). https://stackoverflow.com/questions/28747694/how-do-i-convert-a-chrono-datetimeutc-instance-to-datetimelocal/28756464#28756464

- https://rust-lang-nursery.github.io/rust-cookbook/datetime/parse.html#parse-string-into-datetime-struct
- https://stackoverflow.com/questions/31186864/how-to-convert-datetimeutc-to-datetimefixedoffset-or-vice-versa

With time zone (have not checked if that works):

```rust
let tz: Tz = "Europe/London".parse().unwrap()
let date = "2014-11-28T21:00:09Z".parse::<DateTime<Utc>>().with_timezone(&UTC)
```

https://news.ycombinator.com/item?id=16659776

## add

- https://stackoverflow.com/questions/44710877/how-do-i-add-days-to-a-chrono-utc
- http://exercism.io/submissions/1264089798d244e5b8278e588919901c

## hifitime - precise date and time calculations for scientific applications

If you want precise date and time calculations for scientific applications, I would recommend hifitime. It handles leap seconds, Julian dates, and moving reference frames (i.e. time dilation).

Disclaimer: I'm the author and maintainer of this crate. I wrote it specifically for my astrodynamics toolkit which is validated against NASA software.

- https://www.reddit.com/r/rust/comments/9s4zs8/best_crate_for_datetime_handling/e8ne5fw/
- https://crates.io/crates/hifitime

## humantime vs chrono

humantime is pretty great for RFC3339 date/time parsing too. Around 5-10x the speed of chrono.

- https://crates.io/crates/humantime
- https://www.reddit.com/r/rust/comments/9s4zs8/best_crate_for_datetime_handling/e8mkuti/

## misc

- https://crates.io/crates/chrono
- https://stackoverflow.com/questions/55214065/how-to-set-a-chrono-datetime-to-a-specific-date-and-time
- https://achntrl.com/2018/05/23/100_days_of_rust/
- [Can't parse datetime from another timezone · Issue #255 · chronotope/chrono](https://github.com/chronotope/chrono/issues/255)
- https://stackoverflow.com/questions/50312999/how-do-i-go-from-a-naivedate-to-a-specific-timezone-with-chrono
- https://rust-lang-nursery.github.io/rust-cookbook/datetime/duration.html
