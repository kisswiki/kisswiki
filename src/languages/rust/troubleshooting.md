## expected type `std::string::String` found type `&'static str`

The way you usually convert a &str to a String is to_owned, e.g.

`"me".to_owned()`

http://stackoverflow.com/a/32501296/588759

