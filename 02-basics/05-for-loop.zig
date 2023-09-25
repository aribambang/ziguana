const std = @import("std");

pub fn main() void {
    const strings = [_]u8{ 'a', 'b', 'c' };

    for (strings) |character| {
        std.debug.print("character {}\n", .{character});
    }

    std.debug.print("=========\n", .{});

    for (strings, 0..) |character, index| {
        std.debug.print("character {}\n", .{character});
        std.debug.print("index {}\n", .{index});
    }

    std.debug.print("=========\n", .{});

    for (strings, 10..) |character, index| {
        std.debug.print("character {}\n", .{character});
        std.debug.print("index {}\n", .{index});
    }
}
