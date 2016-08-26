- `https://www.owasp.org/index.php/XSS_(Cross_Site_Scripting)_Prevention_Cheat_Sheet`
- http://security.stackexchange.com/questions/32394/when-to-escape-user-input
- https://www.quora.com/What-are-the-best-practices-for-escaping-or-sanitizing-user-input-in-PHP
- https://en.wikipedia.org/wiki/Secure_input_and_output_handling

> It's a common misconception that user input can be filtered. PHP even has a (now deprecated) "feature", called magic-quotes, that builds on this idea. It's nonsense.
> Whenever you embed a string within foreign code, you must escape it, according to the rules of that language
> Do not try to prevent SQL injection by sanitizing input data.
> Instead, do not allow data to be used in creating your SQL code. Use Prepared Statements
> You can't generically filter data without any context of what it's for. Sometimes you'd want to take a SQL query as input and sometimes you'd want to take HTML as input
> http://stackoverflow.com/questions/129677/whats-the-best-method-for-sanitizing-user-input-with-php

## HTML

> Rule \#1 is for when you want to put untrusted data directly into the HTML body somewhere. This includes inside normal tags like div, p, b, td, etc. Most web frameworks have a method for HTML escaping for the characters detailed below. However, this is absolutely not sufficient for other HTML contexts.
> RULE \#6 - If your application handles markup -- untrusted input that is supposed to contain HTML -- it can be very difficult to validate. Encoding is also difficult, since it would break all the tags that are supposed to be in the input. Therefore, you need a library that can parse and clean HTML formatted text.
