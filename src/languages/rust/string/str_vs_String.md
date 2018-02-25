- https://www.reddit.com/r/rust/comments/5t5zq1/when_to_use_str_over_string_in_a_struct/

##

For `String` and `&str` the situation is the same. `String` is for storing string values in the sense that a variable of this type owns that value. `&str` is for borrowing them.

https://stackoverflow.com/questions/28800121/use-of-moved-values