const std = @import("std");

pub fn main() void {
    const array1 = [5]u8{ 'h', 'e', 'l', 'l', 'o' };
    const array2 = [_]u8{ 'w', 'o', 'r', 'l', 'd' };

    std.debug.print("length of array1 is {}\n", .{array1.len});
    std.debug.print("length of array2 is {}\n", .{array2.len});
}
