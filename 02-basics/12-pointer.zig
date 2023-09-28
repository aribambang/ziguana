const expect = @import("std").testing.expect;

fn increment(num: *u8) void {
    num.* += 1;
}

test "pointer" {
    var x: u8 = 1;
    increment(&x);
    try expect(x == 2);
}

// test "panic pointer" {
//     var x: u16 = 0; // 0 or null
//     var y: *u8 = @ptrFromInt(x);
//     _ = y;
// }

// test "constant pointer" {
//     const x: u8 = 1;
//     var y = &x;

//     y.* += 1;
// }
