- leading zero in the body will be trimmed by i.e. angular $http, so add quotes like "051" http://stackoverflow.com/questions/8335108/json-net-how-to-preserve-leading-zeros-in-numbers/8335128#8335128

## Single or double quotes

>> The formal JSON format does not allow strings in single quotes, but an implementation is allowed to accept them.
> So some implementations will accept single quotes - but you should not rely on this
> - http://stackoverflow.com/questions/2275359/jquery-single-quote-in-json-response/2275428#2275428
