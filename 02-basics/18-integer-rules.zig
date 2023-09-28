const expect = @import("std").testing.expect;

const decimal_int: i32 = 10000000;
const hex_int: u8 = 0xff;
const hex_another_int: u8 = 0xFF;
const octal_int: u16 = 0o755;
const binary_int: u8 = 0b111000;

test "integer widening" {
    const a: u8 = 250;
    const b: u16 = a;
    const c: u32 = b;
    try expect(a == c);
}

test "explicit casting" {
    const x: u64 = 200;
    const y = @as(u8, @intCast(x));

    try expect(@TypeOf(y) == u8);
}

test "wrapped overflow" {
    var a: u8 = 255;
    a +%= 1;

    try expect(a == 0);
}
