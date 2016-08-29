> It's probably stack overflow. Unfortunately musl libc has small stack (80kib) but rust usually relies on large stack (order of megabytes). I could not find easy way to change the stack size previously.
> https://github.com/tailhook/vagga/issues/116#issuecomment-154092087
