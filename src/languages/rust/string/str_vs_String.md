- https://www.reddit.com/r/rust/comments/5t5zq1/when_to_use_str_over_string_in_a_struct/
- https://stackoverflow.com/questions/24158114/what-are-the-differences-between-rusts-string-and-str/
- http://www.ameyalokare.com/rust/2017/10/12/rust-str-vs-String.html

##

For `String` and `&str` the situation is the same. `String` is for storing string values in the sense that a variable of this type owns that value. `&str` is for borrowing them.

https://stackoverflow.com/questions/28800121/use-of-moved-values