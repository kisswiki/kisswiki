# a custom search provider for Chrome

Right-click the address bar and choose 'Edit search engines...', or just go to your search settings. Scroll down to create a new one.

Name: Rust Standard Library

Keyword: rustdoc ('rust' interferes with other searches)

URL: http://doc.rust-lang.org/std/?search=%s

The %s will be replaced with your search term. So typing this:

rustdoc contains

Will take you to:

http://doc.rust-lang.org/std/?search=contains

https://www.reddit.com/r/rust/comments/38llx6/how_to_see_if_a_str_contains_a_certain_substring/crxqz7t/
