- hello.zig
  - const
    - std
      - @import
        - const std = @import("std");
  - pub
    - fn
      - main
        - !void
          - pub fn main() !void {}
            - std
              - io
                - getStdOut
                  - writer
                    - const stdout = std.io.getStdOut().writer();
            - try
              - stdout
                - print
                  - {s}
                    - .{"world}
                      - try stdout.print("Hello, {s}!\n", .{"world"});
                    - // comments
                    - anonymous struct literal
                  - also
                    - std.log
                    - std.debug.print
          - `<error set type>!<any data type>`
        - pub fn main needed for executable
        - main tells where the program starts
        - library does not need main
          - library code is called by
            - other programs
            - other libraries
      - may not be public
      - may return data
  - https://ziglang.org/documentation/master/#toc-Hello-World
- .gitignore
  - zig-cache
  - zig-out
  - https://github.com/ziglang/zig/blob/master/.gitignore
- zig
  - build-exe
    - zig build-exe hello.zig
    - ./hello
  - init-exe
    - zig init-exe
      - build.zig
      - src/main.zig
        - const std = @import("std");
        - std
          - log
            - info
              - .{}
                - std.log.info("Hello", .{});
                  - info: Hello
  - build
    - run
      - zig build run
        - watchexec -e zig
          - watchexec -e zig zig build run
            - watchexec -e zig 'zig build run -- get two'
    - https://ziglang.org/learn/getting-started/
    - https://ziglang.org/documentation/master/#toc-Building-an-Executable
- language
  - functions
    - fn
      - pub
        - pub fn main
    - return type
      - `<error union set>!<any data type>`
        - void
          - minimum required if no return
        - !void
        - anyerror!void
    - built-in functions
      - @import
      - @typeName
        - @typeName(@TypeOf(number_or_error))
      - @TypeOf
    - error: unused function parameter
      ```zig
      _ = self
      ```
  - comments
    - // single line comment
    - /// multiline
    - /// doc comment
    - /// only allowed in certain places
    - //! multiline top level doc comment that does not belong to whatever immediately follows
  - values
    - types
      - primitive types
        - integer
          - i2
          - i32
        - float
          - f3
          - f24
          - f32
        - boolean
          - true and false
          - true or false
          - !true
        - anyerror
          - var number_or_error: anyerror!i32 = error.ArgNotFound
      - string literals
        - about
          - underlying data structure
            - constant
              - single-item
                - pointers
            - to null-terminated
              - byte
              - arrays
            - constant single-item pointers to null-terminated byte arrays
            - `*const`
              - `[5:0]`
              - `u8`
                - `*const [5:0]u8`
          - coerced to
            - slices
            - null-terminated
              - pointers
          - dereferencing
            - converts
              - to arrays
          - utf-8
            - unicode code points
              - comptime_int
        - escape sequences
          - `\n`
          - `\\` backslash
          - `\'` single quote
          - `\"` double quote
          - for not-utf-8 bytes use `\xNN` notation - hexadecimal 8-bit value (2 digits)
            - 8-bit value. 4 bits and 4 bits. 15*16^1 + 15*16^0 = 240 + 15 = 255
          - `\u{NNNNNN}` hexadecimal Unicode code point UTF-8 encoded (1 or more digits)
        - multiline string literals
          - `\\`
            - `\\multline string`
            - `\\literal`
        - code
          - const bytes = "Hello";
            - bytes.len
            - bytes[1] == 'e'
            - bytes[5] == 0
          - std.debug.print
            - std.debug.print("{}", .{'e' == '\x65'}); // true
            - std.debug.print("{d}", .{'\u{1f4a9}'}); // 128169
            - std.debug.print("{u}", .{'⚡'});
          - == compare strings
            - std.debug.print("{}", .{std.mem.eql(u8, "hello", "h\x65llo")});
            - always compare string literals with std.mem.eql otherwise you may get error
              - error: operator not allowed for type '[:0]const u8'
                - The problem is that `==` is defined for strings of the same length but not strings of differing lengths. So `"foo" == "bar"` compiles because these are both `*const [3:0]u8`, but `"foo" == "quux"` does not. In this case, the two operands are `*const [3:0]u8` and` *const [4:0]u8`, so the compiler performs peer type resolution to `[:0]const u8`, and then attempts to do `==`, which causes a compile error. https://github.com/ziglang/zig/issues/8290#issuecomment-802473796
      - struct
        - anonymous struct literal
          - .{}
            - .{"Hello"}
          - error: cannot assign to const
            ```zig
            const Token = struct {
              tag: []const u8,
            };
            // should be:
            // var t = Token{ .tag = "Hello" };
            var t = .{ .tag = "Hello" };
            t.tag = "World";
            ```
        - error: expected 0 argument(s), found 1
          ```zig
            const Lexer = struct {
              fn next() []const u8 { // fix is to change next(self: *Lexer)
                return "Hello";
              }
            }
            Lexer.next(); // no error
            var l = Lexer{};
            l.next(); // error
          ```
      - enum
        - error: expected type '@Type(.EnumLiteral)', found 'Tag'
          ```zig
          const Tag = enum { let };
          const t = Tag.let;
          // this does not work:
          // const tag = .let;
          const tag: Tag = .let;
          try std.testing.expectEqual(tag, t);
          ```
        - error: variable of type '@Type(.EnumLiteral)' must be const or comptime
          ```zig
          const State = {.start};
          // should be:
          // var state: State = .start;
          var state = .start;
          ```
      - other
        - optional
          - ?
        - error union
  - assignment
    - const
      - // top-level declarations are order-independent:
        - const print = std.debug.print
        - const std = @import("std");
        - const print = @import("std").debug.print;
        - const two: i32 = 1 + 1;
    - var
    - undefined
      - var
        - var a: i32 = undefined; x = 1;
      - coerced
        - to any type
        - after coerce, cannot detect that value is undefined
      - in debug mode
        - zig writes `0xaa` to undefined to catch bugs early
  - assert and error
    - assert
    - error
      - ArgNotFound
        - var number_or_error: anyerror!i32 = error.ArgNotFound
  - control flow
    - switch
      - code
        ```zig
        const c = "let";
        switch(c) {
          "let" => std.debug.print("keyword", .{});
          else => std.debug.print("else", .{});
        }
        ```
- packages
  - std
    - log
      - info
        - std.log.info("Hello", .{});
          - info: Hello
        - printed only in Debug and ReleaseSafe build modes
    - io
      - getStdOut
        - writer
          - const stdout = std.io.getStdOut().writer();
          - try stdout.print("Hello", .{});
      - bufferedReader
        - reader()
          - readUntilDelimiterOrEof()
        - code
          - var file = std.fs.cwd().openFile("file.txt", .{});
          - var buf_reader = std.io.bufferedReader(file.reader());
          - var in_stream = buf_reader.reader();
          - var buf: [1024]u8 = undefined;
          - while(try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
          - }
        - https://stackoverflow.com/questions/68368122/how-to-read-a-file-in-zig/68879352#68879352
    - debug
      - print
    - mem
      - eql
        - std.debug.print("{}", .{std.mem.eql(u8, "hello", "h\x65llo")});
      - Allocator
        - where is it used?
        - alloc()
      - tokenize()
        - var lines = std.mem.tokenize(u8, buffer, "\n"); // cannot be const
        - while(lines.next()) |line| { std.debub.print("{s}", .{ line }); }
        - returns TokenIterator
          - std.debug.print("{s}\n", .{lines});
            - std.mem.TokenIterator(u8){ .buffer = { 111, 110, 101, 61, 49, 10, 116, 119, 111, 61, 50, 10 }, .delimiter_bytes = { 10 }, .index = 0 }
        - https://github.com/ziglang/zig/blob/a4369918b19e4920f51f40a2b05781dda45462f7/tools/generate_linux_syscalls.zig#L54
      - TokenIterator
        - next()
        - https://github.com/ziglang/zig/blob/b88151e0e1553607cbebc197e1111ec4bf53a595/lib/std/mem.zig#L1882
      - startsWith
        - code
          - std.mem.startsWith(u8, "one", "on");
        - https://github.com/watzon/zhtml/blob/84f8f6964305df2038f1d1158591d944004347ca/src/parser.zig#L180
    - fs
      - cwd()
        - returns current Dir
      - Dir
        - openFile
          - openFile(sub_path, OpenMode) OpenError!File
            - try openFile("filename.txt", .{ .mode = .read_write })
      - File
        - readAll
          - readAll(buffer) Error!u64
          - vs readNoEof?
        - OpenMode (Enum)
          - read_only = 0
          - write_only = 1
          - read_write = 2
        - stat()
          - .size
            - (try file.stat()).size
        - reader(): Reader
        - Reader
          - readNoEof()
            - code
              - var buffer = try std.heap.page_allocator.alloc(u8, (try file.stat()).size);
              - try file.reader().readNoEof(buffer);
        - to read whole file to buffer of the file size
          - look at code in std.fs.File.reader()
        - to read file line by line
          - look at std.io.bufferedReader code
        - seekTo()
        - sendEndPos()
        - to clear file
          - code
            - try file.seekTo(0);
            - try file.sendEndPos(0);
      - https://stackoverflow.com/questions/70189554/how-can-you-create-a-buffer-of-the-same-size-as-a-file/72334950#72334950
    - heap
      - page_allocator: Allocator
        - page_allocator.alloc(u8, file_size)
      - ArenaAllocator
        - std.heap.AreanAllocator.init(std.testing.allocator)
        - example in std.process.argsWithAllocator
      - GeneralPurposeAllocator
        - allocator()
        - example at std.ArrayList
    - StringHashMap
      - init
        - var map = std.StringHashMap([] const u8).init(allocator); // cannot be const
          - std.heap.page_allocator
      - put
        - try map.put(key, value);
        - try map.putNoClobber(key, value);
      - iterator
        - var iterator = map.iterator();
          - HashMapUnmanaged.Iterator
        - `while(iterator.next()) |entry| { std.debug.print("{s}={s}", .{ entry.key_ptr.*, entry.value_ptr.* })}`
          - https://github.com/ziglang/zig/blob/3e2e6c108a4306ed890b3034e2ad47c8d4caf2f7/lib/std/hash_map.zig#L737
          - https://ziglang.org/documentation/master/std/#std;HashMapUnmanaged.Entry
      - https://devlog.hexops.com/2022/zig-hashmaps-explained/
    - HashMapUnmanaged
      - Iterator
        - no `reset()`? https://github.com/ziglang/zig/blob/3e2e6c108a4306ed890b3034e2ad47c8d4caf2f7/lib/std/hash_map.zig#L813
        - to string
      - Entry
        - { .key_ptr, .value_ptr }
        - https://github.com/ziglang/zig/blob/3e2e6c108a4306ed890b3034e2ad47c8d4caf2f7/lib/std/hash_map.zig#L737
        - https://ziglang.org/documentation/master/std/#std;HashMapUnmanaged.Entry
    - process
      - argsWithAllocator
        ```zig
        var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
        defer arena.deinit();
        var a = arena.allocator();
        var arg_it = std.process.argsWithAllocator(a);
        _ = arg_it.skip(); // skip own name
        var first = arg_it.next() orelse {
          std.debug.print("No first argument", .{});
          return error.InvalidArgs;
        }
        ```
        - https://github.com/ziglang/zig/blob/3e2e6c108a4306ed890b3034e2ad47c8d4caf2f7/test/cli.zig#L11
    - testing
      - allocator
      - expectEqualStrings
        - try expectEqualStrings("one", "one")
      - expectEqual
        - try expectEqual(tag1, tag2)
      - using watchexec
        - `watchexec -w lexer.zig 'echo -e "\n\n------ test run"; zig test ./lexer.zig'` or zigtestfile
    - ArrayList
      - used for concatenating string to itself
      - init()
      - writer()
        - only for ArrayList(u8)
      - appendSlice()
      - toOwnedSlice()
      - clearAndFree()
        - https://github.com/batiati/mustache-zig/blob/52738a64d7f5207a60ba4998160254b3766d0087/src/rendering/context.zig#L545
      - code
        - var gpa: std.heap.GeneralPurposeAllocator(.{}) = .{};
        - var al = std.ArrayList(u8).init(gpa.allocator());
        - defer al.deinit();
        - try al.appendSlice(e);
        - var joined = al.toOwnedSlice();
        - al.clearAndFree();
    - fmt
      - allocPrint()
        - var e = try std.fmt.allocPrint(std.heap.page_allocator, "{s}={s}", { "one", "2" });
    - ComptimeStringMap
- wasm
  - https://wasm4.org/blog/jam-2-results/
- stm32
  - https://www.kuon.ch/post/2022-09-04-stm32-crc/
