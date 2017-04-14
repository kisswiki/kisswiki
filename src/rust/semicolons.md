http://stackoverflow.com/questions/26665471/semicolons-are-optional-in-rust


Expressions return a value, and statements do not

There are two kinds of statements in Rust: ‘declaration statements’ and ‘expression statements’.

Everything else is an expression.

use semicolons to separate expressions from each other


declaration statement:

let mut y = 5;

good:

fn add_one(x: i32) -> i32 {
    x + 1
}

bad:

fn add_one(x: i32) -> i32 {
    x + 1;
}

https://doc.rust-lang.org/book/functions.html
