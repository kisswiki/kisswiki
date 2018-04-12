as_ref comes from the AsRef<T> trait. String implements AsRef<str> and AsRef<[u8]>, so my_string.as_ref() could be &str or &[u8](or maybe some other types) depending on context. In cases rustc can't quite figure out which type it should be, rustc will give you the 'cannot resolve' error.

as_str, on the other hand, is directly attached to String, and will always return &str.


The problem is that there's nothing stopping you from writing this:

impl<'a> convert::TryFrom<&'a [u8]> for Sequence {
...and then your second snippet would suddenly be ambiguous.

From the compiler's view, my_string.as_ref() would be of type &T where String: AsRef<T> and Sequence: TryFrom<&T> (lifetimes omitted). While there's only one type(str) satisfying this in this case, there can be multiple matches in similar cases, and the compiler doesn't really try to solve this(It seems).

As for str and [u8], yes, str is just [u8] with UTF-8 encoding, but no, the type checker doesn't know that.


Yes, &str has the same representation as &[u8], but no, it has nothing to do with the ambiguity. The point is that as_ref() is a method with a generic return type and no arguments. So unless the compiler can figure out the desired type from where you use the result, it has no chance knowing what you wanted. And try_from() is a method with a generic argument, so no help there.

(You could argue that the compiler should look at all implementations of TryFrom, and recognize that there is none for &[u8]. But that would make all this code break once somebody did add an impl for &[u8] (or maybe generic &[T]).)

https://www.reddit.com/r/rust/comments/8aw450/hey_rustaceans_got_an_easy_question_ask_here/dx2hgbg/