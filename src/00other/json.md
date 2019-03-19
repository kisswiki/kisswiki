- leading zero in the body will be trimmed by i.e. angular $http, so add quotes like "051" http://stackoverflow.com/questions/8335108/json-net-how-to-preserve-leading-zeros-in-numbers/8335128#8335128
- http://jsonplaceholder.typicode.com/users/1

## Date format

http://stackoverflow.com/questions/10286204/the-right-json-date-format

JSON itself does not specify how dates should be represented, but JavaScript does.

You should use the format emitted by Date's toJSON method:

`2012-04-23T18:25:43.511Z`

## Single or double quotes

>> The formal JSON format does not allow strings in single quotes, but an implementation is allowed to accept them.
> So some implementations will accept single quotes - but you should not rely on this
> - http://stackoverflow.com/questions/2275359/jquery-single-quote-in-json-response/2275428#2275428

Only double quotes according to rfc:

> The representation of strings is similar to conventions used in the C family of programming languages.
https://tools.ietf.org/html/rfc7159

A string in C:

> A character string literal is a sequence of zero or more multibyte characters enclosed in
double-quotes, as in "xyz"
http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1570.pdf

Latest C standard spec http://stackoverflow.com/questions/17014835/where-can-i-find-the-c89-c90-standards-in-pdf-format/24925468#24925468

## Minimu JSON

- https://stackoverflow.com/questions/18419428/what-is-the-minimum-valid-json
- empty string is not valid json https://stackoverflow.com/questions/30621802/why-does-json-parse-fail-with-the-empty-string
