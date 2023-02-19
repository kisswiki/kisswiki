LongBear#2388

## values

- A value does not have a pointer and is allocated to the stack
- A value is written as e.g. `var value: u32 = 2`

## pointer

- Is an address to either a single value or a sequences of values
- A mutable pointer to an array can be written as e.g. `var ptr: [*] f32 = {...}`
- Can be indexed `ptr[i]`
- Can be sliced `ptr[i..n]`
- Can do pointer math `p + x`

## slices

- Is a pointer to a sequence of values (`f32, i32, etc.)` + a length (`usize`) of that sequence (that is only known at runtime)
- A mutable slice can be written s e.g. `var s = [] f32{...}`
- Is exactly the same as a pointer to an array (can get slice by coercing from a pointer to an array `s = &arr` or `s = arr[0..]`)
- Can index `s[i]`
- Can slice `s[i..n]` or `s[i..]`
- Can copy data from another slice (as long as it is not a const-slice)
- Can get pointer `s.ptr`
- Can get length `s.len`
- Can iterate `for (s) |x, i| {...}`

## arrays

- Is a sequence of values (`f32, i32, etc.)` + a length (`usize`) to that sequence of values (that is known already at compile time)
- Is written as e.g. `a = [N] f32{...}`
- Can get length `a.len`
- Can slice `a[i..n]` or `a[i..]`
- Can copy data from another array (as long as it is not a const-array)
- Can iterate `for (a) |x, i| {...}`

## Usage of const keyword

- can refer to the "pointer type" of a slice or array, whether we can do `s[0] =`
- can refer to the slice or array value itself, whether we can do `s = ` (prevents overwriting values in our program)
- if const refers to the value itself, then it is only possible to get an immutable pointer

## Summary

- pointers are elements that make up both slices and arrays (together with length)
- the only difference between a slice and an array is when we expect to know the value of the length (i.e. at runtime for slices and at compile time for arrays)
- const keyword can refer to the pointer or to the value itself

Tetralux#0738

Pretty close. Only a few things to point out:

1. A mutable pointer to an array (`[*]T`) cannot be made from a literal - you'd need to store an array and then take its address + coerce it.
   You can probably do `var ptr : [*]const f32 = &[3]f32{1, 2, 3};` though.
2. You cannot do pointer math on arbitrary pointers; only `[*]T` and `[*]const T`. (i.e: Not `*T`.)
3. An array doesn't contain its length as a field; it's just N x Ts next to each other in a row. `array.len` is just syntax sugar, basically.
   Slices do have a length that they carry around at runtime, however.
4. Arrays -are- their data (N x Ts in a row); slices -point at- their data.
   This is observable in that slices are always 16 bytes in size, regardless of what they point to -- arrays are always `count * @sizeOf(ElementType)` though.
5. "Pointers are elements that make up both slices and arrays" is incorrect.
   Arrays are values, so they don't involve a pointer in any way.
   (It can get confusing in C, because while they're also values there, they DECAY very easily to a pointer, so can confused of as a pointer inherently when they aren't.)
   Slices are a structure that is given special status, who's purpose is to be a way of talking about data that's elsewhere -- much like a pointer --- and indeed, that's reflected by the fact that they consist of a pointer and a length.
   So pointers and arrays are the basic units here, and slices use a pointer to perform their job.

From https://discord.com/channels/605571803288698900/1027399952898474016
