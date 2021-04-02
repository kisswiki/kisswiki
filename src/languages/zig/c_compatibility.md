Chem
I ran `zig translate-c` on a few lines of simple C and the resulting Zig code was pretty unreadable/complex

Tetralux

If you just want to call some C functions, it's pretty easy.
You essentially make a forward declaration of it using extern:

```zig
int f() { /* implementation */ }


extern fn f() c_int; // calling this, calls 'f' above.
                     // note: you can provide 'callconv(.C)' before return type, but that's the default for externs
```

For structs, simply declare an extern struct and the compiler should prevent you from using anything non-C-ABI compatible with it.

```zig
typedef struct slice_t {
    void *ptr;
    uintptr_t len;
};


const slice_t = extern struct {
    ptr: ?*c_void, // Zig optionals are compatible with the C ABI
    len: usize,
};
```
