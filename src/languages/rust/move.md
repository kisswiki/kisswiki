- https://stevedonovan.github.io/rust-gentle-intro/2-structs-enums-lifetimes.html#rust-likes-to-move-it-move-it

##

Rust is, as I would say, a “value-oriented” language. This means that if you define primes like this

`let primes: Vec<u64> = …`
it is not a reference to a vector. It is practically a variable that stores a value of type `Vec<u64>` just like any `u64` variable stores a u64 value. This means that if you pass it to a function defined like this

`fn vec_is_prime(num: u64, vec: Vec<u64>) -> bool { … }`
the function will get its own u64 value and its own `Vec<u64>` value.

The difference between `u64` and `Vec<u64>` however is that a `u64` value can be easily copied to another place while a `Vec<u64>` value can only move to another place easily. If you want to give the `vec_is_prime` function its own `Vec<u64>` value while keeping one for yourself in main, you have to duplicate it, somehow. That's what's `clone()` is for. The reason you have to be explicit here is because this operation is not cheap. That's one nice thing about Rust: It's not hard to spot expensive operations. So, you could call the function like this

`if vec_is_prime(num, primes.clone()) { …`
but that's not really what you want, actually. The function does not need its own a `Vec<64>` value. It just needs to borrow it for a short while. Borrowing is much more efficient and applicable in this case:

`fn vec_is_prime(num: u64, vec: &Vec<u64>) -> bool { …`
Invoking it now requires the “borrowing operator”:

`if vec_is_prime(num, &primes) { …`
Much better. But we can still improve it. If a function wants to borrow a `Vec<T>` just for the purpose of reading it, it's better to take a `&[T]` instead:

`fn vec_is_prime(num: u64, vec: &[u64]) -> bool { …`
It's just more general. Now, you can lend a certain portion of a `Vec` to the function or something else entirely (not necessarily a `Vec`, as long as this something stores its values consecutively in memory, like a static lookup table). What's also nice is that due to coersion rules you don't need to alter anything at the call site. You can still call this function with `&primes` as argument.

For `String` and `&str` the situation is the same. `String` is for storing string values in the sense that a variable of this type owns that value. `&str` is for borrowing them.

