\_F0X

as zig is free to pass structs by value or reference, is it generally better to make use of this and let the compiler decide than to just use const pointers?
Lia

yep!

Wczoraj o 12:50
and is there any situation when passing pointers is better, or said otherwise whats the rule of thumb which one to chose?

Luuk

Pass a pointer when you need to modify struct fields (as function parameters are constant by default)
\_F0X

of course, but that means passing const pointers is basically unnecessary?

alexnaskos

Mostly

Luuk

Not completely, sometimes a pointer is all you have
For example when working with some C library

alexnaskos

Sometimes you just want a const pointer to store in some data structure

\_F0X

true, but for general read only operations on some data structure you just use the normal pass by value syntax, i see

So it is pass by value syntax, but zig can send reference? Where can I read more about it?

\_F0X

https://ziglang.org/documentation/master/#Pass-by-value-Parameters

rofrol

How is it essentially free? "copying a primitive type is essentially free and typically involves nothing more than setting a register."

It is some assembly magic?

fengb

No, it's passed in a register
That's the same for most low level languages
If a variable exists in scope and is passed, the compiler will (probably) structure the code so it'll already be in the right place
And if not, it's a register mov which is as fast as a memory instruction can go

Tetralux

Structures are also typically larger than a register, and thus can be more economical to pass by pointer instead of accessing memory to do a copy for a function call, which it would have to do to do a by-val call.
Primitives fit in a register, unless they are absurdly big (which they almost always are not), and thus are as cheap to copy as you can go.

fengb

The real trick Zig employs is lack of defined ABI, so it's allowed to do silly stuff like split a struct into 6 registers
Which might be faster than a pointer
(Or it might not... that's why you let the optimizer choose)
