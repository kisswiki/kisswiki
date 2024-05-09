No, you can use _ = g; for marking as "yes compiler i know its unused", and for mutability errors, just replace the var with const (there is _ = &g;, but its kind-of a hack, and you should probably just temporarily set it as const).

the first is done automatically by ZLS' autosave feature, but the second you have to do yourself

https://github.com/ziglang/zig/issues/3320#issuecomment-2101982600
