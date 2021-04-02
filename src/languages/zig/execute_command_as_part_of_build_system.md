how could I set it up to only execute when flash_step is called via zig build flash

build.zig:

```zig
const std = @import("std");
const Builder = std.build.Builder;
const Arch = std.Target.Cpu.Arch;
const Os = std.Target.Os;
const Abi = std.Target.Abi;
const cortex_m4 = std.Target.arm.cpu.cortex_m4;
const CpuModel = std.build.Target.CpuModel;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();

    const target = .{
        .cpu_arch = Arch.thumb,
        .cpu_model = CpuModel{ .explicit = &cortex_m4 },
        .os_tag = Os.Tag.freestanding,
        .abi = Abi.none,
    };

    const exe = b.addExecutable("firmware.elf", "src/main.zig");
    exe.setTarget(target);

    exe.setBuildMode(mode);
    exe.setLinkerScriptPath("lnk/stm32f303.ld");
    exe.setOutputDir("out");

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);

    exe.addPackagePath("mmio", "./lib/stm32f303-mmio/stm32f303.zig");

    const flash_step = b.step("flash", "Flash firmware to target");
    const flash_output = b.execFromStep(&[_][]const u8{ "touch", "test_flash" }, flash_step) catch unreachable;
}
```
