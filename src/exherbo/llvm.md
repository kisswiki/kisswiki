```
> 16
LLVM :: tools/llvm-symbolizer/print_context.c
^MFAIL: LLVM :: tools/llvm-symbolizer/print_context.c (14192 of 15616)
******************** TEST 'LLVM :: tools/llvm-symbolizer/print_context.c' FAILED ********************
Script:
--
/usr/bin/x86_64-pc-linux-gnu-cc  -O0 -g /var/tmp/paludis/build/dev-lang-llvm-3.8.0-r1/work/llvm-3.8.0.src/test/tools/llvm-symbolizer/print_context.c -o /var/tmp/paludis/build/dev-lang-llvm-3.8.0-r1/work/build/te
st/tools/llvm-symbolizer/Output/print_context.c.tmp 2>&1
/var/tmp/paludis/build/dev-lang-llvm-3.8.0-r1/work/build/test/tools/llvm-symbolizer/Output/print_context.c.tmp 2>&1 | /var/tmp/paludis/build/dev-lang-llvm-3.8.0-r1/work/build/./bin/llvm-symbolizer -print-source-
context-lines=5 -obj=/var/tmp/paludis/build/dev-lang-llvm-3.8.0-r1/work/build/test/tools/llvm-symbolizer/Output/print_context.c.tmp | /var/tmp/paludis/build/dev-lang-llvm-3.8.0-r1/work/build/./bin/FileCheck /var
/tmp/paludis/build/dev-lang-llvm-3.8.0-r1/work/llvm-3.8.0.src/test/tools/llvm-symbolizer/print_context.c --check-prefix=CHECK
--
Exit Code: 1

Command Output (stderr):
--
/var/tmp/paludis/build/dev-lang-llvm-3.8.0-r1/work/llvm-3.8.0.src/test/tools/llvm-symbolizer/print_context.c:17:11: error: expected string not found in input
// CHECK: print_context.c:7
          ^
<stdin>:2:1: note: scanning from here
??:0:0
^
```
