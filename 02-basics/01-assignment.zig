const std = @import("std");

pub fn main() void {
    const constant: i32 = 5;
    _ = constant;
    var variable: u2 = 5555;
    _ = variable;

    const inferred_constant = @as(i64, 44444);
    _ = inferred_constant;
    var inferred_variable = @as(u64, 123123);
    _ = inferred_variable;

    var a: i32 = undefined;
    _ = a;
    const b: i32 = undefined;
    _ = b;
}
