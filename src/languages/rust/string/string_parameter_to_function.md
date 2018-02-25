>what you really want here is a `func1` that can easily be passed any string, be it a `&str` or a `String`. Because a `String` will Deref to a `&str`, you can have func1 accept an `&str`, thereby avoiding the `String` allocation altogether.

https://stackoverflow.com/questions/31331356/how-to-create-a-string-directly/31333653#31333653