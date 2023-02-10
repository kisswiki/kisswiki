## http examples

- https://www.reddit.com/r/Zig/comments/xupw9d/i_want_to_run_simple_http_server_that_i_also_know/
- https://discord.com/channels/605571803288698900/1026547320340348978
- https://github.com/rofrol/mini-http-server-in-zig
- https://github.com/rofrol/http-client-zig-example
- https://github.com/MasterQ32/zig-serve/blob/master/examples/http.zig
- https://github.com/mattnite/zig-libcurl
- https://github.com/atemmel/zig-proxy
- https://github.com/rofrol/ziggetty
- https://github.com/Luukdegram/apple_pie
- https://github.com/ducdetronquito/h11
  - https://www.reddit.com/r/Zig/comments/g776wm/io_free_http11_implementation_for_zig/
- https://github.com/MasterQ32/zig-serve/blob/master/examples/http.zig
- cURL binding for Zig https://github.com/mattn/zig-curl
- A simple HTTP client library for Zig https://github.com/haze/zelda
- Basic HTTP server implementation in Zig https://github.com/Luukdegram/apple_pie
- A Http server written in Zig https://github.com/frmdstryr/zhp
- [⚡ Live Coding A Web Server in Zig ⚡ - 01 - YouTube](https://www.youtube.com/watch?v=olOJbYP0ORE)
- HTTP client for Zig 🦎 https://github.com/ducdetronquito/requestz/

## websocket

- https://github.com/nikneym/ws

## HTML

- The happy HTML parser ᕕ( ᐛ )ᕗ https://github.com/ducdetronquito/hppy

## download big file, stream, example

```zig
const std = @import("std");

// play around with this size to see different kinds of errors
var buf: [8192]u8 = undefined;

pub fn main() !void {
    const host = "ziglang.org";
    const port = 443;
    const resource = "https://ziglang.org/download/0.7.0/zig-linux-x86_64-0.7.0.tar.xz";
    const content_len = 37154432; // hardcoded, always the same

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);

    const stream = try std.net.tcpConnectToHost(arena.allocator(), host, port);
    defer stream.close();

    var ca_bundle = std.crypto.Certificate.Bundle{ };
    defer ca_bundle.deinit(arena.allocator());

    try ca_bundle.rescan(arena.allocator());

    var client = try std.crypto.tls.Client.init(stream, ca_bundle, host);

    const request = try std.fmt.bufPrint(
        &buf,
           "GET {s} HTTP/1.1\r\n"
        ++ "Host: {s}\r\n"
        ++ "Connection: close\r\n"
        ++ "\r\n",
        .{ resource, host});
    std.log.info("sending request\n----\n{s}----\n", .{request});
    try client.writeAll(stream, request);

    var total_read: usize = 0;
    const end_of_headers = blk: {
        while (true) {
            const len = try client.read(stream, buf[total_read..]);
            std.debug.assert(len != 0);
            total_read += len;

            if (std.mem.indexOf(u8, buf[0 .. total_read], "\r\n\r\n")) |eoh| break :blk eoh;
        }
    };
    std.log.info("received headers\n----\n{s}\n----\n", .{buf[0 .. end_of_headers]});

    const total_expected = end_of_headers + 4 + content_len;
    while (true) {
        const len = try client.read(stream, &buf);
        if (len == 0)
            break;
        std.log.info("got {} bytes", .{len});
        total_read += len;
    }

    if (total_read != total_expected) {
        std.log.err("expected {} bytes but got {}", .{total_expected, total_read});
        std.os.exit(0xff);
    }
    std.log.info("Success!", .{});
}
```

- https://github.com/ziglang/zig/issues/14573

## send file using curl

```zig
    const ChildProc = @import("std").ChildProcess;
    var child_proc = ChildProcess.init(
        &.{ curl_path, "--upload-file", "myfile.png", "https://server.com" },
        gpa,
    ); //curl_path can be just curl, if it is in your PATH or otherwise relative or absolute path
    try child_proc.spawn();
    const ret_val = try child_proc.wait();
    try testing.expectEqual(ret_val, .{ .Exited = 0 });
```

https://discord.com/channels/605571803288698900/1059912546892660796
