The standard library provides abstraction over file and directory creation under `std.fs`.

The main components are `Dir` and `File`.

`std.fs` provides functions to create directories using absolute paths like `makeDirAbsolute` and `makeDirAbsoluteZ` which both just take a string. But the more flexible way is to leverage the `Dir` struct, especially the one returned by the function `cwd`, which returns the current working directory, because it allows you to create relative directories and files, using its functions `makeDir`, `createFile`, or open files with `openFile`.

A simple program to create a subdirectory might look like this:

```zig
const std = @import("std");
const fs = std.fs;

pub fn main() !void {
    const cwd = fs.cwd();
    try cwd.makeDir("My Directory");
}
```

If you want to create a path like `"My Directory/Secrets"`, you should use `makePath`, which recursively calls `makeDir`.

For reading and writing files, you should familiarize yourself with the `Reader` `Writer` standard library pattern. When you have a File (returned by `Dir.createFile` for example), you can call `File.writer`, or `File.reader`, which return a `Writer` or `Reader` interface, respectively, depending upon the options set when you created the file (read write permissions).

Using the writer, you can use it's `print` method to write to it in the same fashion you use `std.debug.print`, except you do have to catch its potential error.

- https://www.reddit.com/r/Zig/comments/pdx1hh/how_do_i_create_files_and_folders_via_a_zig/
- https://ziglearn.org/chapter-2/#filesystem