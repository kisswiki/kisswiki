Zig does not have this declaring variable in loop like `for(let i = 0; i < 10; i += 1) {}`. You need to do this:

```zig
   {
        var i: usize = 0;
        while (i < 10) : (i += 1) {
            list.append(@intCast(i32, i + 1)) catch @panic("");
        }
    }

    {
        var i: usize = 0;
        while (i < 10) : (i += 1) {
            testing.expectEqual(@intCast(i32, i + 1), list.inner.items[i]);
        }
    }
```

- https://github.com/ziglang/zig/issues/5070

It looks like this was the reason that motivated Linus Torvalds to finally move the Linux Kernel to a newer C standard

https://www.reddit.com/r/Zig/comments/t1ty7e/comment/hyij4tn/

Torvalds wrote to the Linux Kernel Mailing List (LKML) that "the whole reason this kind of non-speculative bug can happen is that we historically didn't have C99-style 'declare variables in loops." So list_for_each_entry() - and all the other ones - fundamentally always leaks the last HEAD entry out of the loop, simply because we couldn't declare the iterator variable in the loop itself."

https://www.zdnet.com/article/linus-torvalds-prepares-to-move-the-linux-kernel-to-modern-c
