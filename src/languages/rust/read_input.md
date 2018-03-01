- https://www.reddit.com/r/rust/comments/7c0mo4/reading_space_separated_numbers_one_by_one/
- https://stackoverflow.com/questions/30186037/read-a-single-line-from-stdin
- https://stackoverflow.com/questions/13579266/how-to-read-user-input-in-rust

## stdin::read_line

What about `stdin::read_line`?

that function is rather odd to use in my opinion.

https://stackoverflow.com/questions/30186037/read-a-single-line-from-stdin#comment48481165_30186553

If you want more control over where the line is read to, you can use Stdin::read_line. This accepts a &mut String to append to. With this, you can ensure that the string has a large enough buffer, or append to an existing string

- https://stackoverflow.com/questions/28528998/how-do-i-read-a-single-string-from-standard-input