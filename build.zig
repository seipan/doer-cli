const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    const optimize = b.standardOptimizeOption(.{}); // 👈 関数名変更。引数追加

    const exe = b.addExecutable(.{ // 👈 setTarget と setBuildMode が合体
        .name = "doer-cli",
        // In this case the main source file is merely a path, however, in more
        // complicated build scripts, this could be a generated file.
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target, // 👈
        .optimize = optimize, // 👈
    });

    exe.install();
}
