Jolololol
—
30.03.2021
Is there anything in the std lib that will copy an array/slice into a new array and allocate that new array? I know I can do std.mem.copy, but I was hoping I could hide the boilerplate of abstracting the new array as well.
Luuk
—
30.03.2021
%%std.mem.Allocator.dupe
Zigbot 9001BOT
—
30.03.2021
std.mem.Allocator.dupe
https://github.com/ziglang/zig/blob/master/lib/std/mem/Allocator.zig#L456-L461
