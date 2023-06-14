```zig
const std = @import("std");
const os = std.os;
const net = std.net;

pub fn main() !void {

    const host = "127.0.0.1";
    const port: u16 = 3333;
    const addr = try std.net.Address.resolveIp(host, port);
    const sock = try os.socket(os.AF.INET, os.SOCK.STREAM, os.IPPROTO.TCP);
    const size = addr.getOsSockLen();
    const InProgress = os.ConnectError.WouldBlock;

    var flags = try os.fcntl(sock, os.F.GETFL, 0);
    flags |= os.O.NONBLOCK;
    _ = try os.fcntl(sock, os.F.SETFL, flags);

    os.connect(sock, &addr.any, size) catch |err| {
        switch (err) {
            InProgress => std.debug.print("ok\n", .{}),
            else => return err,
        }
    };

    std.time.sleep(500_000_000);

    os.getsockoptError(sock) catch |err| {
        std.debug.print("'{s}:{}': {}\n", .{host, port, err});
    };

    std.time.sleep(500_000_000);

    os.connect(sock, &addr.any, size) catch |err| {
        switch (err) {
            InProgress => std.debug.print("ok\n", .{}),
            else => return err,
        }
    };

    std.time.sleep(500_000_000);

    os.getsockoptError(sock) catch |err| {
        std.debug.print("'{s}:{}': {}\n", .{host, port, err});
    };
}
```

https://github.com/ziglang/zig/issues/13677#issuecomment-1329512265
